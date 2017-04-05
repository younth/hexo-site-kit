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

###### *node版本迭代较快，升级node版本一定要经常非常缜密的测试回归*
**当前Source Release基于GCC 4.8.2编译，务必在对应的开发机器上进行源码编译，得到最新的可运行的node二进制文件。**

### 如何运行

在开发机器上找到对应的nodeui目录，以公有云机器为例：


```
// 查看node版本env DEBUG=true /home/work/nodeui/node_cater/node_runtime/bin/node -v

// 开发环境启动nodeui服务

env DEBUG=true /home/work/nodeui/node_cater/node_runtime/bin/node app.js
```


附编译的脚本

```
#! /bin/bash

set -e
VERSION="6.3.0"

pushd . > /dev/null
BASE_DIR="${BASH_SOURCE[0]}";
while([ -L "${BASE_DIR}" ]); do
    cd "`dirname "${BASE_DIR}"`"
    BASE_DIR="$(readlink "$(basename "${BASE_DIR}")")";
done
cd "$(dirname "${BASE_DIR}")" > /dev/null
BASE_DIR="$(pwd)";
# stick with noah python
mkdir -p "$BASE_DIR/bin/"
ln -s "/noah/bin/python2.7" "$BASE_DIR/bin/python2" || true
ln -s "/noah/bin/python2.7" "$BASE_DIR/bin/python" || true
export PATH="$BASE_DIR/bin/":$PATH
# check
python --version
gcc -v
# extract
tar -zxf "node-v$VERSION.tar.gz"
cd "node-v$VERSION"
# patch
# patch -p0 -i ../node-gyp-python.patch
# compile
./configure --without-snapshot --prefix "$BASE_DIR/install/"
echo "start compile"
make -j8 > /dev/null
# test
echo "run test"
mkdir -p /tmp/nodetest
PYTHON="/noa/bin/python2.7" NODE_TEST_DIR=/tmp/nodetest make test || true
# move file
echo "start install"
make install > /dev/null
# test binary
echo "run binary test"
cd "$BASE_DIR/test"
export PATH="$BASE_DIR/install/bin":$PATH
node -v
npm i
node index.js
# pack
cd "$BASE_DIR/install/"
sed -i '1s/.*/#!\/usr\/bin\/env node/' "$BASE_DIR/install/lib/node_modules/npm/bin/npm-cli.js"
rm -rf "$BASE_DIR/output"
mkdir "$BASE_DIR/output"
tar -zcf "$BASE_DIR/output/nodejs.tar.gz" ./*
cd ..
echo "build end"

```
