![RealWorld Example Applications](media/realworld-app.png)


 The aim of this project is to develop a Conduit app as described [here](https://github.com/gothinkster/realworld), using **Fast API** framework and poetry as the package manager, implemented in a docker container.

<br/>

# How it works

It is a simple cointainer build through a **Dockerfile**, where you first need to build a image, and then run the container. 
```
docker build -t <your_image> .

docker run -d --name <your_container> -p 80:80 <your_image>
```

Then the output app can be found on localhost:80

