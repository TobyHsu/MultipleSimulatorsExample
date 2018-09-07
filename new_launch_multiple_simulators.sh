#!/bin/bash

path=$(find ~/Library/Developer/Xcode/DerivedData/MultipleSimulatorsExample-*/Build/Products/Debug-iphonesimulator -name "MultipleSimulatorsExample.app" | head -n 1)
echo "${path}"

filename=MultiSimConfig.txt

#取得目前開啟的模擬器列表
existedList=`xcrun simctl list devices \
| grep Booted \
| uniq \
| egrep -o '([A-Z0-9-]){36}'`

#判斷模擬器列表是否為空
if [ -z "$existedList" ]
then
  xcrun simctl shutdown all

  grep -v '^#' $filename | while read -r line
  do
    echo $line
    xcrun instruments -w "$line"
    xcrun simctl install booted $path
    xcrun simctl launch booted example.MultipleSimulatorsExample
  done
else
  #轉成陣列
  listArray=($existedList)  
  for device in "${listArray[@]}"
  do
    echo "$device"
    echo "======="        
    xcrun simctl install $device $path 
    xcrun simctl launch $device example.MultipleSimulatorsExample
  done
fi
