#!/bin/bash
# 特定ディレクトリー以下の動画を一括変換し、変換成功した元動画を削除します。
# $1: 元ファイルディレクトリーパス
# $2: 変換前拡張子
# $3: 変換後拡張子

FILES=`ls -1 $1 | grep -e .*\.$2$`

while read line; do
  FILENAME_WITHOUT_EXTENSION=`echo $line | sed -r "s/^(.*)\.$2$/\1/"`
  FILE_BEFORE=$FILENAME_WITHOUT_EXTENSION.$2
  FILE_AFTER=$FILENAME_WITHOUT_EXTENSION.$3

  # エンコード実行
  docker run --runtime nvidia --rm -v $1:/tmp ffmpeg -i "/tmp/$FILE_BEFORE" -vcodec h264_nvenc -y "/tmp/$FILE_AFTER"
  if [ $? -eq 0 ]; then
    # 成功したら削除
    rm -f $1/$FILE_BEFORE
  fi 
done <<END
$FILES
END
