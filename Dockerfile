FROM		ubuntu
MAINTAINER	Swapnil Kulkarni "coolsvap@gmail.com"

RUN uname -a
RUN whoami
RUN sudo apt-get update
RUN sudo apt-get install git -y
RUN git clone https://github.com/stackforge/rally.git
RUN rally/install_rally.sh
