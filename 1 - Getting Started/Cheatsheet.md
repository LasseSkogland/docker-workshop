# Docker Cheatsheet

## Quick Reference

### CONTAINERS
| Command | Description |
|---------|-------------|
| `docker run IMAGE` | Create and run a container |
| `docker run -d IMAGE` | Run in background (detached) |
| `docker run -it IMAGE bash` | Interactive terminal |
| `docker run -p 8080:80 IMAGE` | Map ports (host:container) |
| `docker run -v /host:/container IMAGE` | Mount volume |
| `docker run --name NAME IMAGE` | Name the container |
| `docker run -e VAR=value IMAGE` | Set environment variable |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker stop CONTAINER` | Stop container (graceful) |
| `docker kill CONTAINER` | Stop container (force) |
| `docker start CONTAINER` | Start stopped container |
| `docker restart CONTAINER` | Restart container |
| `docker rm CONTAINER` | Delete stopped container |
| `docker rm -f CONTAINER` | Force delete container |
| `docker logs CONTAINER` | View container logs |
| `docker logs -f CONTAINER` | Follow logs (real-time) |
| `docker exec -it CONTAINER bash` | Open shell in container |
| `docker exec CONTAINER CMD` | Run command in container |
| `docker inspect CONTAINER` | Show container details |
| `docker stats` | Real-time resource usage |

### IMAGES
| Command | Description |
|---------|-------------|
| `docker images` | List all images |
| `docker pull IMAGE` | Download image from registry |
| `docker push USERNAME/IMAGE` | Upload image to registry |
| `docker build -t NAME:TAG .` | Build image from Dockerfile |
| `docker tag SOURCE TARGET` | Tag an image |
| `docker rmi IMAGE` | Delete image |
| `docker history IMAGE` | Show image layers |
| `docker inspect IMAGE` | Show image details |

### VOLUMES
| Command | Description |
|---------|-------------|
| `docker volume ls` | List volumes |
| `docker volume create NAME` | Create volume |
| `docker volume rm NAME` | Delete volume |
| `docker volume prune` | Remove unused volumes |

### NETWORKS
| Command | Description |
|---------|-------------|
| `docker network ls` | List networks |
| `docker network create NAME` | Create network |
| `docker network connect NET CONTAINER` | Connect container to network |

### SYSTEM
| Command | Description |
|---------|-------------|
| `docker version` | Show version info |
| `docker info` | Show system info |
| `docker system prune` | Remove unused resources |
| `docker system prune -a` | Aggressive cleanup |

### DOCKER COMPOSE
| Command | Description |
|---------|-------------|
| `docker-compose up` | Start services |
| `docker-compose up -d` | Start in background |
| `docker-compose down` | Stop and remove services |
| `docker-compose stop` | Stop services (don't remove) |
| `docker-compose logs -f` | Follow logs |
| `docker-compose exec SERVICE CMD` | Run command in service |

---

## Common Options

| Option | Description |
|--------|-------------|
| `-d` | Detached mode (background) |
| `-it` | Interactive + terminal |
| `-p HOST:CONTAINER` | Port mapping |
| `-v HOST:CONTAINER` | Volume mount |
| `-e VAR=VALUE` | Environment variable |
| `--name NAME` | Container name |
| `-f FILE` | Specify file (Dockerfile, docker-compose.yml) |
| `-a` | Show all (containers, images, etc.) |

---

## Useful Patterns

**Remove all stopped containers:**
```bash
docker container prune
```

**Remove all dangling images:**
```bash
docker image prune
```

**Copy files between host and container:**
```bash
docker cp FILE CONTAINER:/path          # Host to container
docker cp CONTAINER:/path FILE          # Container to host
```

**Save and load images:**
```bash
docker save IMAGE > image.tar           # Save image to file
docker load < image.tar                 # Load image from file
```

**View container IP:**
```bash
docker inspect -f '{{.NetworkSettings.IPAddress}}' CONTAINER
```

**Run as different user:**
```bash
docker run -u username IMAGE
```

**Limit resources:**
```bash
docker run -m 512m --cpus 1 IMAGE       # 512MB RAM, 1 CPU
```

---

## Dockerfile Basics

| Instruction | Purpose |
|-------------|---------|
| `FROM IMAGE` | Base image |
| `WORKDIR /path` | Set working directory |
| `COPY src dest` | Copy files from host |
| `RUN command` | Execute command |
| `EXPOSE PORT` | Document exposed port |
| `ENV VAR value` | Set environment variable |
| `CMD ["cmd"]` | Default command |
| `ENTRYPOINT ["cmd"]` | Container entry point |

---

## Tips

- Use `.dockerignore` to exclude files from build
- Tag images with versions: `docker build -t myapp:1.0 .`
- Use `alpine` base images for smaller sizes
- One process per container (best practice)
- Build frequently, tag everything

