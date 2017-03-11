FROM elixir

RUN set -ex \
    && apt-get update \
    && apt-get install -y curl imagemagick

COPY policy.xml /etc/ImageMagick-6/

RUN mkdir /code
WORKDIR /code

ADD mix.exs /code/

RUN mix local.hex --force
