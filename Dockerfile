# Container image that runs your code
FROM alpine:3.13

# Install git package
RUN apk --no-cache upgrade \
 && apk --no-cache add git sed

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./bumper /usr/local/bin/bumper

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["bumper"]
