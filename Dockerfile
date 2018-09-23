FROM centos:latest
LABEL Author="John Bell, blue@jbell.xyz"
LABEL Provides="centos-base,mtr,git,nmap,wireshark tools,perfsonar-tools,python3,ipython,speedtest-cli"
ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yum -y update; yum -y install epel-release
RUN yum -y update; yum -y install git tcpdump wireshark nmap python34 python34-pip net-tools mtr bind-utils whois
RUN yum -y install http://software.internet2.edu/rpms/el7/x86_64/main/RPMS/perfSONAR-repo-0.8-1.noarch.rpm; yum -y install perfsonar-tools; yum clean all
RUN pip3 install speedtest-cli ipython
WORKDIR /app/code
RUN yum -y install https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/powershell-6.0.2-1.rhel.7.x86_64.rpm
RUN yum -y update
ENTRYPOINT ["/usr/bin/pwsh"]

