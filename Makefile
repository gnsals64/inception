up :
	mkdir -p /home/hunpark/data/db-data
	mkdir -p /home/hunpark/data/wp-data
	docker-compose -f ./srcs/docker-compose.yml up  --d

down:
	docker-compose -f ./srcs/docker-compose.yml down 

clean:
	docker-compose -f ./srcs/docker-compose.yml down --v
	docker system prune -af
	rm -rf /home/hunpark/data

re:	clean
	docker system prune -af
	$(MAKE) up

.PHONY: up down clean re
