FROM golang:1.20-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN go build -v -o /usr/local/bin/app .


FROM alpine:3

COPY --from=builder /usr/local/bin/app  /usr/local/bin/app

CMD [ "app" ]
