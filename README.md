alpine-volume
=============

A base image to run any storage volume for a service. 

## Build

```
docker build -t rawmind/alpine-volume:<version> .
```

## Versions

- `0.0.2-4` [(Dockerfile)](https://github.com/rawmind0/alpine-volume/blob/0.0.2-4/Dockerfile).
- `0.0.1` [(Dockerfile)](https://github.com/rawmind0/alpine-volume/blob/0.0.1/Dockerfile).

## Usage

This image basically, set $SERVICE_UID and $SERVICE_GID as owners of the $SERVICE_VOLUME before to export it.

To run as sidekick of a service

```
docker run -t \
  -v <volume>:<mount-point> \
  -e "SERVICE_UID=0" \
  -e "SERVICE_GID=0" \
  -e "SERVICE_VOLUME=<mount-point>" \
  --name <service_volume> \
  rawmind/alpine-volume:<version> .
```

To run and keep alive, for example to run in k8s in a multipod deployment

```
docker run -t \
  -v <volume>:<mount-point> \
  -e "SERVICE_UID=0" \
  -e "SERVICE_GID=0" \
  -e "SERVICE_VOLUME=<mount-point>" \
  -e "KEEP_ALIVE=1" \
  --name <service_volume> \
  rawmind/alpine-volume:<version> .
```

Don't forget to add volumes_from: <service_volume> to your service definition.

These are the default value for the environment variables:
- SERVICE_UID=${SERVICE_UID:-"0"}           # UID owner of the volume
- SERVICE_GID=${SERVICE_GID:-"0"}           # GID owner of the volume
- SERVICE_VOLUME=${SERVICE_VOLUME:-"/opt"}  # Volume to own and expose
- KEEP_ALIVE="0"							# Set to 1 to keep container alive. (to run in k8s)
