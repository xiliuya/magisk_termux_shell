#!/system/bin/sh


TERMUX_DIR="/data/data/com.termux"
MAGISK_MOD_DIR="/data/adb/modules/Magisk-Termux-Shell/"
let TERMUX_ID=$(ls -dn $TERMUX_DIR | cut -d' ' -f3 | cut -b2-5)
TERMUX_USER="u0_a${TERMUX_ID}"

# write a group file
GROUP_FILE="$MAGISK_MOD_DIR/group"
GROUP_ARR=("$TERMUX_USER" "everybody" "shell" "input" "log" "adb" "sdcard_rw" "sdcard_r" "inet" "net_bt_admin" "net_bt" "net_bw_stats" "readproc" "uhid" "usb")
printGroup(){
        echo "$1:x:$(id -g $1):$2" >> $GROUP_FILE
}

writeGroup(){
        for group in ${GROUP_ARR[@]};
        do
                printGroup $group "$TERMUX_USER"
        done
}

if [ ! -f $GROUP_FILE ];then
        writeGroup
fi

# write a passwd file
PASSWD_FILE="$MAGISK_MOD_DIR/passwd"
writePasswd(){
        let TERMUX_UID=$(id -u $TERMUX_USER)
        let TERMUX_GID=$(id -g $TERMUX_USER)
        echo "$TERMUX_USER:x:$TERMUX_UID:$TERMUX_GID:termux app user:$TERMUX_DIR/files/home:$TERMUX_DIR/file/usr/bin/bash" > $PASSWD_FILE
}
if [ ! -f $PASSWD_FILE ];then
        writePasswd
fi
