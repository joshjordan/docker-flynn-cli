FROM ubuntu
MAINTAINER josh.jordan@gmail.com

ENV FLYNN_CLI_PATH /bin/flynn

RUN apt-get update && apt-get install -y curl

RUN curl -s -A "$(uname -sp)" -L https://dl.flynn.io/cli | zcat > $FLYNN_CLI_PATH && \
    chmod +x $FLYNN_CLI_PATH

ENV CLUSTER_NAME default

RUN chmod u+x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
