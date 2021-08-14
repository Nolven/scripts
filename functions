#Renames tab
function retab() {
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

#creates dir and cd to it
function md()
{
    mkdir $1 && cd $1
}

#Exactly what is says, verbose
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

#Echoes absolute path to file (with filename)
function pwdf()
{
    echo "$(pwd)/$1"
}

#Sets btightness
function brightness()
{
    sudo su -c "echo ${1} >/sys/class/backlight/intel_backlight/brightness"
}

#Toggles touchpad using xinput
function touchpad()
{
    ID=$(xinput list | sed '/Touch[Pp]ad/!d; s/.*id=//;s/\s.*//')

    if [ $(xinput list-props $ID | grep "Device Enabled" | awk '{print $NF}') == "1" ]; then
        echo "Touchpad disabled"
        xinput disable $ID
    else
        echo "Touchpad enabled"
        xinput enable $ID
    fi
}

#Actually alias to list all dockers contatiners
docker() {
    if [[ $1 == "ls" ]]; then
        command docker container ls -a
    else
        command docker $@
    fi
}