#!/bin/bash
echo "Setup des K8 Clusters. Alle K8/Docker/etcd/Flannel sowie pssh relevanten Konfigurationen"
echo "muessen im vorfeld angepasst worden sein."
echo "Dieses Setup stoppt alle vom Cluster uebernommenen Dienste und deaktiviert sie."
echo "Script kann innerhalb von 10 Sekunden abgebrochen werden [Ctrl-c]"
sleep 10

pssh -h /root/phosts -i systemctl disable kube-apiserver kube-controller-manager kube-scheduler etcd --now
sleep 10

echo "Cluster-Konfiguration beginnt."
crm configure primitive Service_IP IPaddr2\
 params ip=192.168.99.50 cidr_netmask=24 nic=eth0\
 op monitor interval=20 op start timeout=90 &&\
crm configure primitive etcd systemd:etcd\
 op monitor interval=30 op start timeout=60 meta target-role=stopped &&\
crm configure primitive kube-apiserver systemd:kube-apiserver\
 op monitor interval=60 op start timeout=70 op stop timeout=70 meta target-role=stopped &&\
crm configure primitive kube-controller-manager systemd:kube-controller-manager\
 op monitor interval=60 op start timeout=80 op stop timeout=80 meta target-role=stopped &&\
crm configure primitive kube-scheduler systemd:kube-scheduler\
 op monitor interval=60 op start timeout=90 op stop timeout=90 meta target-role=stopped &&\
crm configure group k8master_grp kube-apiserver kube-controller-manager kube-scheduler &&\
crm configure clone k8master_grp_clone k8master_grp meta interleave=true &&\
crm configure clone etcd_clone etcd &&\
crm configure colocation col_ip-on-k8master INF: Service_IP k8master_grp_clone &&\
crm configure colocation col_k8master-on-etcd INF: k8master_grp_clone etcd_clone &&\
crm configure order ord_etcd-before-k8master 0: etcd_clone k8master_grp_clone &&\
 echo "Done"

echo "Start des Clusters per:"
echo "crm resource start etcd"
echo "crm resource start k8master_grp_clone"

