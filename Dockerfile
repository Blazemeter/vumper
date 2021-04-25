# Container image that runs your code
FROM alpine:3.13
RUN apk --no-cache upgrade && apk --no-cache add git sed
COPY ./vumper /usr/local/bin/vumper
ENTRYPOINT ["vumper"]
