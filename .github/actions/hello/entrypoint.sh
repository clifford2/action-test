#!/usr/bin/bash -l

debug=0
title=''

while getopts 'w:t:d' opt
do
	case ${opt} in
		w)
			who="${OPTARG}"
			;;
		d)
			debug=1
			;;
		t)
			if [ ! -z "${OPTARG}" ]
			then
				title="${OPTARG} "
			fi
			;;
		?)
			echo "Invalid option: -${OPTARG}."
			exit 1
			;;
	esac
done

if [ -z "${who}" ]
then
	echo "Usage: hello -w <who> [-t <title>] [-d]"
	exit 1
fi

if [ $debug -gt 0 ]
then
	echo "DEBUG: #args: $#" >&2
	echo "DEBUG: who: [$who]" >&2
	echo "DEBUG: title: [$title]" >&2
	echo ''
	echo '-- ENV start --'
	env
	echo '-- ENV end --'
	echo ''
fi

greeting="Hello ${title}${who}"
echo "${greeting}"

time="$(date)"
echo "greeting='${greeting}'" >> $GITHUB_OUTPUT
echo "time='${time}'" >> $GITHUB_OUTPUT
echo "hostname='$(hostname)'" >> $GITHUB_OUTPUT
