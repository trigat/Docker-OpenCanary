# Docker OpenCanary
Simple Docker image for OpenCanary in Ubuntu

# Overview
This image sets up OpenCanary in an Ubuntu container.  OpenCanary is a tool that creates honeypot services.  Alerts are sent when someone attempts to connect to one of these services.

More details can be found at http://docs.opencanary.org/en/latest/

# Instructions

The <i>conf</i> directory contains an <i>.opencanary.conf</i> file that specifies services you would like to run.  You can also set up alerts through this config file.  Leave this file the way it is for a simple example of OpenCanary.

Build an image:<br>
<b>docker build --rm -t opencanary .</b>

Create a container:<br>
<b>sudo docker run -dit -p 21:21 -p 80:80 --name opencanary-app opencanary</b>

Issue a command to start OpenCanary within the container:<br>
<b>docker exec -it opencanary-app bash -c 'opencanaryd --start'</b>

View log:<br>
<b>docker exec -it opencanary-app bash -c 'cat /var/tmp/opencanary.log'</b>
