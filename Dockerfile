FROM            ubuntu
MAINTAINER      Swapnil Kulkarni "coolsvap@gmail.com"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/stackforge/rally.git
RUN rally/install_rally.sh
RUN echo "{\"endpoint\": {\"username\": \"admin\", \"tenant_name\": \"benchmark\", \"password\": \"password\", \"auth_url\": \"http://10.3.9.129:5000/v2.0\"}, \"type\": \"ExistingCloud\"}" > existing.json
RUN rally deployment create --filename=existing.json --name=devstack
ENV OS_AUTH_URL http://10.3.9.129:5000/v2.0
ENV OS_USERNAME admin
ENV OS_PASSWORD password
ENV OS_TENANT_NAME benchmark 
RUN glance image-list
