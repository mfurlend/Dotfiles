goo () {
	local inp1 inp2
	inp1=$1
	inp2=$2
	if (( ! $# ))
	then
		inp1="-h"
	fi
	if [[ $inp1 == "-h" || $inp1 == "--help" ]]
	then
		echo "$0 - google cloud profile switching\n"
		echo "usage: $0 -h"
		echo "usage: $0 -l"
		echo "usage: $0 -p default\n\nOptions:"
		echo "\t-h, --help\t\t\t display help message and exit"
		echo "\t-l, --list\t\t\t list profiles"
		echo "\t-p, --profile=name\t\t switch profile"
		return 1
	elif [[ $inp1 == "-l" || $inp1 == "--list" ]]
	then
		gcloud config configurations list
	elif [[ ( $inp1 == "-p" || $inp1 == "--profile" ) && $inp2 != "" ]]
	then
		gcloud config configurations activate "$inp2"
	else
		echo "idk wtf"
	fi
}
