FROM ubuntu:latest
RUN  apt update && apt-get install -y git wget unzip openjdk-8-jdk graphviz xdg-utils libtool automake build-essential python3 python3-dev libboost-serialization-dev libboost-iostreams-dev  libxml2 libxml2-dev csh gfortran libgmp3-dev flex bison texinfo python3-pip libpapi-dev && rm -rf /var/lib/apt/lists/*
RUN wget https://services.gradle.org/distributions/gradle-5.4.1-bin.zip -O /opt/gradle-5.4.1-bin.zip && unzip /opt/gradle-5.4.1-bin.zip -d /opt 
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV GRADLE_HOME=/opt/gradle-5.4.1
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/python3.10/dist-packages/pycompss/COMPSs/Bindings/bindings-common/lib:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/
RUN pip install pycompss dislib jupyter mlflow==1.30.0
EXPOSE 8888
CMD jupyter notebook --allow-root --no-browser --port=8888 --ip=0.0.0.0 --notebook-dir=/notebooks/
