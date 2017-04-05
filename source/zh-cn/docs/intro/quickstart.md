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

