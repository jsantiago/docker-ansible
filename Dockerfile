FROM ubuntu:saucy

RUN apt-get -qq update
RUN apt-get install -y ansible

ADD inventory /etc/ansible/hosts

RUN mkdir -p /opt/docker-ansible
WORKDIR /opt/docker-ansible
ADD playbook.yml /opt/docker-ansible/

CMD ["ansible-playbook", "/opt/docker-ansible/playbook.yml"]
