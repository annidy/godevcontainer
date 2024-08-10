ARG BASEDEV_VERSION=v0.25.0
ARG DEBIAN_VERSION=bullseye
ARG GO_VERSION=1.22


FROM golang:${GO_VERSION}-${DEBIAN_VERSION} AS go

ARG CREATED
ARG COMMIT
ARG VERSION=local
LABEL \
    org.opencontainers.image.authors="annidy@gmail.com" \
    org.opencontainers.image.created=$CREATED \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.url="https://github.com/annidy/godevcontainer" \
    org.opencontainers.image.documentation="https://github.com/annidy/godevcontainer" \
    org.opencontainers.image.source="https://github.com/annidy/godevcontainer" \
    org.opencontainers.image.title="Go Dev container Debian" \
    org.opencontainers.image.description="Go development container for Visual Studio Code Remote Containers development"
COPY --from=go /usr/local/go /usr/local/go
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
    CGO_ENABLED=0 \
    GO111MODULE=on
WORKDIR $GOPATH
# Install Debian packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ wget && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -r /var/cache/* /var/lib/apt/lists/*
# Shell setup
COPY shell/.zshrc-specific shell/.welcome.sh /root/

ENV GOPROXY https://goproxy.cn,direct

RUN go install -v github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install -v github.com/ramya-rao-a/go-outline@latest
RUN go install -v github.com/cweill/gotests/gotests@latest
RUN go install -v github.com/fatih/gomodifytags@latest
RUN go install -v github.com/josharian/impl@latest
RUN go install -v github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install -v github.com/go-delve/delve/cmd/dlv@latest
RUN go install -v honnef.co/go/tools/cmd/staticcheck@latest
RUN go install -v golang.org/x/tools/gopls@latest


# Extra binary tools
COPY --from=kubectl /bin /usr/local/bin/kubectl
COPY --from=stern /bin /usr/local/bin/stern
COPY --from=kubectx /bin /usr/local/bin/kubectx
COPY --from=kubens /bin /usr/local/bin/kubens
COPY --from=helm /bin /usr/local/bin/helm
