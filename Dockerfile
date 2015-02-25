FROM            ubuntu:14.04
MAINTAINER      Swapnil Kulkarni "coolsvap@gmail.com"


RUN apt-get update && \
    apt-get -y install git python2.7 bash-completion python-dev libffi-dev \
                       libxml2-dev libxslt1-dev libssl-dev
                       
RUN git clone https://github.com/stackforge/rally.git
RUN cd rally &&\
    ./install_rally.sh &&\
    apt-get -y remove libssl-dev libffi-dev python-dev libxml2-dev \
                      libxslt1-dev build-essential gcc-4.8 python3 && \
    apt-get -y autoremove &&\
    apt-get clean &&\
    mv doc /usr/share/doc/rally &&\
    rm -fr /tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\
    update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10 &&\
    useradd -m rally &&\
    ln -s /usr/share/doc/rally /home/rally/rally-docs &&\
    rally-manage db recreate
    
USER rally
CMD chown rally:rally /home/rally
ENV HOME /home/rally
WORKDIR /home/rally
ENTRYPOINT ["/bin/bash"]
