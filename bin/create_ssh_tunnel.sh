#! /bin/bash

createTunnel() {
    /usr/bin/ssh -N -i /home/jwh/.ssh/old_id_rsa -R 2223:localhost:22 laydros@laydros.org
    if [[ $? -eq 0 ]] 
    then
        echo Tunnel to jumpbox created successfully
    else
        echo An error occured creating a tunnel to jumpbox. RC was $?
    fi
}
/bin/pidof ssh
if [[ $? -ne 0 ]] 
then
    echo Creating new tunnel connection
    createTunnel
fi
