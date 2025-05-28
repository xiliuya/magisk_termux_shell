MODID=Magisk-Termux-Shell
AUTOMOUNT=true


print_modname() {
  ui_print "*******************************"
  ui_print "        $MODID        "
  ui_print "*******************************"
}
set_permissions() {
  set_perm $MODPATH/system/bin/termux_shell 0 0 0755
  set_perm $MODPATH/gen_passwd_group.sh 0 0 0755
  set_perm $MODPATH/termux.sh 0 0 0755
  set_perm $MODPATH/gosu-arm 0 0 0755
  set_perm $MODPATH/gosu-arm64 0 0 0755
  set_perm $MODPATH/gosu-386 0 0 0755
  set_perm $MODPATH/gosu-amd64 0 0 0755
}

dos2unix /system/bin/termux_shell
print_modname
set_permissions
