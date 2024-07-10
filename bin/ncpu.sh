#!/bin/sh
# ncpu.sh

case "`uname -s`" in
Darwin)
	sysctl -n hw.ncpu
	;;
*)	nproc --all
	;;
esac

# end: ncpu.sh
