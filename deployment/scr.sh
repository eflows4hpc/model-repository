#/bin/bash
# Ubuntu 22.04 LTS 0cdff7de-8777-492b-8b38-b6a628c266d4
# Ubuntu 20.04 LTS 23c78004-3fbe-45da-9a62-d19086e334dc

WORKER_IP=134.94.199.17
INSTANCE_ID=`openstack server create -f value -c id --prefix IMAGE_ --flavor s2 \
                --image 0cdff7de-8777-492b-8b38-b6a628c266d4 \
         	--user-data cloudinit.yml \
		--security-group ssh \
		--security-group www \
		--security-group https model_repo`
echo "Instance $INSTANCE_ID created"

while [ "`openstack server show $INSTANCE_ID -c addresses -f value`" = "{}" ]; do sleep 5; done # wait until an address is available to attach the floating ip

echo "Attaching $WORKER_IP to $INSTANCE_ID"
openstack server add floating ip $INSTANCE_ID $WORKER_IP

