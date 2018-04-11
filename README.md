# rabbitmq-docker

This container has rabbitmq built on centos latest
and has a Java based trace class that uses rabbitmq
firehose tracing to write message traces to 
/var/log/rabbitmq/trace.log as well as to stdout.

Supervisor is used to start rabbitmq-server and Java
for the trace class, as well as to turn on rabbitmq 
tracing.

Ethan Kromhout ethan@kromhout.us ethan@unc.edu

