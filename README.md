# Tencent Cloud (DNSPod) DDNS in Docker

[GitHub link](https://github.com/AllanChain/qcloud-ddns-docker/) | [Docker Hub link](https://hub.docker.com/r/allanchain/qcloud-ddns/)

This docker will check the current IP of the machine. If the IP changes, it will update the DNS records on tencent cloud.

## Run (Docker)

```sh
docker run -it -e DDNS_RECORDS='@:A' -e DOMAIN=example.com -e TENCENTCLOUD_SECRET_ID=AKID123456 \
  -e TENCENTCLOUD_SECRET_KEY=secret-key-stuff -e TENCENTCLOUD_REGION=ap-guangzhou \
  allanchain/qcloud-ddns
```

## Run (Docker Compose)

`docker-compose.yml`:

```yaml
version: '3'
services:
  ddns:
    image: allanchain/qcloud-ddns
    container_name: qcloud-ddns
    restart: 'unless-stopped'
    env_file:
      - env.env
    network_mode: host
```

## Environments

| Name                      | Example            | Description                                                                        |
|:------------------------- |:------------------ |:---------------------------------------------------------------------------------- |
| `DDNS_RECORDS`            | `@:A *:AAAA`       | The records to modify.<br/>Should be `name@type` pair, and separated with a space. |
| `DOMAIN`                  | `example.com`      | The domain.                                                                        |
| `TENCENTCLOUD_SECRET_ID`  | `AKID123456`       |                                                                                    |
| `TENCENTCLOUD_SECRET_KEY` | `secret-key-stuff` |                                                                                    |
| `TENCENTCLOUD_REGION`     | `ap-guangzhou`     |                                                                                    |
