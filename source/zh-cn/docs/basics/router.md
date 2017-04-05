title: Router 路由
---

Router 主要用来描述请求 URL 和具体承担执行动作的 Controller 的对应关系，
框架约定了 `server/router.js` 文件用于统一所有路由规则。

通过统一的配置，我们可以避免路由规则逻辑散落在多个地方，从而出现未知的冲突，集中在一起我们可以更方便的来查看全局的路由规则。

## 如何定义 Router

### 手动方式

寻找项目的router.js对应的路由映射。访问路径为`fly/${yourpath}/${routername}`

```js
// app/router.js
module.exports = {
    'getwxtoken': 'action/common/wxtoken.js',
    'bdwmurl': 'action/common/bdwmurl.js',
    'universal': 'action/common/universal.js'
}
```

### 自动路由

以 `fly/h5/demo`为例，寻找的路径及顺序是：

- action/huodong/demo.js 
- action/app/demo.js
- action/demo.js

### 注意

路由支持时间戳：主要是为了防止微信屏蔽path，下面这两种路由效果是一样的

- waimai.baidu.com/fly/h5/435353532342/demo
- waimai.baidu.com/fly/h5/demo

## todo

路由系统需要升级
