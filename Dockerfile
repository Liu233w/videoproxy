FROM golang as build
WORKDIR /usr/src/app
COPY . .
RUN make build

FROM alpine
COPY --from=build /usr/src/app/videoproxy / 
ENTRYPOINT ["/videoproxy"]
EXPOSE 80
