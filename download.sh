#!/bin/bash

if [ ! -d "/download$REMOTE_DIR_NAME" ]; then
  mkdir -p /download$REMOTE_NAME
fi

pcs synch -cd /download$REMOTE_NAME $REMOTE_NAME


