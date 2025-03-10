# Renames current terminal tab
function retab() 
{
    case $DESKTOP_SESSION in
        "plasma")
            echo -ne "\033]2;test change title\007" 
            ;;
        *)
            if [[ -z "$ORIG" ]]; then
                ORIG=$PS1
            fi
            TITLE="\[\e]2;$*\a\]"
            PS1=${ORIG}${TITLE}
            ;;
    esac
}

# Creates dir and cd to it
function md()
{
    mkdir "$1" && cd "$1"
}

# Exactly what is says, verbose
function untar()
{
    file=$1
    extension="${file##*.}"
    echo $extension
    case $extension in
        "xz") ;&
        "tar")
            tar -xvf $file
            ;;
        "gz")
            tar -xzvf $file
            ;;
        "bz2")
            tar -xvjf $file
            ;;
    esac
}

# Echoes absolute path to file (with filename)
function pwdf()
{
    echo "$(pwd)/$1"
}

# Sets btightness
function brightness()
{
    sudo su -c "echo ${1} >/sys/class/backlight/intel_backlight/brightness"
}

# Toggles touchpad using xinput
function touchpad()
{
    IdString=$(xinput list | sed '/Touch[Pp]ad/!d; s/.*id=//;s/\s.*//')

    # it's a pretty good chanse that there will be multiple Touchpad ids (virtual for example)
    # So we toggle each one of them
    IdArray=(${IdString})

    for id in ${IdArray[@]}; do
        if [ $(xinput list-props $id | grep "Device Enabled" | awk '{print $NF}') == "1" ]; then
            echo "ID: $id touchpad disabled"
            xinput disable $id
        else
            echo "ID: $id touchpad enabled"
            xinput enable $id
        fi
    done
}

# alias
docker() {
    if [[ $1 == "ls" ]]; then
        command docker container ls -a
    else
        command docker $@
    fi
}

# alias
git() {
    case "$1" in 

        # Teleport you to git project root dir (.git location)
        "root")
            curr_dir="."
            maxdepth=999
            if [ "$#" -gt 1 ]; then maxdepth=$2; fi

            while [ -z $(find "$curr_dir" -maxdepth 1 -type d -name .git) -a $maxdepth > 0 ]; do
                curr_dir+="/.."
                maxdepth=$((maxdepth-1))
            done
            cd "$curr_dir"
            ;;

        # add * && commit --amend && push origing --force
        "fuckit")
            command git add * && git commit --amend --no-edit && git push origin --force
            ;;

        # echo current branch name
        "cbranch")
            git rev-parse --abbrev-ref HEAD
            ;;

        *)
            command git $@
            ;;
    esac
}
