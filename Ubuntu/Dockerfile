FROM            ubuntu:14.04
MAINTAINER      Swapnil Kulkarni "me@coolsvap.net"


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install git python2.7 bash-completion python-dev libffi-dev \
                       libxml2-dev libxslt1-dev libssl-dev
RUN git clone https://github.com/openstack/rally.git
RUN cd rally &&\
    ./install_rally.sh &&\
    update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10 &&\
    useradd -m rally &&\
    ln -s /usr/share/doc/rally /home/rally/rally-docs &&\
    rally-manage db recreate

ENV HOME /home/rally
WORKDIR /home/rally
COPY scripts/init-rally.sh /init-rally.sh
RUN chmod 755 /init-rally.sh

ENTRYPOINT ["/init-rally.sh"]

