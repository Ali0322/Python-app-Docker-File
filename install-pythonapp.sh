docker build -t pythonapp:latest .
docker network create 2tier
docker run -d -p 3306:3306 -v mysql-data:/var/lib/mysql --network=2tier -e MYSQL_DATABASE=mydb -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin -e MYSQL_ROOT_PASSWORD=admin --name=mysql mysql:5.7
docker run -d -p 5000:5000 --network=2tier --name=pythonapp pythonapp:latest
