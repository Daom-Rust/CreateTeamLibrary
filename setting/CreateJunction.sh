#!/bin/bash

# 현재 디렉터리의 절대 경로와 이름을 가져옵니다
currentDir=$(pwd)
currentDirName=$(basename "$currentDir")

# 목표 지점 경로를 설정합니다
junctionPath="$HOME/src/$currentDirName"

# 목표 지점에 이미 심볼릭 링크가 존재하면 삭제합니다
if [ -e "$junctionPath" ]; then
    rm -rf "$junctionPath"
fi

# 심볼릭 링크를 생성합니다
ln -s "$currentDir" "$junctionPath"

echo "Created junction at $junctionPath pointing to $currentDir"
