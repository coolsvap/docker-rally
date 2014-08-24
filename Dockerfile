FROM            coolsvap/docker-rally
MAINTAINER      Swapnil Kulkarni "coolsvap@gmail.com"

RUN echo "{\"endpoint\": {\"username\": \"admin\", \"tenant_name\": \"benchmark\", \"password\": \"password\", \"auth_url\": \"http://10.3.9.129:5000/v2.0\"}, \"type\": \"ExistingCloud\"}" > existing.json
RUN rally deployment create --filename=existing.json --name=devstack
RUN cat ~/.rally/openrc
ENTRYPOINT ["/.rally/openrc"]
RUN glance image-list
