FROM kicad/kicad:9.0

USER root

RUN apt-get update && \
    apt-get install -y fonts-ubuntu && \
    fc-cache -fv && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
