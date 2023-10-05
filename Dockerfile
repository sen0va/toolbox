# Debian-based Lightweight image for running CLI tools like openssl, ping, traceroute, etc.
# Build: docker build -t sen0va/toolbox .
# Run: docker run -it --rm sen0va/toolbox
# Run: docker run -it --rm sen0va/toolbox openssl version
FROM debian:stable-slim
LABEL maintainer="Özkan Şenova"
LABEL description="Debian-based Lightweight image for running CLI tools like openssl, ping, traceroute, etc."

# Set default user to root
USER root

# Set default workdir to /root
WORKDIR /root

# Install necessary packages using apt
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        nano \
        docker.io \
        zsh \
        git \
        openssl \
        dnsutils \
        iputils-ping \
        iproute2 \
        net-tools \
        curl \
        wget \
        tcpdump \
        nmap \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install Helm
RUN curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.14.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 helm-v2.14.3-linux-amd64.tar.gz

# Install kubectx and kubens
RUN curl -LO https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx && \
    chmod +x kubectx && \
    mv kubectx /usr/local/bin/kubectx
RUN curl -LO https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens && \
    chmod +x kubens && \
    mv kubens /usr/local/bin/kubens

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set default theme to agnoster
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Set default shell to Zsh
RUN sed -i 's/\/bin\/sh/\/bin\/zsh/g' /etc/passwd

CMD ["/bin/zsh"]
