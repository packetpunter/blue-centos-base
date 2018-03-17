FROM centos:latest
LABEL Author="John Bell, blue@jbell.xyz"
LABEL Provides="centos-base,mtr,git,nmap,tshark,perfsonar-tools,python3,ipython,scapy3k,speedtest-cli"
ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yum -y update; yum -y install git nmap epel-release tcpdump tshark
RUN yum -y update; yum -y install python34 python34-pip net-tools mtr bind-utils; yum clean all
RUN yum -y install http://software.internet2.edu/rpms/el7/x86_64/main/RPMS/perfSONAR-repo-0.8-1.noarch.rpm; yum -y install perfsonar-tools; yum clean all
RUN pip3 install speedtest-cli ipython
RUN mkdir -p /app/code/scapy
WORKDIR /app/code
RUN git clone https://github.com/phaethon/scapy.git /app/code/scapy
RUN cd /app/code/scapy; python3 setup.py install
RUN yum -y update
ENTRYPOINT ["/bin/bash"]
