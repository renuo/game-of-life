#!/usr/bin/ksh

typeset destination=${1:-"$(pwd)"}
typeset sourceFolder="example/game.rb"

cp $sourceFolder $destination
