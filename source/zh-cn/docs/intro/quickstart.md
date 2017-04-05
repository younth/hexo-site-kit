title: 快速入门 
---

本文将以h5模块为实例，一步步地搭建出一个 NodeUI 应用，让你能快速的入门 NodeUI 开发。

> h5模块是运营活动方向主要的开发模块。主要用于开发: 包括端上的榜单、品牌馆等常态运营页; 每个月的特型运营活动; 成长轨迹等用户成长方向的长期运营页。在nodeui层支持微信授权、接口转发与数据裁剪等能力。

### 模块目录结构：

```
node_h5
  ├─ client           (客户端)
  │  ├─ node_modules  (node_h5特殊依赖的npm包)
  │  ├─ page          (入口文件)
  │  │  ├─ app        (常态页)
  │  │  ├─ huodong    (活动页)
  │  │  └─ layout.tpl
  │  ├─ widget        (具体业务代码)
  │  │  ├─ app
  │  │  └─ huodong
  │  │  └─ common     (通用组件及方法)
  │  └─ static        (公共静态资源)
  ├─ server           (服务端)
  │  ├─ action        (自动路由及逻辑处理)
  │  │  ├─ app
  │  │  ├─ huodong
  │  │  └─ common
  │  ├─ model         (数据处理)
  │  │  ├─ app
  │  │  └─ huodong
  │  │  └─ common
  │  ├─ lib           (工具库及微信授权相关代码)
  │  └─ router.js     (手动路由)
  ├─ mock             (数据mock配置)
  ├─ fekey-conf.js    (fekey编译配置)
  ├─ package.json     (入口文件)
  ...
```

## 基础工作

clone fly项目
```
git clone https://wangwei_iwaimai.baidu.com_waimai@xiaolvyun.baidu.com/git/waimai/c_fe/fly
```
clone h5项目
```
git clone https://wangwei_iwaimai.baidu.com_waimai@xiaolvyun.baidu.com/git/waimai/c_eden/h5
```

全局安装fekey（开发依赖nodeui环境与fekey）
```
sudo npm install -g fekey
```

【h5项目地址】 http://xiaolvyun.baidu.com/waimai/icode/repo/waimai%2Fc_eden%2Fh5/files/master/tree/

【fly项目地址】 http://xiaolvyun.baidu.com/waimai/icode/repo/waimai%2Fc_fe%2Ffly/files/master/tree/

## 开发流程
### 创建文件及目录

可以手动创建目录，也可以通过 `fekey init` 脚手架工具进行创建。 

### 本地开发

> 本地开发一般情况下，使用本地nodeui服务与数据mock能力。

1. 在fly模块下执行 `npm run dev` 启动nodeui服务
2. 在h5模块下执行 `npm run self` 执行代码编译
3. 获取本机ip
4. 将waimai域代理到本机的8197端口

```
http://waimai.baidu.com:80 -> http://本机ip:8197
https://waimai.baidu.com:443 -> http://本机ip:8197
```

5. 访问 http://waimai.baidu.com/fly/h5/huodongname 

注意：可以通过http://127.0.0.1:8197/fly/h5/huodongname进行本地开发，但是，当项目依赖登录及微信授权功能时，建议在开发阶段就代理到waimai域进行开发，养成良好开发习惯，避免联调阶段发生由于域名不一致导致的登录判断失败。

### 数据mock能力
*mock应用详见：[mock](../basics/mock.md)*

#### 1. ral请求：

1. 在model中增加 `enableMock: true` 开启自动mock能力
2. 在/mock/ral/中新增与model中请求接口地址对应一定规则的名称的文件。

    eg. model中请求/huodong/gamedetail接口，即在/mock/ral/中新建huodong-gamedetail.js文件。文件内容为:

```js
    module.exports = {
        errno: 0,
        errmsg: "",
        result: false // false点赞失败 566点赞成功，最新点赞数
    };
```

#### 2. h5请求：

1. 在/mock/h5/中新增任意有标识性的mock文件（建议与ral请求mock文件命名规则一致）。文件内容为：

```js
    module.exports = function(req, res, next) {
    res.json({
        error_no: 0,
        error_msg: "",
        result: false // false点赞失败 566点赞成功，最新点赞数
    })
};
```

2. 在/mock/server.conf中设置rewrite重写规则，将请求rewrite到指定文件中。

```bash
  rewrite ^\/huodong\/(gamedetail)$ /mock/h5/huodong-gamedetail.js
```

### 联调

联调阶段一般情况下仍然采用本地开发，直接访问RD环境接口方式进行联调。也可以将前端代码部署到RD环境，在RD环境进行联调。此处介绍第一种联调方式，第二种联调方式与提测方法相同。

**注意：联调阶段需要将mock能力关闭，并将请求转发到RD环境。**

#### 1. ral部分

1. 将model中用于mock的enableMock: true能力删除
2. 将nodel中的SHOPUI请求改为dev
3. 将fly中的dev环境设置为RD环境
4. nodeui重启

#### 2. h5部分

在server.conf中设置proxy代理规则，将请求proxy到指定的RD环境

```
    proxy ^\/huodong\/(gamedetail)$ http://waimai.baidu.com/huodong/$1
    proxy ^\/huodong\/main\/loverlike(.*)$ http://gzhxy-waimai-dcloud26.gzhxy.iwm.name:8109/huodong/main/loverlike$1
```

#### 三. 微信授权部分

1. 将 /server/model/wechat.es6 中的所有mock能力注释掉(注释enableMock: Fly.DEBUG)
2. 将fly中的serverHost改为RD环境
3. `nodeui重启`
4. 如果遇到ip未授权，需要RD支持将对应端口的ip限制关闭

```
    内网接口：
    /hongbao/getmobilebyopenid
    /hongbao/addmobileopenid
    /hongbao/updatemobilebyopenid
    
    关闭内网限制：
    /home/map/odp_cater/app/hongbao/actions/api
    注释：$this->checkIp = true;
```

5. 重新授权需要访问 https://waimai.baidu.com/fly/h5/demo 清除openid

### 提测

提测需要QA机器上有可用的nodeui服务，并将前后端代码部署到QA环境。

#### 1. 确认QA的nodeui环境是否可用

    访问 http://gzhxy-waimai-dcloud26.gzhxy.iwm.name:8137/fly/upload（备注：8137为8197对应端口）

    页面展示 http://gzhxy-waimai-dcloud26.gzhxy.iwm.name:8137/fly/upload is ready to work 则表示nodeu服务可用
    
    如果接口返回404 表示nodeui环境不可用，需要按照该文档 http://wiki.inwaimai.baidu.com/pages/viewpage.action?pageId=4420863 进行nodeui环境部署

#### 2. 将QA环境receiver地址配置到deploy.js中

```
yusheng: 'http://gzhxy-waimai-dcloud26.gzhxy.iwm.name:8137/fly/upload',
```

#### 3. 执行 `fekey release yusheng -cw`
#### 4. 设置代理, 将waimai域代理到QA环境上
```
http waimai.baidu.com 80 -> http gzhxy-waimai-dcloud26.gzhxy.iwm.name 8109
https waimai.baidu.com 443 -> http gzhxy-waimai-dcloud26.gzhxy.iwm.name 8109
（备注：8109为8086对应端口）
```
#### 5. 访问活动链接进行测试

#### 6. 微信授权部分，参照联调三-微信授权部分

### 验收
验收手机需要设置代理 ip 8888

并安装代理环境的https证书，才能代理https链接 charlesproxy.com/getssl
