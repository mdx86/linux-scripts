#!/usr/bin/env php

<?php
function deldir($dir) {
    //先删除目录下的文件：
    $dh = opendir($dir);
    while ($file = readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $dir . "/" . $file;
            $fullpath = realpath($fullpath);
            if (!$fullpath) {
                continue;
            }
            echo "$fullpath\n";
            if (!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                deldir($fullpath);
            }
        }
    }

    closedir($dh);
    //删除当前文件夹：
    if (rmdir($dir)) {
        return true;
    } else {
        return false;
    }
}

function main() {
    global $argc, $argv;
    if ($argc < 2) {
        echo "Please input the deleting folder.\n";
        return;
    }

    $dir = $argv[1];
    if (!realpath($dir)) {
        echo "The folder is not exists,folder=$dir\n";
        return;
    }
    deldir($dir);
}

main();