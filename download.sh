#!/bin/bash

REMOTE_DIR_NAME = $REMOTE_NAME

pcs synch -cd /download$REMOTE_DIR_NAME $REMOTE_DIR_NAME


