FROM            fedora
MAINTAINER      Swapnil Kulkarni "me@coolsvap.net"


RUN yum update -y && \
    yum -y install git python2.7 bash-completion python-devel libffi-devel \
                       libxml2-devel libxslt1-devel libssl-devel
RUN git clone https://github.com/openstack/rally.git
RUN cd rally &&\
    ./install_rally.sh &&\
    update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10 &&\
    useradd -m rally &&\
    ln -s /usr/share/doc/rally /home/rally/rally-docs &&\
    rally-manage db recreate

ENV HOME /home/rally
WORKDIR /home/rally
ADD https://raw.githubusercontent.com/svashu/docker-rally/master/scripts/init-rally.sh /init-rally.sh
RUN chmod 755 /init-rally.sh

ENTRYPOINT ["/init-rally.sh"]
