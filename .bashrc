#
# ~/.bashrc
#

COLOR_GREEN="\e[38;5;22m"
COLOR_DARKMAGENTA="\e[38;5;53m"
COLOR_DARKCYAN="\e[38;5;23m"
COLOR_RESET="\e[39m"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# this is here because the .startup file sometimes doesn't do it :(
xset r rate 120 13

alias cc='clear'
alias ls='ls --color=auto'
alias showkey='sudo showkey'

function yom(){
	python ~/tools/yom/__main__.py
}

function reach(){
	if [ "$1" = "hell" ]; then
		echo "server is in switching... please correct IP"
		ssh root@2001:19f0:5:5ec4:5400:02ff:fe22:b813
	fi
	if [ "$1" = "admin" ]; then
		xdg-open "https://my.vultr.com/subs/?SUBID=26467058"
	fi
}

function c() {
	# test if file exists
	test -f .cd
	cd $@
	if [ -f ".cd" ]; then
		. .cd
	fi
}

function cl() {
	# cd and ls
	c $@
	ls
}

function ccl() {
	# cd, clear, and ls
	c $@
	clear
	ls
}

function geet() {
	git add . && git commit -m "$@"
}

function md() {
	pandoc $@ | lynx -stdin
}

echo -e -n "$COLOR_GREEN"
echo "Switch Virtual Servers"
echo -e "$COLOR_DARKCYAN"
echo -e "\tCtrl+Alt+F1, F2, F3, ...\n"

echo -e "$COLOR_GREEN""cmake"
echo -e "$COLOR_DARKCYAN"
cat .instructions/cmake.txt | sed 's/^/\t/'

# print out network information (vnstat)
echo -e -n $COLOR_DARKMAGENTA
vnstat -h
echo -e $COLOR_RESET


if [[ $bind_nethogs == true ]]; then	#   #  #### ##### w
	sudo nethogs			##  # #       #   o
	exit			        # # # ###     #   r
fi				        #   # #####   #   k

if [[ $bind_iftop == true ]]; then	 ####  #TOP  
	sudo iftop			  #   # 
	exit				  #   ###     
fi					####  #    

# bash start location
cd

# bash prompt
PS1='\e[35m\u.\h \W> \e[39m'
