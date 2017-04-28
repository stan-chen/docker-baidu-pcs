#!/bin/bash

echo "检查 /download$REMOTE_NAME 是否存在"
if [ ! -d "/download$REMOTE_NAME" ]; then
  mkdir -p /download$REMOTE_NAME
  echo "/download$REMOTE_NAME 不存在 已经成功创建"
fi

pcs synch -crd /download$REMOTE_NAME $REMOTE_NAME


