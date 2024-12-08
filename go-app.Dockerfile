FROM golang:1.22-alpine AS builder 

WORKDIR /usr/local/src

RUN apk --no-cache add bash git make gcc gettext musl-dev

# dependencies
COPY ["./go.mod", "./go.sum", "./"]
RUN go mod download

# build
COPY app ./app
RUN go build -ldflags "-w" -o ./bin/bin-app app/main.go 


FROM alpine AS runner   

WORKDIR /home/app
COPY --from=builder /usr/local/src/bin/bin-app ./

CMD ["./bin-app"]