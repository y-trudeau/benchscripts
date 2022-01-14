#!/bin/bash

function kill_collection() {
  for pid in "${bg_jobs[@]}"
  do
    echo "Killing pid $pid"
    kill -9 $pid >/dev/null 2>&1
    ps -p $pid >/dev/null 2>&1
    if [ "$?" == "0" ]; then
      wait $pid
    fi
  done
  exit 0
}

trap kill_collection INT


