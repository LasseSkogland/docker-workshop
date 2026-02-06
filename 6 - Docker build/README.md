# Docker build and Dockerfile basics

This section is a short, practical intro to building images with `docker build` and the most common Dockerfile instructions.

## The `docker build` command

`docker build` turns a directory (the build context) into a Docker image.

Basic form:

```
docker build -t my-image:1.0 .
```

What this does:

- Uses the current directory as the build context (`.`).
- Looks for a `Dockerfile` in that directory.
- Builds an image and tags it as `my-image:1.0`.

Common options:

- `-t name:tag` sets the image name and tag.
- `-f path/to/Dockerfile` uses a non-default Dockerfile name or location.
- `--no-cache` rebuilds without using any cached layers.
- `--pull` always attempts to pull a newer base image.

Example with a custom Dockerfile:

```
docker build -f Dockerfile.dev -t my-app:dev .
```

## Dockerfile syntax (quick overview)

A Dockerfile is a list of instructions. Each instruction creates a layer in the image.

Minimal example:

```
FROM alpine:3.19
WORKDIR /app
COPY . .
RUN echo "Hello from the image" > /app/hello.txt
CMD ["cat", "/app/hello.txt"]
```

Common instructions:

- `FROM` sets the base image. Must be first.
- `WORKDIR` sets the working directory for subsequent instructions.
- `COPY` copies files from the build context into the image.
- `RUN` executes a command at build time.
- `CMD` sets the default command at container start.
- `ENTRYPOINT` sets the main command (often combined with `CMD`).
- `EXPOSE` documents a port the container intends to listen on.
- `ENV` sets environment variables inside the image.

## Build context and `.dockerignore`

The build context is everything in the directory you pass to `docker build`.
Use a `.dockerignore` file to exclude files that are not needed in the image (for example: `node_modules`, build output, or secrets). This keeps builds fast and images small.

## Environment variables (Module 7)

This module uses Azure credentials from a local `.env` file.

1. Copy `.env.example` to `.env` in this folder.
2. Fill in `AZURE_TENANT_ID`, `AZURE_CLIENT_ID`, and `AZURE_CLIENT_SECRET`.

## Simple example flow

1. Write a Dockerfile in your project folder.
2. Build the image:

```
docker build -t my-app:1.0 .
```

3. Run a container from the image:

```
docker run --rm my-app:1.0
```

That is the core workflow: Dockerfile -> `docker build` -> `docker run`.

## Docker Compose build and run

This folder also includes a `docker-compose.yml` that builds and runs the image.

Build the image:

```
docker compose build
```

Run the container:

```
docker compose up
```

## Expected result

- The image builds successfully
- The container runs and the PowerShell script prints your subscriptions
