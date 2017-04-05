<!-- 增加header样式 -->
<header class="post-titlt">
	<h1 class="docs-header">
		<div class="container">
		  <i class="fa-flag-checkered fa"></i> {{ page.title }}
	    </div>
	</h1>
</header>

<div class="page-main post">
  <article class="markdown-body">

    {{ page.content }}
  </article>
</div>
{#
	{{ partial('egg/footer') }}
#}

