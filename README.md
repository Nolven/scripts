# usefull_commands_bash

## Installation
Omega one-liner:
```
# Places functions into ~/.bashrc inbetween special "brackets": #omegascripts and #scriptsomega (to be able to find old version of the scripts)
git clone https://github.com/nolven/scripts.git && sed -i "/#omegascripts/,/#scriptsomega/d" ~/.bashrc && printf "\n%s\n%s\n%s\n" "#omegascripts" "$(<./scripts/functions)" "#scriptsomega" >> ~/.bashrc && rm -rf scripts && echo "Successfully added"
```

### Functions
* md - creates new dir and moves to it
* untar - decompress tar, .bz2, .gz archive into the current dir (verbose)
* pwdf - echoes full path to file including filename
* brightness - sets brightness	
* touchapd - enables/disables touchpad
* retab - renames current terminal tab
* docker ls - alias to docker container ls -a