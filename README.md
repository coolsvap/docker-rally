docker-rally
============

Create a Docker container with Rally


Prerequisites:
--------------
- DevStack setup requires to have 1 VM/ BM machine with internet connectivity.
- Setup a fresh supported Linux installation. (Ubuntu/Fedora/CentOs)
- Install Git

Steps
-----
1. Pull the docker image coolsvap/docker-rally
```
$ docker pull coolsvap/docker-rally:latest
```
2. Create two directorie  for rally_home (for configuration files) and rally_db to backup rally database
```
$ mkdir rally_home rally_db
```
3. Run the container with following command

```
$ docker run ~/rally_home:/home/rally -v ~/rally_db:/var/lib/rally/database coolsvap/docker-rally:latest
```

4. The container will run and provide you the tempest test results in rally_home directory.

*Note:* In some case you might need to turn the selinux mode to permissive for enabling the volume support, do it with following command.

```
setenforce 0
```
