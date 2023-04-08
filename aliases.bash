# short command for back to desktop from everywher
alias ds='cd ~ && cd Desktop'
# Delete the directory if it has childrens (files)
alias ex='rm -vrf'
# signed commit to git
alias gc='git commit -S -m'
# push 
alias voo='git push'
# Adding all files to stage
alias ga='git add -A'

alias open='xdg-open .'

# short cut for push and commit example (gp "init commit")
gp(){
    commit=$1
    ga
    gc commit
    voo
}
#remove all old snap versions auto
rmoldsnap(){
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
}


# create dir and head to it
mdir(){
	mkdir $1
	cd $1
}
# not important !!
gitKey(){
	xclip -sel clip < ~/.github_TOKEN
	echo "Hi,KroKing"
       	echo "The GitHub Token has been saved in your Clipboard"
}
# list the files and select by moving with arrows (required to have gum installed)
ld(){
	dir=$(ls -A $1 | gum filter)
	if [[ -z $1 ]]
	then 
	cd "$dir";
else cd "$1/$dir";
	fi
}

# you can change this function name
# I used it to create project dir in the projects directory in home and open VSCode
# you can delete using (kro rm)
# you can go to specific file in projects dir using (kro ls) and it using Gum so you have to install it too
prj(){
        projectName=$1
        if [[ "$1" == "ls" ]]
        then ld ~/projects
        elif [[ "$1" == "clone" ]]
        then
                cd ~/projects
                git clone $2
                name=$( echo $2 | cut -d/ -f5-)
                cd $name
                code .
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
