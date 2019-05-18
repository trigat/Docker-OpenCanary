# Docker Opencanary
Simple Docker image for Opencanary in Ubuntu

# Overview
This image sets up Opencanary in an Ubuntu container.  Opencanary is a tool that creates honeypot services.  Alerts are sent when someone attempts to connect to one of these services.

More details can be found at http://docs.opencanary.org/en/latest/

# Instructions
Copy or Clone these files to a directory on your Docker server.

The "conf" directory contains an .opencanary.conf file that specifies services you would like to run.  You can also set up alerts through this config file.  You can leave this file the way it is for a simple example of Opencanary.

Build an image:
docker build --rm -t opencanary .

Create a container:
sudo docker run -dit -p 21:21 -p 80:80 --name opencanary-app opencanary

Issue a command to start Opencanary within the container:
docker exec -it opencanary-app bash -c 'opencanaryd --start'
