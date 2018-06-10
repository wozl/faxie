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
		<title>管理员页面</title>
	</head>
	<body>
		<nav class="navbar navbar-default" role="navigation">
			<ul class="nav navbar-nav nav-justified">
				<li><a href="<%=request.getContextPath() %>/admin/AdminUsersList.do" target="showPage">用户管理</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/AdminActicle_management.do" target="showPage">文章管理</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/AdminActicle.do" target="showPage">文章编辑发布</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/GoServices.do" target="showPage">服务器状态</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/adminloginout.do" >管理登出</a></li>
			</ul>
		</nav>
		
		<iframe if="showPage" name="showPage" noresize="noresize" frameborder="0" scrolling="no" width="100%" height="1010" src="<%=request.getContextPath() %>/admin/AdminUsersList.do">
			
		</iframe>
		
	</body>
</html>
    