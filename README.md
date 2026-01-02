*This project has been created as part of the 42 curriculum by gde-la-r.*

## Description
The **Inception** project is a deep dive into system administration and virtualization. The goal is to set up a small infrastructure composed of several services, each running in its own container, using **Docker Compose**. 

The project involves building a multi-container architecture where:
* **NGINX** acts as the secure entry point (TLSv1.2 or TLSv1.3 only).
* **WordPress** serves the web content via PHP-FPM.
* **MariaDB** manages the persistent data for the website.

All images are built from a base **Debian** image (Buster or Bullseye) to ensure a controlled and lightweight environment.

## Instructions

### Compilation and Execution
To launch the infrastructure, navigate to the root of the project and use the provided `Makefile`:

```bash
# To build and start the containers in detached mode
make

# To stop the containers
make down

# To remove containers, networks, and images
make clean

# To remove containers, networks, images, and ALL volumes (database reset)
make fclean

Network Access

Once the containers are running, you can access the WordPress site via your browser at: https://<login>.42.fr (ensure your /etc/hosts file is configured to map this domain to 127.0.0.1).
Project Design & Comparison
Design Choices

    Base Image: I chose Debian as the base image for all Dockerfiles to comply with the project requirement of using a "predictable" and stable environment.

    Entrypoints: Custom shell scripts (mariadb-run.sh and wp-install.sh) are used to initialize databases and download WordPress dynamically only if they don't already exist, ensuring the project is "restart-friendly."

    Inter-container Communication: Containers communicate over a dedicated internal Docker network, keeping the database shielded from the public internet.

Technical Comparisons
Topic	Comparison
Virtual Machines vs Docker	VMs virtualize the hardware and require a full Guest OS. Docker virtualizes the OS kernel, making containers much faster to start and lighter on system resources.
Secrets vs Env Variables	Environment Variables are easy to use but can be leaked via docker inspect. Secrets are more secure as they are encrypted and only accessible to the container at runtime.
Docker Network vs Host Network	Docker Network provides an isolated bridge for containers to talk to each other. Host Network removes isolation, making the container use the host's network stack directly.
Docker Volumes vs Bind Mounts	Volumes are managed by Docker and are better for performance and backups. Bind Mounts link a specific host path to the container, which is useful for development.
Resources
Documentation & Articles

    Official Docker Documentation

    NGINX Configuration Guide

    WP-CLI Handbook

    Understanding TLS/SSL Certificates

Use of AI

AI was utilized in this project for the following specific tasks:

    Scripting Logic: Assisting in the creation of the wp-install.sh script to handle the WP-CLI commands and verification of existing files.

    Troubleshooting: Debugging the NGINX SSL configuration and explaining the differences between FastCGI parameters.

    Documentation: Generating the structure and comparison tables for this README.md to ensure all 42 curriculum requirements were met.
