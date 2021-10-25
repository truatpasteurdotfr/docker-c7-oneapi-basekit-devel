FROM ghcr.io/truatpasteurdotfr/singularity-docker-centos7-ci:main

MAINTAINER Tru Huynh <tru@pasteur.fr>


# might need mode than base https://github.com/intel/oneapi-containers/blob/master/images/docker/os-tools-centos8/Dockerfile

RUN yum -y update && yum -y upgrade && \
        yum -y install wget bzip2 gcc gcc-c++ gcc-gfortran make && \
	yum -y clean all
RUN wget https://registrationcenter-download.intel.com/akdlm/irc_nas/17977/l_BaseKit_p_2021.3.0.3219_offline.sh -O - | \
    bash -s -- \
    --log /l_BaseKit_p_2021.3.0.3219_offline.log \
    --remove-extracted-files yes \
    -a \
     --action install \
     --cli \
     --eula accept \
     --intel-sw-improvement-program-consent decline \
     --silent

