#!/bin/bash
# $1: ホストディレクトリーパス
# $2: 変換前ファイル名
# $3: 変換後ファイル名

docker run --runtime nvidia --rm -v $1:/tmp ffmpeg -i /tmp/$2 -vcodec h264_nvenc -y /tmp/$3
