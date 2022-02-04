![RealWorld Example Applications](media/realworld-app.png)


 The aim of this project is to develop a Conduit app as described [here](https://github.com/gothinkster/realworld), using **Fast API** framework and poetry as the package manager, implemented in a docker container.

<br/>

# How it works

It is a simple cointainer build through a **Dockerfile**, and initializaed using docker-compose, wich loads the PostgresSQL database and the application within a container, with the following command:
```
docker-compose up # include <service-name> at the end to initialize only one service
```


The database can be accessed when the container is running:
```
docker exec -it pg-dev psql "host=localhost port=5439 user=docker dbname=docker"
```
And to enter in the container's bash:
```
docker exec -it <nome_container> /bin/bash # entra no bash do container
```

Then the output app can be found on localhost:80

