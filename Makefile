TARGETS = gosu-arm gosu-arm64 gosu-386 gosu-amd64

all: $(TARGETS)
	zip -r magisk_termux_shell.zip META-INF/ system/ \
		gosu-arm gosu-arm64 gosu-386 gosu-amd64 \
		update.json module.prop customize.sh \
		gen_passwd_group.sh termux.sh termux_shell.sh
$(TARGETS): %:
	mkdir gosu; cd gosu;bash ../download.sh $@
	mv gosu/$@ $@

clean:
	$(RM) magisk_termux_shell.zip

