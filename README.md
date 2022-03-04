
According to the [docker compose documentation](https://docs.docker.com/compose/compose-file/compose-file-v3/)

> If you specify image as well as build, then Compose names the built image with the webapp and optional tag specified in image:

It used to do just that, but now it just breaks.

Running this just works...
```bash
./build.sh
```

Running this fails with repository pull errors...

```bash
docker-compose build
```

The project this sample project is based off of has been virtually untouched for a couple of years, but now it's not working the way that it used to.  Docker compose seems to have a regression.
