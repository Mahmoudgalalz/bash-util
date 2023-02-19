
alias ds='cd ~ && cd Desktop'
alias ex='rm -vrf'
alias sp='~/Desktop/test/sp.sh'
alias gc='git commit -S -m'
alias voo='git push'
alias ga='git add -A'
#making linux GRUB defualt
rmoldsnap(){
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
}

mdir(){
	mkdir $1
	cd $1
}
gitKey(){
	xclip -sel clip < ~/.github_TOKEN
	echo "Hi,KroKing"
       	echo "The GitHub Token has been saved in your Clipboard"
}
alias open='xdg-open .'
goWindows(){
	echo "Switching to Windows"
	sudo cp -f /etc/default/grub.windows /etc/default/grub
	sudo update-grub
	reboot
}
ld(){
	dir=$(ls -A $1 | gum filter)
	if [[ -z $1 ]]
	then 
	cd "$dir";
else cd "$1/$dir";
	fi
}
kro(){
	projectName=$1
	if [[ "$1" == "ls" ]]
	then ld ~/projects
	elif [[ "$1" == "rm" ]]
	then
		if [[ ! -z $2 ]]
		then 
			ex ~/projects/$2 > /dev/null 2>&1
			echo "$2 has been deleted"
		fi
	else
	if [[ -d ~/projects/$projectName ]]
	then 
		echo "$projectName is exist in the project directory!"
	else
		echo "Creating the $projectName in the project Dir..."
		
		mkdir ~/projects/$projectName && cd ~/projects/$1
		code ~/projects/$projectName
		echo "Opening VScode witin the dir.., have fun KroKing"
	fi
fi
}
# This env for JuniorJobs Project
export DATABASE_URL='prisma://aws-eu-central-1.prisma-data.com/?api_key=1ZfEXhBqRQ6bV0titoM9OPNeqdb2mv6rMqtfLryxjgDqKQOXplPxei1r3hXEFVVf'

