FROM dart:stable AS build
WORKDIR /app

COPY hello.dart .
RUN dart compile exe hello.dart -o /app/hello

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/hello /app/hello

ENTRYPOINT ["/app/hello"]
