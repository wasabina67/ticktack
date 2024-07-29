FROM alpine:latest

WORKDIR /usr/src

RUN wget https://raw.githubusercontent.com/wasabina67/dotfiles-ubuntu/main/bin/ticktack
RUN chmod +x ticktack

RUN apk add --no-cache bash tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apk del tzdata

CMD ["/usr/src/ticktack"]
