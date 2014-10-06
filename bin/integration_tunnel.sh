#!/bin/bash

MYSQL_PORT="9999"
REST_PORT="9998"
OPS_CENTER_PORT="9997"
CASSANDRA1_PORT="9996"
RABBITMQ_PORT="9995"
SQL_SERVER_PORT="9994"
CASSANDRA2_PORT="9993"
WEBUI_PORT="9980"

USAGE="Usage: $0 -u username"

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

while test $# -gt 0; do
	case "$1" in
		-u )
			shift
			if test $# -gt 0; then
				export USERNAME=$1
			fi
			shift
			;;
	esac
done

echo "Routing MySQL to port $MYSQL_PORT"
echo "Routing Iris REST API to port $REST_PORT"
echo "Routing Cassandra Ops Center to $OPS_CENTER_PORT"
echo "Routing Cassandra 1.0 terminal to $CASSANDRA1_PORT"
echo "Routing Cassandra 2.0 terminal to $CASSANDRA2_PORT"
echo "Routing RabbitMQ to $RABBITMQ_PORT"
echo "Routing Web UI to $WEBUI_PORT"

ssh -C -L $MYSQL_PORT:192.168.107.10:3306 -L $REST_PORT:192.168.107.5:8080 -L $OPS_CENTER_PORT:192.168.107.10:8888 -L $CASSANDRA1_PORT:192.168.107.10:9160 -L $RABBITMQ_PORT:192.168.107.72:15672 -L $SQL_SERVER_PORT:192.168.107.242:1433 -L $WEBUI_PORT:192.168.107.5:8081 -L $CASSANDRA2_PORT:192.168.107.223:9042 $USERNAME@107.21.48.158

if [ $? -ne 0 ]; then
	exit $?
fi

exit