
#!/bin/sh

for i in `docker ps -a | awk '{print $NF}' | grep postgresql- | sort -t '-' -k 2 -n`
do
	echo -e "\033[01;34m[$i]\033[00m"
	docker exec -e "COLUMNS=$COLUMNS" -it -e PGUSER=postgres -e PGDATABASE=template1 $i "$@"
	echo "================================================================================"
done
