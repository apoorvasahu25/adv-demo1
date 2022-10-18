# version 1

FROM centos

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN echo "sslverify=false" >> /etc/yum.conf

RUN yum update -y
RUN yum install gcc-c++ -y

COPY text.cpp /opt/text.cpp
RUN chmod a+x /opt/text.cpp
RUN gcc /opt/text.cpp -lstdc++ -o /opt/a.out
ENTRYPOINT ./opt/a.out
