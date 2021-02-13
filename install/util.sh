#!/bin/bash

function os () {
  case "$OSTYPE" in
    linux*) linux_distribution ;;
    darwin*) echo darwin ;;
    cygwin*) echo cygwin ;;
    msys) echo msys ;;
    win32) echo win32 ;;
    freebsd*) echo freebsd ;;
    *) echo unknown ;;
  esac
}

function linux_distribution() {
  if grep -q Ubuntu /etc/os-release; then
    echo ubuntu
  elif grep -q Centos /etc/os-release; then
    echo centos
  else
    echo unkown_linux
  fi
}
