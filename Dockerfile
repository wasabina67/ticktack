FROM alpine:latest

WORKDIR /usr/src

RUN wget https://raw.githubusercontent.com/wasabina67/dotfiles-ubuntu/main/bin/ticktack
RUN chmod +x ticktack

RUN apk add --no-cache bash

CMD ["/usr/src/ticktack"]
