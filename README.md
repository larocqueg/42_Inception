*This project has been created as part of the 42 curriculum by gde-la-r.*

# Description
The **Inception** project is a deep dive into system administration and virtualization. The goal is to set up a small infrastructure composed of several services, each running in its own container, using **Docker Compose**. 

The project involves building a multi-container architecture where:
* **NGINX** acts as the secure entry point (TLSv1.2 or TLSv1.3 only).
* **WordPress** serves the web content via PHP-FPM.
* **MariaDB** manages the persistent data for the website.

All images are built from a base **Debian** image (Buster or Bullseye) to ensure a controlled and lightweight environment.

# Instructions

## Installation
```bash
git clone https://github.com/larocqueg/42_Inception.git && cd 42_Inception
```

## Compilation and Execution
### To build and start the containers in detached mode
```bash
make
```

### To stop the containers
```bash
make down
```
### To remove containers, networks, and images
```bash
make clean
```
### To do a database reset (deletes every image and container)
```bash
make fclean 
```
# Resources
### Docker
Docker isolates each service in a container

### Docker compose

### Docker image
