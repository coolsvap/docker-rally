FROM		ubuntu
MAINTAINER	Swapnil Kulkarni "coolsvap@gmail.com"

RUN uname -a
RUN whoami
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/stackforge/rally.git
RUN rally/install_rally.sh
