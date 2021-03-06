# base image
FROM ubuntu:precise

MAINTAINER Nabil Bendafi "nabil@bendafi.fr"

# update ubuntu image
RUN apt-get update
RUN apt-get install -y python-software-properties sudo
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update

# install Ansible
RUN apt-get install -y ansible
ADD inventory /etc/ansible/hosts

# psptoolchain Ansible role
RUN ansible-galaxy install nabilbendafi.psptoolchain
ADD psptoolchain.yml psptoolchain.yml
RUN ansible-playbook psptoolchain.yml -c local
