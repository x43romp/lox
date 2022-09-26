FROM ubuntu:focal 

RUN apt update \
    && apt install -y git openjdk-11-jdk

RUN git clone https://github.com/munificent/craftinginterpreters.git . 
RUN cd craftinginterpreters/java
RUN javac -g com/craftinginterpreters/lox/*.java
CMD java -cp ./ com.craftinginterpreters.lox.Lox 