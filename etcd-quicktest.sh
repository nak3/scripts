#!/bin/bash

# the doc: https://coreos.com/docs/distributed-configuration/etcd-api/

echo "---------"
echo "set the message"
echo "---------"
echo ""
curl -L http://127.0.0.1:4001/v2/keys/message -XPUT -d value="Hello world"
echo ""
echo ""
echo "---------"
echo "get the message"
echo "---------"
echo ""
curl -L http://127.0.0.1:4001/v2/keys/message

echo ""
echo ""
echo "---------"
echo "set from file"
echo "---------"
echo ""
echo "Hello\nWorld" > afile.txt
curl -L http://127.0.0.1:4001/v2/keys/afile -XPUT --data-urlencode value@afile.txt
echo ""
echo ""
echo "---------"
echo "get it"
echo "---------"
echo ""
curl -L http://127.0.0.1:4001/v2/keys/afile
echo ""
echo ""
