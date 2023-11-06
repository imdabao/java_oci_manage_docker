FROM openjdk:17-slim
VOLUME /etc/gz_client_bot
WORKDIR /app
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY ./gz_client_bot/r_client.jar /app/r_client.jar
COPY ./gz_client_bot/client_config /etc/gz_client_bot/client_config
EXPOSE 9527
ENTRYPOINT exec java $JAVA_OPTS -Dfile.encoding=utf-8 -jar r_client.jar --configPath=/etc/gz_client_bot/client_config