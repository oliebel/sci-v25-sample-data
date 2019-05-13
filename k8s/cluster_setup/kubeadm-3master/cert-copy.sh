CONTROL_PLANE_IPS="192.168.99.8 192.168.99.9"
PKI_DIR="/etc/kubernetes/pki"
for host in ${CONTROL_PLANE_IPS}; do
    scp $PKI_DIR/ca.crt "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/ca.key "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/sa.key "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/sa.pub "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/front-proxy-ca.crt "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/front-proxy-ca.key "${USER}"@$host:$PKI_DIR
    scp $PKI_DIR/etcd/ca.crt "${USER}"@$host:$PKI_DIR/etcd/ca.crt
    scp $PKI_DIR/etcd/ca.key "${USER}"@$host:$PKI_DIR/etcd/ca.key
    scp /etc/kubernetes/admin.conf "${USER}"@$host:/etc/kubernetes
done
