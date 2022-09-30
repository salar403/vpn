FROM alpine
RUN apk add v2ray
ENV V2RAY_VMESS_AEAD_FORCED=false
CMD ["/usr/bin/v2ray", "-config", "config.json"]

