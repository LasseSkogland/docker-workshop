# Healthcheck - Compose Service Health

This example shows how to add health checks to Docker Compose services. Health checks let Docker report whether a container is actually ready, not just running.

## What is a Healthcheck?

A health check is a command that Docker runs inside the container at intervals. The container status becomes:
- **healthy** when the command succeeds
- **unhealthy** after repeated failures

## How to Run

```bash
docker compose up -d
```

## Check Health Status

```bash
docker compose ps
```

You should see a **(healthy)** status once the checks succeed.

## Stop the Services

```bash
docker compose down -v
```

## File Structure

```
6 - Healthcheck/
├── docker-compose.yml
└── README.md
```

## Notes

- The web service uses a simple HTTP check against `http://localhost/`.
- The database service uses `mysqladmin ping` to verify MySQL is ready.
- `depends_on` with `condition: service_healthy` waits for the database health check to pass before starting the web service.

## Compose Version Note

Some Docker Compose versions ignore `condition: service_healthy` and only enforce start order. If you see that behavior, upgrade Compose or check your version with:

```bash
docker compose version
```

## Expected result

- `docker compose ps` shows the services as healthy once the checks pass
- The web service responds on `http://localhost:8081`
