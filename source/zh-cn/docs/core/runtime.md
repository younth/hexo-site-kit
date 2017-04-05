title: node-runtime原理及升级方式
---

目前外卖线上机器的nodejs环境基于一套运行时的noderuntime（即机器上并未安装node）。具体我们利用 `Node Source Release` 进行编译。

### 为什么是 runtime

node版本迭代较快，为了便于我们自己维护升级，提高可控性，所以采用runtime的形式。用一个svn/git 分支去管理node版本。


### 如何编译

1. node官网下载 node tar.gz包 ，注意版本
2. 再机器上拉下runtime分支，进入source 目录
2. build.sh 里面修改 VERSION="X.X.X" 跟上面的node源码tar包文件名保持一致
3. 执行  sh build.sh
4. 将产出的noderunitme替换老的runtime即可