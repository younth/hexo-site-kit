title: Service
---

NodeUI 中，使用 [node-ral] 进行后端服务管理，我们引入后端服务管理层主要是解决以下几个问题:

- 后端服务配置统一管理
- 封装异常处理、超时重试，提升系统稳定性
- 封装日志，便于线上问题追查
- 抽象请求协议、数据格式与数据编码，统一用户接口

## 主要特征

- BNS Support
- IDC Support
- json,querystring,form ...
- http/https 
- proxy
- Load Balance

## 使用 Service

`Fly`全局变量下面有`ral`及`ralP`两个方法，用于向后发送请求。区别是`ralP`返回的是一个`promise`对象。


```js
module.exports = {
    getData: function(req, tools, params) {
        var options = {
            data: params || {},
            path: '/huodong/gamebase',
            //enableMock: true,
        };
        // ralP 推荐
        return Fly.ralP('SHOPUI', options)
        // ral
        FLy.RAL(serverName, defaultOptions).on('data', function (data) {
            resolve(data);
        }).on('error', function (error) {
            reject(error);
        });
    }
}

```

## 服务配置

ral请求的配置目录为`fly/conf/ral/config.js`，里面主要定义了向后请求的host及port。更改配置即可更新向后请求的服务。

```js
// 全局配置 serverName为 SHOPUI
let serverHost = 'waimai.baidu.com';
let serverPort = 80;

// dev配置 serverName为 dev
const devServerHost = 'waimai.baidu.com';
const devServerPort = 80;
```


## 向后服务通信原理

![node-php](http://younth.coding.me/static/nodeui/bns.png)


[node-ral]: https://github.com/fex-team/node-ral
