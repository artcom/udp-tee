#!/bin/bash
#
# udp-tee        Startup script for the udp-tee daemon
#
# chkconfig: 2345 90 10
# description: relaying incoming UDP stream to multiple targets
# processname: udp-tee
# config: /etc/sysconf/udp-tee
# pidfile: /var/run/udp-tee.pid
#
### BEGIN INIT INFO
# Provides: udp-tee
# Required-Start: $local_fs $network
# Required-Stop: $local_fs $network
# Short-Description: start and stop the udp-tee daemon
# Description: relaying incoming UDP stream to multiple targets
### END INIT INFO

# sample start up from a root shell:
# runuser -l -c "/u01/artcom/deployment/udp-tee/script/udp-tee.rb --pidfile=/u01/artcom/deployment/udp-tee.pid --logfile=/u01/artcom/deployment/udp-tee.log --background" deployment

# Source function library.
. /etc/rc.d/init.d/functions

# defaults
prog=udp-tee
user=deployment
app_dir='/u01/artcom/deployment/udp-tee'
exe="${app_dir}/bin/udp-tee-daemon"
piddir=/var/run
logdir=/var/log

# calculated from settings above, do not change
pidfile="${piddir}/${prog}.pid"
service="${exe} --dir=${piddir} --log_dir=${logdir}"

# overload defaults with sysconfig
#[ -e /etc/sysconfig/${prog} ] && . /etc/sysconfig/${prog}

start() {
    [ -x $exe ] || exit 5
    echo -n $"Starting ${prog}: "

    daemon --user=${user} --pidfile=${pidfile} ${service} start

    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}

stop() {
    echo -n $"Stopping ${prog}: "
    #killproc -p ${pidfile} ${prog}
    ${service} stop

    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}

restart() {
    stop
    start
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 2
esac
exit $?
