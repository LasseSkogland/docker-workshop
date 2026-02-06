# Docker Compose - Multi-Container Application

This example demonstrates how to use Docker Compose to orchestrate multiple containers working together.

## What is Docker Compose?

Docker Compose is a tool for defining and running multi-container Docker applications. You define all your services in a `docker-compose.yml` file, and then you can start, stop, and manage all containers with simple commands.

## Setup Overview

This example includes:
- **Web Service**: Nginx web server serving static HTML
- **Database Service**: MySQL database
- **Custom Network**: Allows containers to communicate by service name
- **Volumes**: For database persistence and configuration

## How to Run

### Start the Services
```bash
docker compose up -d
```

This will:
1. Pull the required images (nginx and mysql)
2. Create a custom network called `workshop-network`
3. Create and start the web and db containers
4. Mount the volumes as specified

### View the Web Application
Open your browser and navigate to:
```
http://localhost:8080
```

### Check Container Status
```bash
docker compose ps
```

### View Logs
```bash
# All logs
docker compose logs

# Follow logs (live)
docker compose logs -f

# Logs for specific service
docker compose logs web
docker compose logs db
```

### Access the Database Container
```bash
docker compose exec db mysql -u workshop_user -p workshop_password workshop_db
```

### Stop the Services
```bash
# Stop containers (data persists)
docker compose stop

# Stop and remove containers
docker compose down

# Stop and remove everything (including volumes)
docker compose down -v
```

## Docker Compose Features Demonstrated

### 1. Multiple Services
The `services:` section defines each container needed for your application.

### 2. Port Mapping
```yaml
ports:
  - "8080:80"  # Host port : Container port
```

### 3. Volumes
- **Named Volumes**: `db_data:/var/lib/mysql` - Managed by Docker for persistent data
- **Bind Mounts**: `./html:/usr/share/nginx/html` - Maps host directories

### 4. Networks
A custom bridge network allows containers to communicate by name:
```yaml
networks:
  workshop-network:
    driver: bridge
```

### 5. Environment Variables
Configuration without hardcoding values:
```yaml
environment:
  MYSQL_ROOT_PASSWORD: rootpassword
  MYSQL_DATABASE: workshop_db
```

### 6. Dependencies
Control startup order:
```yaml
depends_on:
  - db
```

## File Structure

```
5 - Docker Compose/
├── docker-compose.yml     # Service definitions
├── config/
│   └── nginx.conf         # Nginx configuration
├── html/
│   └── index.html         # Web content
└── README.md              # This file
```

## Concepts from Previous Sections

- **Hello World**: Basic container execution (using base images)
- **Hello Config**: Configuration files mounted in containers
- **Volumes and Mounts**: Persistent storage and bind mounts
- **Networking**: Service discovery using container names
- **Docker Compose**: Orchestrating it all together

## Next Steps

Try modifying:
1. Edit `html/index.html` - Changes appear immediately due to the bind mount
2. Edit `config/nginx.conf` - Restart the web service to see changes: `docker compose restart web`
3. Add environment variables to the services
4. Add more services (like a cache service)

## Expected result

- `docker compose ps` shows `web` and `db` running
- `http://localhost:8080` serves the workshop page
