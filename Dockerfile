FROM rockylinux:8
LABEL maintainer="mohameddahiry117@gmail.com"
RUN dnf install -y httpd zip unzip wget ca-certificates
RUN dnf install -y wget
RUN wget -O /tmp/template.zip https://templatemo.com/download/templatemo_602_graph_page
WORKDIR /var/www/html/
RUN unzip /tmp/template.zip
RUN cp -rvf templatemo_602_graph_page/* .
RUN rm -rf templatemo_602_graph_page /tmp/template.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443
