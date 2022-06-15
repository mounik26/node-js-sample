FROM alpine:latest As build
RUN apk add --no-cache nodejs npm


WORKDIR /app


COPY . /app


RUN npm install

FROM alpine:latest

WORKDIR /app

COPY --from=build /app ./

ENTRYPOINT ["node"]

CMD ["index.js"]


