FROM ghcr.io/truatpasteurdotfr/singularity-docker-centos7-ci:main

MAINTAINER Tru Huynh <tru@pasteur.fr>


# might need mode than base https://github.com/intel/oneapi-containers/blob/master/images/docker/os-tools-centos8/Dockerfile
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?operatingsystem=linux&distributions=webdownload&options=offline
RUN yum -y update && yum -y upgrade && \
        yum -y install wget bzip2 gcc gcc-c++ gcc-gfortran make && \
	yum -y clean all
RUN wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18236/l_BaseKit_p_2021.4.0.3422_offline.sh && \
    bash l_BaseKit_p_2021.4.0.3422_offline.sh    \
    --log /l_BaseKit_p_2021.4.0.3422_offline.log \
    --remove-extracted-files yes \
    -a \
     --action install \
     --cli \
     --eula accept \
     --intel-sw-improvement-program-consent decline \
     --silent && \
     /bin/rm l_BaseKit_p_2021.4.0.3422_offline.sh

