dracut module quick test
===

1. Prepare module-setup.sh
---

You can copy module-setup.sh or create by yourself.

    cat <<EOF > module-setup.sh
    #!/bin/bash

    check() {
      return 0
    }

    depends() {
      return 0
    }

    install() {
      # need /usr/bin/emacs
      dracut_install emacs
    }
    EOF

2. Set the module
---

    mkdir /lib/dracut/modules.d/98test/
    cp module-setup.sh /lib/dracut/modules.d/98ostree/module-setup.sh


3. Test it!
---

    cd /tmp
    dracut "initramfs-$(uname -r).img" $(uname -r)
    lsinitrd initramfs-$(uname -r).img |grep emacs
    -rwxr-xr-t   1 root     root     15083144 Nov 28 20:45 usr/bin/emacs-24.4
    lrwxrwxrwx   1 root     root           10 Nov 28 20:45 usr/bin/emacs -> emacs-24.4
    -rw-r--r--   1 root     root          775 Oct  6 22:49 usr/lib/kbd/keymaps/legacy/i386/qwerty/emacs2.map.gz
    -rw-r--r--   1 root     root          987 Oct  6 22:49 usr/lib/kbd/keymaps/legacy/i386/qwerty/emacs.map.gz

Other link
---
https://www.kernel.org/pub/linux/utils/boot/dracut/dracut.html
