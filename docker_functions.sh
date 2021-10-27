###### Docker functions ######
_dinstancesList()
{
    words=""
    for i in $(docklist -u); do
        words="$words $i"
    done

    echo $words
}

_dinstances()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    words="$(docker ps --format '{{.Names}}')"
    COMPREPLY=( $(compgen -W "$words" -- $cur) )
}

dexec(){
	####### Enter a container #####
	## First argument : Docker image
	## Second argument : username
	###############################
	if [ -z "$2" ]
	then
		docker exec -it $1 bash
	else
		docker exec -u $2 -it $1 bash
	fi
}
complete -F _dinstances dexec

dockstop(){
	####### Stop a bucnh of Docker containers #######
	## ex : 'dockstop master*'
	#################################################
	docker ps --format '{{.Names}}' | grep "$1" | awk '{print $1}' | xargs -I {} docker stop {}
}

docklist() {
	###### List Dockers Containers ########
	## args : -u or --up = list running images
	##	  -d or --down = list down images
	##	  (nothing) or -a = list all images
	#######################################
	if  [ -z "$1" ]
	then
		docker ps -a
	fi
	for i in "$@"
	do
	case $i in
		-u|--up)
		docker ps --filter status=running
		;;
		-d|--down)
		docker ps --filter status=exited
		;;
		-a)
		docker ps -a
		;;
	esac
done
}

dockip() {
	###### List Dockers Containers with IPs ########
    docker ps | while read line; do
        if `echo $line | grep -q 'CONTAINER ID'`; then
            echo -e "$line\t\tIP ADDRESS\t"
        else
            CID=$(echo $line | awk '{print $1}');
            IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}} | {{end}}' $CID);
            printf "${line}\t${IP}\n"
        fi
    done;
}

dockclean() {
	##### Auto removes "exited" docker containers #####
        docker rm $(docker ps -a -f status=exited -q)
}
