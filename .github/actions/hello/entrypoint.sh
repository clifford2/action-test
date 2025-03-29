#!/bin/sh -l

echo "#args: $#" >&2
while [ $# -gt 0 ]
do
	echo "arg: [$1]" >&2
	shift
done
echo "Hello $1"
time=$(date)
echo "time='${time}'" >> $GITHUB_OUTPUT
echo "hostname='$(hostname)'" >> $GITHUB_OUTPUT
