## hexo-docs 快捷建设项目官网

项目官方文档平台通过 `hexo` 搭建。

### 安装依赖

#### 1. 全局安装 hexo-cli

    npm i -g hexo-cli --registry=https://registry.npm.taobao.org

#### 2. 安装项目依赖

    npm i --registry=https://registry.npm.taobao.org

### 查看效果

    hexo s

### 开发

    hexo n "My New Post"
    hexo s
    hexo s -g // 预览加部署
    hexo d -g // hexo g && hexo d 生成及部署

### 注意

- 切换主题的时候，务必先执行 `hexo clean` 清空之前的编译缓存
