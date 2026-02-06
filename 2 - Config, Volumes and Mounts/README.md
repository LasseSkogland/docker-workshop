# Config, Volumes and Mounts

Docker containers are ephemeral by default. When a container is removed, any data written inside it is gone. Volumes and mounts provide a way to persist and share data between containers and the host system.

## Why use volumes?

- Persist data beyond the lifetime of a container.
- Share data between multiple containers.
- Keep container images immutable while data changes.

## Mount types (overview)

- **Named volumes**: Managed by Docker. Good default for persistent app data.
- **Bind mounts**: Map a host path into a container. Useful for local development.
- **Tmpfs mounts**: Store data in memory only. Data is lost when the container stops.

## Basic Examples

Create and use a named volume:

```bash
# Create a named volume
docker volume create app-data

# Run a container with the volume mounted
docker run --rm -it -v app-data:/data alpine sh
```

Bind-mount a local folder:

```bash
# Use the current folder as /app in the container
docker run --rm -it -v "$PWD":/app alpine sh
```

## Practical Example - Running with Config File

```bash
docker run --rm hello-config:copy
docker run --rm -v ./config.txt:/app/config.txt hello-config:mount
```

The `-v` flag mounts your local `config.txt` file to `/app/config.txt` inside the container, and the container displays its contents.

## Expected result

- You get a shell in the container, and the mounted paths appear at `/data` or `/app`
- The container prints the contents of `config.txt` and exits

## Quick tips

- Prefer named volumes for production data.
- Use bind mounts for local development and live editing.
- Inspect volumes with `docker volume ls` and `docker volume inspect <name>`.

## Building the example image

This image needs to be built first. To build the image, see build.sh