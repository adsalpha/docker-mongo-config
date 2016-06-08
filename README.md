# What is this?

Here is a bunch of files which together create a MongoDB Docker container with Docker volume data accessible from the host and a custom Mongo config file.

It's built for remote access to Mongo from a client computer.

# Prerequisites and installation

First of all, SSH to your instance and execute: `git clone https://github.com/adsalpha/docker-mongo-config/ && cd docker-mongo-config`.

Modify the downloaded config file (`mongod.conf`) according to your needs, add bindIp's or whatever. Build your image with `docker build -t <imgname> .`. Then, run the container: `docker run --name mongo -p 27017:27017 -it <imgname>`. Exit from it using the escape sequence `Ctrl-P Ctrl-Q`

##### Why not pull from Docker Hub?
Your config files may be different from mine. You could've pulled the image, added your config to /var/lib/volumes/.../_data, but it's not that straighforward. However, if you think your image could be useful to someone, you're welcome to commit it to Docker Hub.

# Accessing the database

Access your mongo shell remotely thru `mongo <hostip>:27017` from a client computer. To get a bash shell into the container, execute `docker exec -it mongo bash`.
