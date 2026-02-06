# Hello Config - Running a Container with a Mounted File

## How to Run

```bash
docker run --rm hello-config:copy
docker run --rm -v ./config.txt:/app/config.txt hello-config:mount
```


The `-v` flag mounts your local `config.txt` file to `/app/config.txt` inside the container, and the container displays its contents.

## Expected result

- The container prints the contents of `config.txt` and exits

<br>
--------

This image needs to be built first, but that is not part of this step.  
To build the image, see build.sh