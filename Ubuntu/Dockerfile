FROM            ubuntu:14.04
MAINTAINER      Swapnil Kulkarni "me@coolsvap.net"


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install git python-dev bash-completion python-dev libffi-dev \
                       libxml2-dev libxslt1-dev libssl-dev build-essential libpq-dev wget python-pip
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
