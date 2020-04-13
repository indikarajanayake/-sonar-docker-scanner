From openjdk:8-jre-alpine



RUN apk update && \
    apk upgrade && \
    apk add --no-cache nodejs npm unzip wget python py-pip

RUN pip install awscli

RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492.zip && \
    unzip sonar-scanner-cli.zip && \
    rm sonar-scanner-cli.zip &&\
    mv sonar-scanner-3.3.0.1492 opt/sonar-scanner

ENV PATH=${PATH}:/opt/sonar-scanner/bin:
WORKDIR /opt
copy /src /opt/src

copy entrypoint.sh /entrypoint.sh
run chmod +x /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]