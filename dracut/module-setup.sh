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
