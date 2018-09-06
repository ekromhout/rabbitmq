#!/bin/sh

setupPipe() {
    if [ -e $1 ]; then
        rm $1
    fi
    mkfifo -m 666 $1
}

setupLoggingPipe() {
    # Make a "console" logging pipe that anyone can write too regardless of who owns the process.
    setupPipe /tmp/logpipe
    cat <> /tmp/logpipe &
}

# Make a formatted stream to the logging pipe from rabbitmq
setupRabbitmqLog() {
    (tail -F /tmp/lograbbitmq | sed -u -r "s/^/rabbitmq\;console\;$ENV\;$USERTOKEN\;/" > /tmp/logpipe) &
}

prepConf() {
    setupLoggingPipe
    setupRabbitmqLog
}
