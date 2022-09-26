FROM ibm-semeru-runtimes:open-11-jdk-focal
WORKDIR /root

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/munificent/craftinginterpreters.git \
    && cd craftinginterpreters/java \
    && javac -g com/craftinginterpreters/lox/*.java

CMD java -cp /root/craftinginterpreters/java com.craftinginterpreters.lox.Lox 