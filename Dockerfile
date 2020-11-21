FROM debian:buster
ENV VERSION v1.3.0
ENV ARCH amd64
ADD https://github.com/SudoBox-io/local-persist/releases/download/${VERSION}/local-persist-linux-${ARCH} /usr/bin/docker-volume-local-persist
RUN chmod +x /usr/bin/docker-volume-local-persist
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init
RUN mkdir -p /var/lib/docker/plugin-data/
CMD ["dumb-init", "/usr/bin/docker-volume-local-persist"]
