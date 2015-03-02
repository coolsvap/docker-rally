docker-rally
============

Create a Docker container with Rally


Prerequisites:
--------------
- This setup requires to have 1 VM/ BM machine with internet connectivity.
- Setup a fresh supported Linux installation. (Ubuntu/Fedora/CentOs)
- Install git, docker

Steps
-----
1. Pull the docker image coolsvap/docker-rally
```
$ docker pull coolsvap/docker-rally:latest
```
2. Create two directories  for rally_home (for configuration files) and rally_db to backup rally database
```
$ mkdir rally_home rally_db
```
3. Create a file deployment.json in rally_home directory with following details

{
"type": "ExistingCloud",
"auth_url": "keystone-auth-url",
"admin": {
    "username": "username",
    "password": "password",
    "tenant_name": "tenant-name"
}
}

Replace the values for keystone-auth-url, username, password, and tenant-name as per deployment.

4. Run the container with following command, provide path to rally_home and rally_db directories created in previous command

```
$ docker run [PATH to rally_home]:/home/rally -v [PATH to rally_db]:/var/lib/rally/database coolsvap/docker-rally:latest
```

4. The container will run and provide you the tempest test results in rally_home directory.

*Note:* In some case you might need to turn the selinux mode to permissive for enabling the volume support, do it with following command.

```
setenforce 0
```
