FROM maven:3.6.0-jdk-8-alpine

# chromeDriver v2.35
RUN wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/bin/ \
    && rm /tmp/chromedriver.zip

COPY src /home/SeleniumTestFramework/src

COPY pom.xml /home/SeleniumTestFramework

RUN mvn -f /home/SeleniumTestFramework/pom.xml clean test -DskipTests=true