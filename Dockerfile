FROM tiredofit/alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

RUN apt purge zabbix*
### Set Environment Variables
   ENV ENABLE_SMTP=FALSE

### Dependencies
   RUN apk update && \
       apk add \
       	   mysql-client \
    	   bzip2 \  
    	   xz && \
       rm -rf /var/cache/apk/* 

### S6 Setup
   ADD install/s6 /etc/s6

### Entrypoint Configuration  
   ENTRYPOINT ["/init"]

