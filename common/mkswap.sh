#!/usr/bin/env bash

swapfile="/swapfile"
size=$(($1)) #GB
swappiness=$(($2))

function sedReplace() {
  file=$1
  keyword=$2
  replace=$3

  sed -i "/$keyword/d" $file
  echo "$replace" >>$file
}

function tryToSwapoff() {
  sp="$(swapon -s)"
  swapfile="$1"
  if [ ! -z "$sp" ]; then
    swapoff $swapfile
  fi
}

if [ "$1" = "--help" ]; then
  echo -e "example:\nmkswap [size(GB) default(4)] [swappiness, default(60)]"
  exit 0
fi

if [ $size -le 0 ]; then
  size=4
fi

if [ $swappiness -le 0 ]; then
  swappiness=60
fi

echo "swap argument:size=${size}GB,swappiness=$swappiness%"
echo "current swap info:"
echo "------------------------------------------------"
swapon -s
free -m
cs=$(cat /proc/sys/vm/swappiness)
echo "current swappiness=$cs"
echo "------------------------------------------------"

read -n 1 -s -r -p "Press any key to continue"
echo ""

#1.准备swap文件
echo "making swap file:$swapfile,size=${size}GB..."
echo "------------------------------------------------"
bs=$(($size * 1024))
tryToSwapoff $swapfile
#echo /dev/null >> $swapfile
dd if=/dev/zero of=$swapfile bs=$bs count=1024k
chmod 600 "$swapfile"
echo "------------------------------------------------"
echo ""

#2.挂载swap
echo "finished marking swap file:$swapfile"
echo "------------------------------------------------"
echo "marking swap..."
tryToSwapoff $swapfile
mkswap -v1 "$swapfile"
swapon "$swapfile"
sysctl vm.swappiness=$swappiness

sedReplace "/etc/sysctl.conf" "^vm.swappiness.*" "vm.swappiness = $swappiness"

sedReplace "/etc/fstab" "^\\${swapfile}.*" "$swapfile          swap            swap    defaults        0 0"

echo "finished marking swap"
echo "------------------------------------------------"
echo ""

#3.显示最后swap信息
echo "last swap info:"
echo "------------------------------------------------"
swapon -s
free -m
cs=$(cat /proc/sys/vm/swappiness)
echo "current swappiness=$cs"
echo "------------------------------------------------"
