*This project has been created as part of the 42 curriculum by gde-la-r.*

# Description
The **Inception** project is a deep dive into system administration and virtualization. The goal is to set up a small infrastructure composed of several services, each running in its own container, using **Docker Compose**. 

The project involves building a multi-container architecture where:
* **NGINX** acts as the secure entry point (TLSv1.2 or TLSv1.3 only).
* **WordPress** serves the web content via PHP-FPM.
* **MariaDB** manages the persistent data for the website.

All images are built from a base **Debian** image (Bookworm) to ensure a controlled and lightweight environment.

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
### To see the website go to
```bash
https://gde-la-r.42.fr
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

Docker is an open-source platform that automates the deployment of applications inside software containers. It provides an additional layer of abstraction and automation of operating-system-level virtualization.

- Efficiency: Containers share the host machine's OS kernel, requiring far fewer resources than traditional Virtual Machines.

- Isolation: Each service in this project runs as a separate process, ensuring that a vulnerability in the web server does not automatically compromise the database.

### Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. Through a docker-compose.yml file, you configure your application’s services, networks, and volumes.

- Service Discovery: Compose sets up a default network where each container is discoverable by its service name (e.g., mariadb or wordpress).

- Lifecycle Management: It manages the entire stack as a single entity, allowing for synchronized starts and stops.

### Docker Image

A Docker image is a lightweight, standalone, executable package of software that includes everything needed to run an application.

- Debian Bookworm: This project uses Debian Bookworm as the base image for all containers, ensuring a modern, secure, and stable environment.

- Build Process: Each image is built via a custom Dockerfile, ensuring that only the necessary dependencies (like nginx, php-fpm, or mariadb-server) are installed.

### Volumes & Networking

For the Inception project, data persistence and secure communication are mandatory:

- Volumes: Used to store MariaDB databases and WordPress website files. This ensures that your data is not lost when containers are stopped or deleted.

- Networks: A custom Docker network is established to allow the WordPress container to communicate with the MariaDB container over a secure, internal-only bridge.

- TLS Encryption: NGINX is configured to handle all external traffic over port 443 using TLSv1.2/v1.3, ensuring that data in transit is encrypted.

# Virtual Machines vs Docker

- VMs: Run a full Guest OS on top of a hypervisor, consuming significant RAM and CPU.

- Docker: Shares the host's kernel and uses namespaces/cgroups for isolation, making it much more lightweight and faster to boot.

# Secrets vs Environment Variables

- Environment Variables: Easy to implement but can be visible via docker inspect or process listings, making them less secure for passwords.

- Secrets: Encrypted at rest and only mounted into the container's memory at runtime (usually in /run/secrets/), providing a higher security tier for sensitive data like DB passwords.

# Docker Network vs Host Network

- Docker Network (Bridge): Provides an isolated network namespace where containers communicate via service names (e.g., mariadb). It keeps services private from the host's external ports unless explicitly mapped.

- Host Network: The container shares the host’s IP and port space directly, removing isolation but offering slightly better performance.

# Docker Volumes vs Bind Mounts

- Docker Volumes: Managed by Docker (usually in /var/lib/docker/volumes/). They are the preferred way to persist data as they are more portable and handled by the Docker engine.

- Bind Mounts: Maps a specific path on the host machine to the container. They are dependent on the host's file system structure.

# AI Usage

AI was used during this project for:

- Debugging: Assisting in the troubleshooting of NGINX configuration syntax.

- Documentation: Helping structure and refine the technical comparisons in this README.
