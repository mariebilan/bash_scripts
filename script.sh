#!/usr/bin/env bash
all()
{
        arp -a
}

target()
{
        sudo netstat -tulpn | grep LISTEN
}

nokey()
{
	echo "List of possible keys and their description:
1. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
2. The --target key displays a list of open system TCP ports"
}

main()
{
	if [ -z "$1" ]
	then
		nokey
	else
		case "$1" in
			--all) all ;;
			--target) target ;;
		esac
	fi
}

main "$@"
