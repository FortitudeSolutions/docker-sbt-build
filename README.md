
# How to use

This docker file was created specifically to build play applications but should be capable of building any application that sbt can build.  To use:

```
docker run -it --rm -v $(pwd):/project docker-sbt-build
```

This will create a docker container, mount the current directory to the project directory, and run `sbt dist` to create a production distribution.  This can be used in a docker-in-docker situation as the container to build and package the code in preparation for docker container creation
