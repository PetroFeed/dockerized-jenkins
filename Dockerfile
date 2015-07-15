FROM jenkins:1.596.2
# https://github.com/cloudbees/jenkins-ci.org-docker/blob/master/Dockerfile

ADD ./scripts/install_docker.sh /tmp/install_docker.sh
USER root
RUN DOCKER_USER=jenkins /tmp/install_docker.sh
USER jenkins

ADD ./jenkins/bin /usr/local/bin
ADD ./jenkins/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ENV DOCKER_HOST=/tmp/docker.sock
ENV JAVA_OPTS "${JAVA_OPTS} -Dfile.encoding=UTF-8"
