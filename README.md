# CodeAlpha DevOps Task 4: Web Server using Docker

A small static website served by NGINX in a Docker container. The image has a Docker health check, and Docker Compose provides a one-command way to build and run it.

## Requirements

- Docker Desktop or Docker Engine with the Docker Compose plugin
- A browser

## Run the project

Open a terminal in this project folder, then run:

```sh
docker compose up --build -d
```

Open [http://localhost:8080](http://localhost:8080). You should see the CodeAlpha project page.

## Check health and logs

```sh
docker compose ps
docker inspect --format='{{.State.Health.Status}}' codealpha-task4-web
docker compose logs --follow web
```

The health check requests `/health.html` from inside the container every 30 seconds. Docker reports `healthy` after a successful request, or `starting` / `unhealthy` while it cannot reach the health page.

## Container lifecycle

```sh
docker compose stop       # Stop the container and keep it
docker compose start      # Start it again
docker compose restart    # Restart it
docker compose down       # Stop and remove the container and network
docker compose up --build -d  # Rebuild after changing the site, then run
```

To run without Compose:

```sh
docker build -t codealpha-task4-web:1.0 .
docker run --name codealpha-task4-web -p 8080:80 -d codealpha-task4-web:1.0
```

## Troubleshooting

- **Port 8080 is already in use:** change the left side of `8080:80` in `docker-compose.yml`, then use that port in the browser.
- **The page does not load:** run `docker compose ps` and `docker compose logs web`; confirm Docker is running and the service is up.
- **Health is unhealthy:** check logs and confirm `site/health.html` exists, then rebuild with `docker compose up --build -d`.
- **Changes are not visible:** rebuild the image with `docker compose up --build -d`, then refresh the browser.

## Project structure

```text
.
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── README.md
└── site/
    ├── health.html
    └── index.html
```

## Task coverage

- **Containerization:** builds a custom image based on NGINX Alpine.
- **Deployment:** serves the site on host port 8080.
- **Lifecycle:** demonstrates build, run, stop, start, restart, logs, and cleanup commands.
- **Health and troubleshooting:** configures a container health check and documents common fixes.

## Submission checklist

The internship PDF asks for complete source code in a GitHub repository named `CodeAlpha_ProjectName`, a LinkedIn video explanation with the repository link, and submission through the form provided in the internship WhatsApp group. Replace `ProjectName` with a short project name (for example, `DockerWebServer`) when you create the repository. Do not publish the same LinkedIn post until you have checked any current program-specific requirements.
