FROM library/openjdk:8-jre-alpine

RUN adduser -u 2004 -D docker
WORKDIR /opt/docker

ADD --chown=docker:docker "target/docker/stage/opt/docker" "/tool"
ADD --chown=docker:docker Gemfile /setup/Gemfile
ADD --chown=docker:docker Gemfile.lock /setup/Gemfile.lock
ADD --chown=docker:docker .ruby-version /setup/.ruby-version
ADD --chown=docker:docker .rubocop-version /setup/.rubocop-version
ADD --chown=docker:docker src/main/resources/docs /docs

RUN \
  && echo -n "" > /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories \
  && apk add --no-cache ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json \
    ruby-bundler libstdc++ tzdata bash ca-certificates libc-dev \
  && echo 'gem: --no-document' > /etc/gemrc \
  && cd /opt/docker/setup \
  && bundle install \
  && gem cleanup \
  && rm -rf /tmp/* /var/cache/apk/*""".stripMargin

USER docker
ENTRYPOINT ["/tool/bin/codacy-rubocop"]
CMD []
