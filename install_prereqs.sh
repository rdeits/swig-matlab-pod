#!/bin/bash


case $1 in
  ("homebrew")
    brew install autoconf automake libtool ;;
  ("macports")
    port install automake autoconf libtool ;;
  ("ubuntu")
    apt-get install build-essential autotools-dev automake bison ;;
  ("cygwin")
    cygwin-setup -q -P make autoconf automake libtool ;;
  (*)
    echo "Usage: ./install_prereqs.sh package_manager"
    echo "where package_manager is one of the following: "
    echo "  homebrew"
    echo "  macports"
    echo "  ubuntu"
    echo "  cygwin"
    exit 1 ;;
esac
