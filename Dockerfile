FROM ubuntu:22.04

ARG TARGETPLATFORM BUILDPLATFORM DEBIAN_FRONTEND="noninteractive" PYTHONWARNINGS=ignore 

RUN --mount=type=secret,id=startup \
    bash /run/secrets/startup

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
