# 一、系统配置类
## 1.设置 swap 分区
- 下载并上传 [mkswap.sh](./common/mkswap.sh) 脚本到服务器
- 运行 `bash mkswap.sh` 命令进行 swap 分区设置
默认值：swap文件路径=/swapfile，分区大小=4GB，swappiness=60
- `mkswap.sh` 命令示例：
```
#size=4GB,swappiness=60
bash mkswap.sh

#size=2GB,swappiness=50
bash mkswap.sh 2 50
```

# 二、软件安装类