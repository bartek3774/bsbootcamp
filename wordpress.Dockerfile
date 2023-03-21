FROM wordpress

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.6.2-amd64.deb && dpkg -i filebeat-8.6.2-amd64.deb


COPY apache.yml /etc/filebeat/modules.d/apache.yml.disabled

COPY filebeat.yml /etc/filebeat/filebeat.yml
COPY system.yml /etc/filebeat/modules.d/system.yml.disabled


RUN chmod go-w /etc/filebeat/modules.d/apache.yml.disabled

RUN chmod go-w /etc/filebeat/modules.d/system.yml.disabled

RUN chmod go-w /etc/filebeat/filebeat.yml

RUN filebeat modules enable apache

RUN filebeat modules enable system

RUN service filebeat start
