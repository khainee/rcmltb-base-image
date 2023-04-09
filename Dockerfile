FROM ubuntu:20.04

ARG TARGETPLATFORM BUILDPLATFORM DEBIAN_FRONTEND="noninteractive" PYTHONWARNINGS=ignore 

RUN --mount=type=secret,id=startup \
    bash /run/secrets/startup

# Setup Language Environments
RUN locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

RUN apt-get -y autoremove && apt-get -y autoclean
