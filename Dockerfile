
FROM centos:7
RUN yum update -y
RUN yum install -y python3
RuN echo 1.0 >> /etc/version && yum install -y git \
                && yum install -y net-tools               

## WORKDIR ##
RUN mkdir /datos
WORKDIR /datos
	RUN touch f1.txt
	RUN mkdir /datos1
	WORKDIR /datos1
		RUN touch f2.txt

## COPY ##
COPY index.html . 
COPY app.log /datos 

## ADD ##
ADD docs docs 
ADD f* /datos/
ADD f.tar .

## ENV ##
ENV dir1=/data1 dir2=/data2
RUN mkdir $dir1 && mkdir $dir2

### ARG  ##
ARG dir3
RUN mkdir $dir3

## ARG_2 ##
ARG user
ENV user_docker $user
ADD add_user.sh /datos1
RUN /datos1/add_user.sh -n

## EXPOSE ##
RUN yum update -y httpd
RUN yum install -y httpd
EXPOSE 80
ADD entryPoint.sh /datos1

## VOLUME ##
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

## CMD ##
CMD /datos1/entryPoint.sh

## ENTRYPOINT ##
#ENTRYPOINT ["/bin/bash"]

