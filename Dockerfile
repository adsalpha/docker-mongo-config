FROM       ubuntu:latest
MAINTAINER Alexander Dushkin <ads2alpha@gmail.com>

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data /data/db

# Mount /data and /etc folders for access from the host
VOLUME /data /etc

# Add configuration file
ADD ["mongod.conf","/etc"]

# Expose port #27017 from the container to the host
EXPOSE 27017

# Entrypoint
ENTRYPOINT ["mongod"]
