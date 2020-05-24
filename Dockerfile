FROM debian:latest

COPY metasploit-framework.gpg.key /

RUN apt-get update && \
    apt-get install --no-install-recommends -y gnupg && \
    echo "deb http://downloads.metasploit.com/data/releases/metasploit-framework/apt buster main" > /etc/apt/sources.list.d/metasploit-framework.list && \
    apt-key add /metasploit-framework.gpg.key && \
    apt-get update && \
    apt-get install --no-install-recommends --allow-downgrades -y metasploit-framework && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["msfconsole", "-q"]