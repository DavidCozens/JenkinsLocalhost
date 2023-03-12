#!/bin/bash
docker-compose up &
sleep 10
while :
do
    read -p "(B)ackup or (D)own:" prompt
    if [[ $prompt =~ [bB](ackup)* ]]
    then
        echo "Backing Up"
        docker run -w /var/jenkins_home --rm --volumes-from jenkinslocalhost-jenkins-1 -v $(pwd):/backup ubuntu tar czf "/backup/jenkinsbackup$(date +%Y%m%d%H%M%S).tgz" --exclude={"plugins","workspace",".cache","logs","war","secrets/master.key"} .
        docker run -w /var/jenkins_home --rm --volumes-from jenkinslocalhost-jenkins-1 -v $(pwd):/backup ubuntu cp secrets/master.key "/backup/master.key"
        mv *.tgz "$backupdir"
    elif [[ $prompt =~ [dD](own)* ]]
    then
        echo "Shuttting down"
        docker-compose down
        break
    fi
done