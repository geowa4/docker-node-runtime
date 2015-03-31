FROM gliderlabs/alpine
RUN apk-install nodejs
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENTRYPOINT [ "npm" ]
CMD [ "start" ]
EXPOSE 3000
