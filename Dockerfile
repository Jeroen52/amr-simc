FROM mcr.microsoft.com/azure-functions/dotnet:latest
MAINTAINER jeroen@jeroendeneef.com

LABEL   name="Ask Mr. Robot Simulator Client" \
        vendor="Jeroen"

ENV NAME amr-simc
ENV VERSION 1158
ENV SETTINGS settings.json
ENV WORKDIR /AskMrRobotClient

ADD https://static2.askmrrobot.com/wowsite/client$WORKDIR-any-$VERSION.zip $NAME.zip

ADD $SETTINGS $WORKDIR/$SETTINGS

RUN apt-get update && apt-get install unzip && apt-get clean

RUN unzip $NAME.zip

RUN rm $NAME.zip

WORKDIR $WORKDIR

CMD [ "/usr/bin/dotnet", "amr.dll" ]
