# usefull_commands_bash

## Installation
Omega one-liner:
```
	# Clones repo; checkes for previous versions; copies file content into ~/.bashrc
	git clone https://github.com/nolven/scripts.git && sed 's/#@#$%^.*#^%$#@//' ~/.bashrc && echo "#@#$%^" >> ~/.bashrc && cat ./scripts/functions >> ~/.bashrc && echo "#^%$#@" >> ~/.bashrc && rm -rf scripts
```

### Functions
* md - creates new dir and moves to it
* untar - decompress tar, .bz2, .gz archive into the current dir (vebose)
* pwdf - echoes full path to file including filename
* brightness - sets brightness
* touchapd - enables/disables touchpad
* retab - renames current terminal tab
* docker - alias to docker container ls -a

