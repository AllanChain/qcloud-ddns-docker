FROM python:3.9-alpine

RUN apk add --no-cache curl bash
RUN pip3 install tccli --no-cache-dir

COPY src/ /workspace
COPY cronjobs /etc/crontabs/root

CMD ["bash", "/workspace/entrypoint.sh"]
