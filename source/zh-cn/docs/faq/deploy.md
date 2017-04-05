title: NodeUI环境及部署问题汇总
---

### 1. QA机器如何一键部署nodeui环境

- 利用乐高平台（版本>=8.4），选择nodeui模块，进行一键同步到对应的机器。[传送门](http://lego.inwaimai.baidu.com/#/nodeui)

- 修改端口映射：nodeui 的核心端口是8197 ，对应需要映射到你机器的端口。

*注意：现在乐高同步NodeUI已经是公有云mirror代码了*

### 2. 修改配置

乐高同步代码后，默认的cater rewrite指向一般不是本机的Nodeui。修改方式：

    vim /home/map/odp_cater/webserver/conf/vhost/rewrite
    

- 搜索`nodeui`关键词，改成`http://127.0.0.1:8197`。
- 搜索`nodeh5`关键词，改成`http://127.0.0.1:8201`。

然后重启ng：

    sh /home/map/odp_cater/webserver/loadnginx.sh

### 3. 如何启动nodeui服务

启动NodeUI服务有如下两种方式：

- 通过bash脚本启动（`推荐方式`）

    sh /home/map/nodeui/scripts/restart.sh

- 通过命令行启动，会占据当前命令行窗口(`调试时候使用，日志会打到终端`)

    env  DEBUG=true /home/map/nodeui/node_runtime/bin/node app.js

通过检测：`http://{你的机器/IP}:{8197端口的映射}/fly/upload`
    判断服务是否正常启动
    
***注意*：**

- 机器可能残留node进程导致启动失败，此时 `ps -ef | grep node` 然后，`kill` 掉响应的进程即可以
- docker机器 nodeui默认端口是`8197`，注意你的机器对应的端口映射。
    
### 4. mirror上如何修改使nodeui服务打到本机

    cd /home/work/odp_cater/webserver/conf/vhost
    vim rewrite
    
    // 修改点
    location /stickyRice {
        rewrite ^/stickyRice/([^\?]*)?((\?.*)?)$ /stickyRice/$1$2  break;
        proxy_pass  http://nodeui;
    }
    
    location /fly {
        rewrite ^/fly/([^\?]*)?((\?.*)?)$ /fly/$1$2  break;
        proxy_pass  http://nodeh5;
    }

以上两处涉及nodeui服务，将 nodeui 改为 `http://127.0.0.1:8197` nodeh5 改为 `http://127.0.0.1:8201`

    
    
