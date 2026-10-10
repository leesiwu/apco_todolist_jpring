FROM eclipse-temurin:17-jdw AS build
WORKDIR /app

COPY  .  .

RUN chmod +x gradlew
RUN ./gradlew bootjar --no-daemon

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 10000

ENTRYPOINT ["java","-jar","jar"]