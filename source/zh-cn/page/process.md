layout: post
title: NodeUI接入流程
---

如果当前的产品开发陷入了如下的困惑：

- 前端开发环境强依赖后端
- 基于`React/Vue`移动端性能优化遇到首屏瓶颈
- 想用`bigpipe`加速渲染
- 后端统一输出的接口不满意，想拆分 or 想合并请求
- 我是前端，我就是想用`Node.js`

那么，恭喜你，NodeUI是非常适合你的。我们的接入流程是：

#### 1. 流量预估

如果你想直接把自己的业务接入线上的NodeUI服务，那么需要实现评估业务的流量。主要包括 `PV` 及 `QPS`。

项目 | 预估值
--- | ---
QPS峰值 | 10
PV总量  | 10W

#### 2. 申请路由及模块

项目 | 说明 
--- | ---
模块名称 | cfe_h5
iCode地址 | http://xiaolvyun.baidu.com/waimai/icode/repo/waimai/c_eden/h5/files/master/tree/
路由名称 | fly/vip
BNS服务 | group.waimai-frontend.iwaimai.all

**注意：项目模块名称及fekey构建时候的namespance，与路由名称可以不一致**

#### 3. 发送邮件

发邮件至 `wangyang@iwaimai.baidu.com`, `liushuchao@iwaimai.baidu.com`,`xumingjie@iwaimai.baidu.com`，并抄送 `lilide@iwaimai.baidu.com`。

收到邮件确认后，我们会在上线系统中申请绑定模块及增加nodeui app 模块。