<header id="banner" class="wrapper">
  <div class="inner">
    <h2 id="banner-title">{{ page.subtitle }}</h2>
    <div id="banner-start">
      <span id="banner-start-command">npm install fekey -g</span><a id="banner-start-link" href="docs/"><i class="fa fa-arrow-right"></i></a>
    </div>
    {# 
      <div id="banner-share">{{ partial('partial/share') }}</div>
    #}
  </div>
</header>
<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      <ul id="intro-feature-list">
       <li class="intro-feature-wrap">
           <div class="intro-feature">
               <div class="intro-feature-icon">
                   <i class="fa fa-bolt"></i>
               </div>
               <h3 class="intro-feature-title">超快速度</h3>
               <p class="intro-feature-desc">Node.js 所带来的超快生成速度，让上百个页面在几秒内瞬间完成渲染。</p>
           </div>
       </li>
       <li class="intro-feature-wrap">
           <div class="intro-feature">
               <div class="intro-feature-icon">
                   <i class="fa fa-pencil"></i>
               </div>
               <h3 class="intro-feature-title">支持 Markdown</h3>
               <p class="intro-feature-desc">Hexo 支持 GitHub Flavored Markdown 的所有功能，甚至可以整合 Octopress 的大多数插件。</p>
           </div>
       </li>
       <li class="intro-feature-wrap">
           <div class="intro-feature">
               <div class="intro-feature-icon">
                   <i class="fa fa-cloud-upload"></i>
               </div>
               <h3 class="intro-feature-title">一键部署</h3>
               <p class="intro-feature-desc">只需一条指令即可部署到 GitHub Pages, Heroku 或其他网站。</p>
           </div>
       </li>
       <li class="intro-feature-wrap">
           <div class="intro-feature">
               <div class="intro-feature-icon">
                   <i class="fa fa-cog"></i>
               </div>
               <h3 class="intro-feature-title">丰富的插件</h3>
               <p class="intro-feature-desc">Hexo 拥有强大的插件系统，安装插件可以让 Hexo 支持 Jade, CoffeeScript。</p>
           </div>
       </li>
   </ul>
      <ul id="intro-cmd-wrap">
        <li class="intro-cmd-item">npm install fekey -g</li>
        <li class="intro-cmd-item">fekey init</li>
        <li class="intro-cmd-item">fekey release</li>
        <li class="intro-cmd-item">fekey server</li>
      </ul>
      <div id="intro-get-started-wrap">
        <a href="{{ index_link('/docs/intro/quickstart.html') }}" id="intro-get-started-link">{{ __('index.getstart') }}</a>
      </div>
    </div>
  </div>
</div>