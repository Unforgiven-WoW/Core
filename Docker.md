# Clear cache containers
``` bash
docker rmi $(docker images -f "dangling=true" -q)
```

# Build
```bash
docker build --build-arg BUILD_TAG=1.0 -t core_image .
docker build --no-cache --build-arg BUILD_TAG=1.0 -t core_image .
```

# Run the image
```bash
docker run -it core_image bash
```
