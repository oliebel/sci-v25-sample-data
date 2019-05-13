etcd --name="cab1" \
  --data-dir="/var/lib/etcd/k8.etcd" \
  --listen-peer-urls="http://192.168.99.9:2380" \
  --listen-client-urls="http://192.168.99.9:2379,http://127.0.0.1:2379" \
  --initial-advertise-peer-urls="http://192.168.99.9:2380" \
  --initial-cluster="jake1=http://192.168.99.7:2380,\
elwood1=http://192.168.99.8:2380,\
cab1=http://192.168.99.9:2380" \
  --initial-cluster-state="new" \
  --initial-cluster-token="etcd-k8-cluster" \
  --advertise-client-urls="http://localhost:2379"

