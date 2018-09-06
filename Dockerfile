FROM rabbitmq:3.7-management
MAINTAINER  ethan@unc.edu ekromhout@gmail.com
ENV RABBITMQ_LOGS=/tmp/lograbbitmq RABBITMQ_SASL_LOGS=/tmp/lograbbitmq
COPY container_files/usr-local-bin/ /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["rabbitmq-server"]
