# User documentation

## This project provides a containerized web stack using:

- **NGINX** — HTTPS reverse proxy (port 443), TLS enabled
- **WordPress** — PHP-based website running with PHP-FPM 8.2
- **MariaDB** — Database used by WordPress

## Start the project

Go to the root of the repository and do:

```bash
make
```

This command will:

- Builds all `images` from the `Dockerfiles`
- Creates constainers
- Starts everything in the background `(deamon)`

## Stop the project

Go to the root of the repository and do:

```bash
make down
```

This command will only stop the project, but the images are still there;

If you want to fully dedlete everything from the database and destroy the images use:

```bash
make fclean
```

## Access the website

To access the website, open your browser and go to:

```bash
https://gde-la-r.42.fr
```

## Access the administrator

To access the administrator page go to:

```bash
https://gde-la-r.42.fr/wp-admin
```

## Locate and manege the credentials

The credentials are stored inside .env file, it is located at:

```bash
./srcs/.env
```

This file includes:
- Database user and password
- Database name
- Host configuration
- WordPress admin user and password
- WordPress guest user and password
- And other information that is needed for the project

> [!NOTE]
> Never send your .env with real information to github of anywhere that is not safe!
