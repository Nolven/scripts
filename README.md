# usefull_commands_bash

## Installation
Omega one-liner:
Places functions into ~/.bashrc between the special "brackets" #omegascripts and #scriptsomega (for identification of the script's old version)
```
git clone https://github.com/nolven/scripts.git /tmp/scripts && sed -i "/#omegascripts/,/#scriptsomega/d" ~/.bashrc && printf "\n#omegascripts\n%s\n#scriptsomega\n" "$(cat /tmp/scripts/functions.sh)" >> ~/.bashrc && rm -rf /tmp/scripts && echo "Successfully added functions between #omegascripts and #scriptsomega"
```

### Functions
* md - creates new dir and moves to it
* untar - decompress tar, .bz2, .gz archive into the current dir (verbose)
* pwdf - echoes full path to file including filename
* brightness - sets brightness	
* touchapd - enables/disables touchpad
* retab - renames current terminal tab
* docker ls - alias to docker container ls -a
* git 
	* root - teleports you to the root dir(where is .git located) of the current git project
	* fuckit - add * && commit --amend --no-edit && push origin --force