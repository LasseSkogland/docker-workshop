# Running a Docker Container

## The `docker run` Command

The `docker run` command is used to create and start a new container from a Docker image.

**Basic syntax:**
```bash
docker run IMAGE
```

## Example

Run the official Hello World container:
```bash
docker run --rm hello-world
```

This will pull the `hello-world` image from Docker Hub (if not already available locally) and run it.

## Expected result

- A short "Hello from Docker" message prints and the container exits

