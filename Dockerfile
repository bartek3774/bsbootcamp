FROM centos:7
RUN echo date
RUN for user in frank; do useradd $user; echo "1234" | passwd $user --stdin; done
RUN yum update -y && yum install mysql -y
run echo 'hello'
