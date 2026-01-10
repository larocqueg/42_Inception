# User documentation

## This project provides a containerized web stack using:

- **NGINX** — HTTPS reverse proxy (port 443), TLS enabled
- **WordPress** — PHP-based website running with PHP-FPM 8.2
- **MariaDB** — Database used by WordPress

## Start the project

Go to the root of the repository and run:

```bash
make
```

This command will:

- Build all `images` from the `Dockerfiles`
- Create containers
- Start everything in the background (`daemon`)

## Stop the project

Go to the root of the repository and run:

```bash
make down
```

This command will only stop the project; the images will still remain.

If you want to fully delete everything from the database and remove the images, use:

```bash
make fclean
```

## Access the website

To access the website, open your browser and go to:

```bash
https://gde-la-r.42.fr
```

## Access the administrator

To access the administrator page, go to:

```bash
https://gde-la-r.42.fr/wp-admin
```

## Locate and manage the credentials

The credentials are stored inside the `.env` file, which is located at:

```bash
./srcs/.env
```

This file includes:
- Database user and password
- Database name
- Host configuration
- WordPress admin user and password
- WordPress guest user and password
- Other information needed for the project

> [!NOTE]
> Never upload your `.env` file with real information to GitHub or anywhere that is not secure!

## How to check that all services are running

To check all running containers, use:

```bash
docker ps
```

Now verify that the output shows something similar to:

```bash
nginx       Up
wordpress   Up
mariadb     Up
```

If the output looks like this, everything is working as expected.
