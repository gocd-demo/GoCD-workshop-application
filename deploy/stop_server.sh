#!/bin/bash

pid=$(pgrep -f hello_world)

if [ ! -z $pid ]
then
kill -9 $pid
fi
