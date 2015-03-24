#!/bin/sh

IPADDR_=$(ifconfig eth0|grep inet|awk '{print $2}'|cut -d: -f2)

systemctl start etcd; systemctl enable etcd

cat << EOF > flannel-config.json
{
    "Network": "18.0.0.0/16",
    "SubnetLen": 24,
    "Backend": {
        "Type": "vxlan",
        "VNI": 1
     }
}
EOF


curl -L http://${IPADDR_}:4001/v2/keys/coreos.com/network/config -XPUT --data-urlencode value@flannel-config.json

# check
curl -L http://${IPADDR_}:4001/v2/keys/coreos.com/network/config


#sed -i 's/#FLANNEL_OPTIONS=""/FLANNEL_OPTIONS="eth0"/g' /etc/sysconfig/flanneld
#Change FLANNEL_ETCD="http://${IPADDR_}:4001" to 192..... in flanneld

systemctl enable flanneld

#systemctl restart
# docker run -it fedora:20 bash
