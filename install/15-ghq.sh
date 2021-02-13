#!/bin/bash

export PATH=$PATH:$HOME/.go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

mkdir -p $HOME/src $HOME/bin

go get github.com/x-motemen/ghq
