FROM ubuntu:focal 
ENV TZ=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update 
RUN apt-get install -y git
RUN apt-get install -y openjdk-11-jdk

RUN git clone https://github.com/munificent/craftinginterpreters.git
RUN cd craftinginterpreters/java
RUN javac -g com/craftinginterpreters/lox/*.java
CMD java -cp ./ com.craftinginterpreters.lox.Lox 