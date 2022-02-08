# JenkinsLocalhost

Docker-compose for launching jenklins on localhost.

Running on a localhost configuration isn't recommended, it is preferable to have a fixed
DNS name or IP address for the server. I run jenkins sometimes on my laptop using wsl2 and I use this script to bring the server up and down. It has to be executed from a linux shell that is integrated with docker desktop.

To bring up a jenkins host clone this repo and then from the cloned folder execute

 > docker-compose up &

use

> docker-compose down

to stop the jenkins server. It is a good idea to use the jenkins GUI to make the server ready to shutdown (i.e. prevent it from running jobs.)

After launching jenkins can be accessed at http://localhost:8080/

jenkins home is mounted on a docker volume  **jenkins_home** 