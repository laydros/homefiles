#! /bin/bash

createTunnel() {
    /usr/bin/ssh -L 0.0.0.0:1433:10.0.0.238:1433 -i ~/.ssh/old_id_rsa root@10.0.0.125
    if [[ $? -eq 0 ]] 
    then
        echo "Tunnel for SQL Server to burn3 created successfully"
    else
        echo "An error occured creating a tunnel to burn3 RC was $?"
    fi
}
/bin/pidof ssh
if [[ $? -ne 0 ]] 
then
    echo Creating new tunnel connection
    createTunnel
fi
