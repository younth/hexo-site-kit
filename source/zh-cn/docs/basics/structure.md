title: 目录结构
---

在[快速入门](../intro/quickstart.md)中，大家对框架应该有了初步的印象，接下来我们简单了解下目录约定规范。

### 1. 框架目录结构
![framework]

### 2. 业务模块结构
![business]

[framework]: http://younth.coding.me/static/520/fly.png
[business]: http://younth.coding.me/static/520/project.jpg

```bash
nodeui-project
├── package.json
├── fis-config.js
├── client
|   ├── package.json
│   ├── page
│       ├── layout.tpl 
│   |   └── index.tpl (可选)
│   ├── static
│   |   └── test.js
│   └── widget
│       ├── common
│       └── app (可选)
├── server
|   ├── router.js
│   ├── action
│   |   └── test.js
│   ├── model
│   |   └── test.js
│   ├── lib (可选)
│   |   └── util.js.js
│   └── dif (可选)
│       └── test.js
└── mock
    ├── server.conf
    ├── ral
    |   └── hongbao-getmobilebyopenid.js(可选)
    └── common
        ├── sample.json (可选)
        └── dynamic.js (可选)
```

如上，由框架约定的目录：
