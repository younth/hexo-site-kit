<div class="index">
  <div class="banner block index-bg-light">
    <div class="banner-logo">
      <!-- <img src="https://zos.alipayobjects.com/rmsportal/JFKAMfmPehWfhBPdCjrw.svg"/> -->
    </div>
    <div class="banner-info">
      <h1 class="fadeInUp animated"><p style="font-weight:bold;font-size:48px;">Born to build</p>better enterprise frameworks and apps with Node.js & Express</h1>
      <p style="font-size: 22px;" class="fadeInUp animated">{{ page.subtitle }}</p>
      <p class="banner-button fadeInUp animated">
        <a class="btn btn-primary" href="{{ index_link('/docs/intro/quickstart.html') }}">{{ __('index.getstart') }}</a>
        <a class="btn btn-secondary" href="http://xiaolvyun.baidu.com/waimai/icode/repo/waimai%2Fc_fe%2Ffly/files/master/tree/">iCode</a>
      </p>
    </div>
  </div>
</div>
{# 移动端导航需要 #}
<div class="index-aside">
{{ partial('partial/aside') }}
</div>
{{ partial('partial/footer') }}


