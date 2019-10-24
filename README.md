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
<b>docker run -dit -p 21:21 -p 80:80 --name opencanary-app opencanary</b>

View log:<br>
<b>docker exec -it opencanary-app bash -c 'cat /var/tmp/opencanary.log'</b>

# Kubernetes

Want to play with Kubernetes?<br>
After building your Dockerfile run this:<br>
<b>docker tag opencanary:latest dockerregistry:5000/opencanary</b><br>
<b>docker push dockerregistry:5000/opencanary</b>

Open and edit the mount path in kube-opencanary.yaml.<br>
By default, kube-opencanary.yaml is configured to create ftp and http services.<br>
Edit your ports if needed.<br>
Make sure your Docker registry is named properly.  The default is set to pull
from server dockerregistry:5000.

Run:<br>
<b>kubectl create -f kube-opencanary.yaml</b><br>
<b>kubectl create -f kube-opencanary-service.yaml</b>

Your pod should now be running.  Check the status with:<br>
<b>kubectl get all</b><br>
<b>kubectl describe pods</b>

Get your pod name and use it to enter the shell:<br>
<b>kubectl get pods</b><br>
<b>kubectl exec -it opencanary-xxxxxxxxxx-xxxxx bash</b>

Start OpenCanary and your are finished.<br>
<b>opencanaryd --start</b><br>
<b>exit</b>

View logs:<br>
<b>docker exec -it opencanary-app sh -c 'cat /var/tmp/opencanary.log'</b>
