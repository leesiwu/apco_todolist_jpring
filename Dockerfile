FROM eclipse-termurin:17-jdw AS build
WORKDIR /app

COPY..

RUN chmod +x gradlew
RUN ./gradle bootjar --no-daemon

FROM eclipse-termurin:17-jre

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 10000

ENTRYPOINT ["java","-jar","jar"]