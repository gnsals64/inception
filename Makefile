up :
	mkdir -p /home/hunpark/data/db-data
	mkdir -p /home/hunpark/data/wp-data
	docker-compose -f ./srcs/docker-compose.yml up  --build

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all

clean:
	docker-compose -f ./srcs/docker-compose.yml down --v
	rm -rf /home/hunpark/data
	
re:	down
	docker system prune -af
	$(MAKE) up

.PHONY: up down re
