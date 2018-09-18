FROM golang
ADD . /go/src/app/
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' /go/src/app

FROM scratch
COPY --from=0 /go/app /app
CMD ["/app"]
