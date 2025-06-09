FROM kicad/kicad:9.0

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget fontconfig && \
    mkdir -p /usr/share/fonts/truetype/ubuntu && \
    cd /usr/share/fonts/truetype/ubuntu && \
    wget -q https://github.com/google/fonts/raw/main/ufl/ubuntumono/UbuntuMono-Regular.ttf && \
    wget -q https://github.com/google/fonts/raw/main/ufl/ubuntumono/UbuntuMono-Bold.ttf && \
    wget -q https://github.com/google/fonts/raw/main/ufl/ubuntumono/UbuntuMono-Italic.ttf && \
    wget -q https://github.com/google/fonts/raw/main/ufl/ubuntumono/UbuntuMono-BoldItalic.ttf && \
    fc-cache -fv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
