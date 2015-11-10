FROM ubuntu:14.04 

#Install dependencies
RUN apt-get update 
RUN apt-get install software-properties-common -y 
RUN add-apt-repository ppa:webupd8team/java -y 
RUN apt-get update 
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
RUN apt-get install oracle-java7-installer -y 
RUN apt-get install oracle-java7-set-default 

#Install app
COPY stocktonflare-standalone.jar /
COPY log4j.xml /
COPY start2.sh /

EXPOSE 9081
#don't expose any other port now

CMD ./start2.sh
#CMD [ "./start2.sh" ]
