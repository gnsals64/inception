up :
	mkdir -p /home/hunpark/data/db-data
	mkdir -p /home/hunpark/data/wp-data
	docker-compose -f ./srcs/docker-compose.yml up  --d

down:
	docker-compose -f ./srcs/docker-compose.yml down 

clean:
	$(down) --v
	rm -rf /home/hunpark/data

re:	down
	docker system prune -af
	$(MAKE) up

.PHONY: up down re
