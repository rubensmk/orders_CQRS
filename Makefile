MONGO_CONTAINER_NAME=mongodb-3.0
MYSQL_CONTAINER_NAME=mysql-8.0
API_CONTAINER_NAME=api

.PHONY: up down mongo-bash mysql-bash api console

up:
	@echo "Starting all containers..."
	docker compose up

down:
	@echo "Stopping all containers..."
	docker compose down

mongo-bash:
	@echo "Opening bash in MongoDB container..."
	docker exec -it $(MONGO_CONTAINER_NAME) bash

mysql-bash:
	@echo "Opening MySQL client in MySQL container..."
	docker exec -it $(MYSQL_CONTAINER_NAME) mysql -u root -p

api:
	@echo "Opening Rails api container..."
	docker exec -it $(API_CONTAINER_NAME) bash

console:
	@echo "Opening Rails api container..."
	docker exec -it $(API_CONTAINER_NAME) rails c
