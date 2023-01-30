#!/bin/bash

NAME=$1
COUNTRY=$2
SHOW=$3

echo "Script from Github"

if [ "$SHOW" = "true" ]; then
  echo "Hello, $NAME $COUNTRY"
else
  echo "If you want to see the name, please mark the show option"
fi
