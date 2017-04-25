FROM ubuntu:xenial

RUN apt-get update && apt-get install -y curl logrotate

# Get latest from https://mms.mongodb.com/
RUN curl -OL https://cloud.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_3.6.2.2060-1_amd64.ubuntu1604.deb
RUN dpkg -i mongodb-mms-automation-agent-manager_3.6.2.2060-1_amd64.ubuntu1604.deb
RUN rm mongodb-mms-automation-agent-manager_3.6.2.2060-1_amd64.ubuntu1604.deb

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

VOLUME /data
RUN chown -R mongodb:mongodb /data
USER mongodb


CMD ["/opt/mongodb-mms-automation/bin/mongodb-mms-automation-agent","-f","/etc/mongodb-mms/automation-agent.config"]
