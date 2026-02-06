# Docker Networking

Docker networking allows containers to communicate with each other and with the outside world. By default, Docker provides some basic networking capabilities out of the box.

## Key Concepts

### Network Types

Docker supports several types of networks:

- **Bridge Network** (default): Containers are connected to a virtual bridge and can communicate with each other using container names as hostnames
- **Host Network**: Container uses the host's network stack directly
- **None Network**: Container has no network connectivity
- **Overlay Network**: For connecting containers across multiple Docker hosts (used in Docker Swarm)
- **Macvlan Network**: Allows containers to have their own MAC addresses and appear as physical devices on the network

### Container Communication

When containers are on the same network, they can communicate with each other using:
- Container names (Docker's internal DNS resolves container names to IP addresses)
- IP addresses (each container gets its own IP on the network)

## Basic Example

```bash
# Create a custom bridge network
docker network create my-network

# Run containers on the network
docker run --rm -d --name web --network my-network nginx
docker run --rm -d --name db --network my-network mysql

# Now 'web' container can reach 'db' container using the name 'db'
```

## Publishing Ports

To make a container accessible from outside Docker, you need to publish ports:

```bash
# Publish port 8080 on the host to port 80 in the container
docker run --rm -p 8080:80 nginx
```

## Expected result

- The containers on `my-network` can reach each other by name, and `http://localhost:8080` serves the nginx welcome page

## Common Commands

- `docker network ls` - List all networks
- `docker network create <name>` - Create a new network
- `docker network inspect <name>` - View details about a network
- `docker network connect <network> <container>` - Connect a running container to a network
- `docker network disconnect <network> <container>` - Disconnect a container from a network