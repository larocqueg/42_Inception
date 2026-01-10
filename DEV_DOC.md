# Developer documentation

This documentation explains in a short way how to set up the environment from scratch.

## Prerequisites

Ensure all prerequisites are installed before building the project:

- `Docker`
- `Docker Compose`
- `Clang`
- `Make`
- `Git`
> [!NOTE]
> Check docker and docker compose documentation to download them correctly ```https://docs.docker.com/compose/install/```

### Configuration & Secrets

The project relies on environment variables stored in a `.env` file.

1. Navigate to `./srcs/`.
2. Create a `.env` file based on the provided template (if available) or the manual requirements.
3. Required variables include:
   - `SQL_DATABASE`, `SQL_USER`, `SQL_PASSWORD`, `SQL_ROOT_PASSWORD`
   - `WP_ADMIN_USER`, `WP_ADMIN_PASSWORD`, `WP_USER`, `WP_PASSWORD`
   - `DOMAIN_NAME` (e.g., gde-la-r.42.fr)

## Build and launch

### To build the project, use:
```bash
make
```
This command will build all images and create the containers.

### To stop containers and the network, use:
```bash
make down
```

### To start everything again:
```bash
make up
```

### To remove containers, networks, and images:
```bash
make clean
```

To remove everything:
```bash
make fclean
```

### To remove everything and rebuild the project:
```bash
make re
```
This command triggers `make fclean` followed by `make`.

## Useful commands to manage containers and volumes

```bash
docker ps
```
Lists all active containers.

```bash
docker compose down -v
```
Removes containers and volumes.

### The following commands allow you to access container shells

```bash
docker exec -it mariadb bash
```
```bash
docker exec -it wordpress bash
```
```bash
docker exec -it nginx bash
```

## Project files

### WordPress files:
```bash
/home/gde-la-r/data/wordpress
```

### MariaDB files:
```bash
/home/gde-la-r/data/mariadb
```

### This allows:

- Full environment recreation
- No data loss when containers are deleted
- Easy backup from the host machine
