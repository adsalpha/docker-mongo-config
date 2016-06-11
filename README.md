# What is this?

Here is a bunch of files which together create a MongoDB Docker container with db data accessible from the host and a custom Mongo config file.

# Prerequisites and installation

You need Docker. For Ubuntu installation, click [here](https://docs.docker.com/engine/installation/linux/ubuntulinux/).

1. SSH to your instance and execute: `git clone https://github.com/adsalpha/docker-mongo-config/ && cd docker-mongo-config`.
2. Edit the mongod.conf according to your needs. You can take mine, which opens access to the database from remote computers.
3. Build the image using `docker build -t <imagename> .`
4. Create a running container with `docker run -p 27017:27017 --name mongo -it <imagename>`

##### Why not pull from Docker Hub?
Your config file may be different from mine. You could've pulled the image, added your config to `/var/lib/volumes/.../_data`, but it's not that straighforward. However, if you think your image could be useful to someone, you're welcome to commit it.

# Accessing the database

Access your Mongo shell remotely thru `mongo <hostip>:27017` from a client computer or use a programming language driver. To get a bash shell into the container, execute `docker exec -it mongo bash`. To view server logs, do `docker attach mongo`.

Since your server is accessible from the outside, it'd also be a good idea to configure your server firewall to allow access from certain IP(s). I use UFW on Ubuntu, opening port 27017 for my VPN and 22 for my Mac and VPN.
