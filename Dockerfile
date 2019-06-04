FROM golang:1.12.5-alpine3.9 AS build
ADD main.go /src/
RUN cd /src && go build -o app

FROM scratch
WORKDIR /app
COPY --from=build /src/app /app/
ENTRYPOINT ["/app/app"]