FROM golang:1.22-alpine3.19 AS alp

COPY . /github.com/azoma13/chat-server/
WORKDIR /github.com/azoma13/chat-server/

RUN go mod download
RUN go build -o ./bin/chat-server cmd/main.go

FROM alpine:latest

WORKDIR /root/
COPY --from=alp /github.com/azoma13/chat-server/bin/chat-server .

CMD [ "./chat-server" ]