FROM perl

WORKDIR /usr/src/app

RUN cpanm App::Pocoirc
RUN cpanm --notest POE::Component::IRC::Plugin::Hailo

COPY poe-component-irc-plugin-rekarma poe-component-irc-plugin-rekarma 
COPY test.yaml test.yaml

USER nobody
VOLUME ["/usr/src/app/config.yaml"]

CMD ["pocoirc", "--verbose", "--config", "config.yaml"]
