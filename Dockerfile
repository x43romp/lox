# ========== 
# Clone Repository
# ========== 
FROM alpine/git as git
WORKDIR /root

RUN git clone https://github.com/munificent/craftinginterpreters.git craft

# ========== 
# Build
# ========== 

FROM ibm-semeru-runtimes:open-11-jdk-focal as build
WORKDIR /root

COPY --from=git /root/craft/java /root/java
RUN javac -g /root/java/com/craftinginterpreters/lox/*.java

# ========== 
# Alpine JRE
# ========== 

FROM alpine as os
RUN apk add openjdk11-jre

FROM os
COPY --from=build /root/java /root/java
CMD java -cp /root/java com.craftinginterpreters.lox.Lox 
