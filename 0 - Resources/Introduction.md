## What is Docker?

Docker is a containerization platform that packages applications and their dependencies into isolated, standardized units called **containers**. Containers include everything an application needs to run: code, runtime, system tools, libraries, and settings.

### Key Benefits
- **Consistency**: "Works on my machine" problem solved - containers run the same on any system
- **Isolation**: Applications run independently without interfering with each other
- **Efficiency**: Lightweight compared to virtual machines, sharing the host OS kernel
- **Scalability**: Easy to deploy multiple instances of the same application
- **Portability**: Ship containers across development, testing, and production environments

## Core Concepts

### Image
A read-only template containing everything needed to run an application. Built from a `Dockerfile`.

### Container
A running instance of an image. Containers are ephemeral (temporary) by default.

### Dockerfile
A text file with instructions to build an image (like a recipe).

### Docker Hub / Registry
A repository where images are stored and can be shared.

---

## Essential Docker Commands

### Managing Containers

**Run a container**
```bash
docker run [OPTIONS] IMAGE [COMMAND]
```
Examples:
- `docker run -d --name myapp nginx` - Run nginx in detached mode
- `docker run -it ubuntu bash` - Run interactively with terminal
- `docker run -p 8080:80 nginx` - Map port 8080 (host) to 80 (container)
- `docker run -v /host/path:/container/path myapp` - Mount a volume
- `docker run -e VARIABLE=value myapp` - Set environment variables

**List containers**
```bash
docker ps              # Show running containers
docker ps -a           # Show all containers (running and stopped)
```

**Stop a container**
```bash
docker stop CONTAINER_ID  # Graceful shutdown
docker kill CONTAINER_ID  # Force shutdown
```

**Start/Restart a container**
```bash
docker start CONTAINER_ID
docker restart CONTAINER_ID
```

**Remove containers**
```bash
docker rm CONTAINER_ID           # Remove a stopped container
docker rm -f CONTAINER_ID        # Force remove (even if running)
docker container prune           # Remove all stopped containers
```

**View container logs**
```bash
docker logs CONTAINER_ID         # Show logs
docker logs -f CONTAINER_ID      # Follow logs in real-time
```

**Execute commands in a container**
```bash
docker exec -it CONTAINER_ID bash    # Open a shell
docker exec CONTAINER_ID command     # Run a single command
```

### Managing Images

**List images**
```bash
docker images                 # Show all images
docker images REPOSITORY      # Show specific images
```

**Pull/Download an image**
```bash
docker pull IMAGE_NAME
docker pull IMAGE_NAME:TAG    # Specific version
```

**Push an image**
```bash
docker push USERNAME/IMAGE_NAME
```

**Remove images**
```bash
docker rmi IMAGE_ID                  # Remove an image
docker rmi -f IMAGE_ID               # Force remove
docker image prune                   # Remove unused images
```

**Build an image from Dockerfile**
```bash
docker build -t myapp:1.0 .          # Build in current directory
docker build -t myapp:1.0 -f Dockerfile.prod .  # Specific Dockerfile
```

**Tag an image**
```bash
docker tag SOURCE_IMAGE TARGET_IMAGE
```

**Inspect an image**
```bash
docker inspect IMAGE_ID
docker history IMAGE_ID              # Show build history
```

### Docker Info & Cleanup

**System information**
```bash
docker version                # Docker version info
docker info                   # System-wide info
docker stats                  # Real-time resource usage
```

**Clean up unused resources**
```bash
docker system prune           # Remove stopped containers, unused images, networks
docker system prune -a        # More aggressive cleanup
```

### Volumes (Data Persistence)

**List volumes**
```bash
docker volume ls
```

**Create a volume**
```bash
docker volume create myvolume
```

**Remove volumes**
```bash
docker volume rm VOLUME_NAME
docker volume prune           # Remove unused volumes
```

**Mount a volume**
```bash
docker run -v myvolume:/data myapp
docker run -v /host/path:/container/path myapp  # Bind mount
```

### Networks

**List networks**
```bash
docker network ls
```

**Create a network**
```bash
docker network create mynetwork
```

**Connect a container to a network**
```bash
docker network connect mynetwork CONTAINER_ID
```

### Docker Compose (Multi-container)

**Start services**
```bash
docker compose up                    # Start services
docker compose up -d                 # Start in background
```

**Stop services**
```bash
docker compose down                  # Stop and remove
docker compose stop                  # Just stop (don't remove)
```

**View service logs**
```bash
docker compose logs -f SERVICE_NAME
```

---

## Common Docker Workflow

1. **Create a Dockerfile** defining how to build your application image
2. **Build the image** using `docker build`
3. **Test locally** with `docker run`
4. **Tag and push** to a registry using `docker tag` and `docker push`
5. **Deploy** by running containers on production servers

---

## Example: Simple Node.js App

**Dockerfile:**
```dockerfile
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

**Build and run:**
```bash
docker build -t myapp:1.0 .
docker run -p 3000:3000 myapp:1.0
```

---

## Tips & Best Practices

- Use small base images (`alpine` instead of full OS distributions)
- Run containers as non-root users when possible
- Keep images lean by minimizing layers
- Use `.dockerignore` to exclude files from the build
- Tag images with version numbers
- Use environment variables for configuration
- Keep sensitive data out of images (use Docker secrets or environment variables)

