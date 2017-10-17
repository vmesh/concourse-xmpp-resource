FROM debian:9

RUN apt-get update && apt-get install -y --no-install-recommends jq sendxmpp \
        && rm -rf /var/lib/apt/lists/*

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/out
