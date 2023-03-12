#!/bin/bash
docker-compose up &
while :
do
    read -p "(B)ackup or (D)own:" prompt
    if [[ $prompt =~ [bB](ackup)* ]]
    then
        docker run -w /var/jenkins_home --rm --volumes-from jenkinslocalhost-jenkins-1 -v $(pwd):/backup ubuntu tar czf "jenkinsbackup$(date +%Y%m%d%H%M%S).tgz" --exclude={"plugins","workspace",".cache","logs","war","secrets/master.key"} .
        docker run -w /var/jenkins_home --rm --volumes-from jenkinslocalhost-jenkins-1 -v $(pwd):/backup ubuntu cp secrets/master.key "master.key"
        mv *.tgz "$backupdir"
    elif [[ $prompt =~ [dD](own)* ]]
    then
        docker-compose down
        break
    fi
done