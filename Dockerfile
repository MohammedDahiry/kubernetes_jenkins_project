FROM rockylinux:8
LABEL maintainer="mohameddahiry117@gmail.com"
RUN dnf install -y httpd zip unzip
RUN dnf install -y wget
RUN wget -O /tmp/photogenic.zip http://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip
WORKDIR /var/www/html/
RUN unzip /tmp/photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic /tmp/photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
