#!/bin/bash

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.go/bin:$GOPATH/bin

mkdir -p "$HOME/src" "$HOME/bin"

go get github.com/x-motemen/ghq
