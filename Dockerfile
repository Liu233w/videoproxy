FROM golang as build
COPY . /build
WORKDIR /build
RUN make build

FROM alpine
COPY --from=build /build/videoproxy / 
ENTRYPOINT ["/videoproxy"]
EXPOSE 80
