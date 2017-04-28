#!/bin/bash

REMOTE_DIR_NAME = $REMOTE_NAME

if [ ! -d "/download$REMOTE_DIR_NAME" ]; then
  mkdir -p /download$REMOTE_DIR_NAME
fi

pcs synch -cd /download$REMOTE_DIR_NAME $REMOTE_DIR_NAME


