FROM golang:1.20-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN go build  -ldflags="-s -w" -v -o /usr/local/bin/app .


FROM scratch

COPY --from=builder /usr/local/bin/app  /usr/local/bin/app

CMD [ "app" ]
