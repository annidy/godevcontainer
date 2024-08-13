ARG ALPINE_VERSION=3.19
ARG GO_VERSION=1.22.0


FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS go

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
    org.opencontainers.image.title="Go Dev container Alpine" \
    org.opencontainers.image.description="Go development container for Visual Studio Code Remote Containers development"
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
    CGO_ENABLED=0 \
    GO111MODULE=on
WORKDIR $GOPATH

ENV GOPROXY=https://goproxy.cn,direct

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install Alpine packages (g++ for race testing)
RUN apk add -q --update --progress --no-cache g++

RUN go install -v github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install -v github.com/ramya-rao-a/go-outline@latest
RUN go install -v github.com/cweill/gotests/gotests@latest
RUN go install -v github.com/fatih/gomodifytags@latest
RUN go install -v github.com/josharian/impl@latest
RUN go install -v github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install -v github.com/go-delve/delve/cmd/dlv@latest
RUN go install -v honnef.co/go/tools/cmd/staticcheck@latest
RUN go install -v golang.org/x/tools/gopls@latest

# # Extra binary tools
# COPY --from=kubectl /bin /usr/local/bin/kubectl
# COPY --from=stern /bin /usr/local/bin/stern
# COPY --from=kubectx /bin /usr/local/bin/kubectx
# COPY --from=kubens /bin /usr/local/bin/kubens
# COPY --from=helm /bin /usr/local/bin/helm
