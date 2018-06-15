FROM centos:latest
LABEL Author="John Bell, blue@jbell.xyz"
LABEL Provides="centos-base,mtr,git,nmap,tshark,perfsonar-tools,python3,ipython,scapy3k,speedtest-cli"
ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yum -y update; yum -y install epel-release
RUN yum -y update; yum -y install git tcpdump tshark nmap python34 python34-pip net-tools mtr bind-utils whois
RUN yum -y install http://software.internet2.edu/rpms/el7/x86_64/main/RPMS/perfSONAR-repo-0.8-1.noarch.rpm; yum -y install perfsonar-tools; yum clean all
RUN pip3 install speedtest-cli ipython scapy-python3
WORKDIR /app/code
<<<<<<< HEAD
RUN git clone https://github.com/phaethon/scapy.git /app/code/utils/scapy
RUN cd /app/code/utils/scapy; python3 setup.py install
RUN yum -y install https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/powershell-6.0.2-1.rhel.7.x86_64.rpm
RUN yum -y update
ENTRYPOINT ["/usr/bin/pwsh"]
=======
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo; yum install -y powershell
ENTRYPOINT ["/bin/bash"]
>>>>>>> fea25cff5d704dc632831f2a78d23eddf207b3ed
