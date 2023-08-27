FROM debian:bullseye

RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
        curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
        add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" && \
        apt-get update && \
        apt-get install -y docker-ce docker-ce-cli containerd.io && \
        curl -L "

COPY ./inception /home/inception

# # Expose the ports
EXPOSE 80 443

STOPSIGNAL SIGQUIT


