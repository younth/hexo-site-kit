## hexo-site-kit

基于Hexo快速搭建项目官网及文档平台。

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

### 切换主题

修改`_config.yml` 里面的 `theme`。目前提供两种主题：

- docs: 基于 egg 官网改造
- navy: 基于 hexo 官网改造

**切换主题的时候，务必先执行 `hexo clean` 清空之前的编译缓存**

