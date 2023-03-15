up:
	sudo docker compose up
up_silent:
	sudo docker compose up -d

backup:
	sudo docker exec -t postgres pg_dump -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

show:
	sudo docker ps
show_all:
	sudo docker ps -a

clean:
	sudo docker compose down
	sudo docker image prune -a
	sudo docker volume prune
