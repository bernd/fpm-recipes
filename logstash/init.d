#!/bin/bash

CMD=$1
NOHUP=`which nohup`

# resolve links - $0 may be a softlink
LOGSTASHCTL="$0"

while [ -h "$LOGSTASHCTL" ]; do
  ls=`ls -ld "$LOGSTASHCTL"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    LOGSTASHCTL="$link"
  else
    LOGSTASHCTL=`dirname "$LOGSTASHCTL"`/"$link"
  fi
done

LOGSTASHCTL_DIR=`dirname "$LOGSTASHCTL"`
LOGSTASH_SERVER_JAR=/usr/share/logstash/logstash.jar
LOGSTASH_CONFIG_SH=${LOGSTASHCTL_DIR}/logstash_config.sh
LOGSTASH_CONF=/etc/logstash/logstash.conf
LOGSTASH_PID=/var/run/logstash.pid

[ -f $LOGSTASH_CONFIG_SH ] && . $LOGSTASH_CONFIG_SH

start() {
    pid=$(get_pid)
    if [ ! -z $pid ]; then
        if pid_running $pid
        then
            echo "logstash already running as pid $pid"
            return 0
        fi
    fi

    echo "Starting logstash ..."
    $NOHUP java -jar ${LOGSTASH_SERVER_JAR} agent -f ${LOGSTASH_CONF} 2>&1 | tee --append /var/log/logstash/logstash.log &
    print ${!} > "${LOGSTASH_PID}"    
}

stop() {
    PID=`cat ${LOGSTASH_PID}`
    echo "Stopping logstash ($PID) ..."
    if kill $PID; then
        rm ${LOGSTASH_PID}
    fi
}

restart() {
    echo "Restarting logstash ..."
    stop
    start
}

status() {
    pid=$(get_pid)
    if [ ! -z $pid ]; then
        if pid_running $pid; then
            echo "logstash running as pid $pid"
            return 0
        else
            echo "Stale pid file with $pid - removing..."
            rm ${LOGSTASH_PID}
        fi
    fi

    echo "logstash not running"
}

get_pid() {
    cat ${LOGSTASH_PID} 2> /dev/null
}

pid_running() {
    kill -0 $1 2> /dev/null
}

case "$CMD" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "Usage $0 {start|stop|restart|status}"
        RETVAL=1
esac
