<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			
			
		</script>
		<title>日记内容页</title>
	</head>
	<body>
		<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;filter:alpha(opacity=70); -moz-opacity:0.3;-khtml-opacity: 0.3;opacity: 0.6;margin-top: -50px;">    
			<img src="<%=request.getContextPath() %>/img/fj.jpg" height="100%" width="100%"/>
		</div>
		<article class="article">
			<!--
            	作者：LQ
            	时间：2017-08-22
            	描述：文章头部
            -->
			<header>
				<h1 class="text-center">标题</h1>
				<dl class="dl-inline">
					<dt>发布时间：</dt>
					<dd>2017-01-01</dd>
				</dl>
			</header>
			<!--
            	作者：LQ
            	时间：2017-08-22
            	描述：文章正文部分
            -->
            <section class="content" style="font-size: 20px; color:#0000FF;">
            	此处为正文部分
            	
            </section>
            
		</article>
		
		
	</body>
</html>
