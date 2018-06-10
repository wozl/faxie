<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			
		</script>
		<title></title>
	</head>
	<body>
<div class="row">
  <div class="col-xs-3">
    <ul class="nav nav-tabs nav-stacked">
     <li>欢迎您：<strong>${sessionScope.username}</strong><a href="<%=request.getContextPath() %>/faxie/Write_off.do" >【退出】</a></li>
      <li class="active"><a href="###" data-target="#tab3Content1" data-toggle="tab"><i class="icon icon-th"></i>&nbsp;首页</a></li>
      <li><a href="###" data-target="#tab3Content2" data-toggle="tab"><i class="icon icon-user"></i>&nbsp;个人资料</a></li>
      <li><a href="###" data-target="#tab3Content3" data-toggle="tab"><i class="icon icon-time">&nbsp;动态</i></a>
      </li>
      <li><a href="###" data-target="#tab3Content4" data-toggle="tab"><i class="icon icon-calendar"></i>&nbsp;日记小屋</a></li>
      <li><a href="###" data-target="#tab3Content5" data-toggle="tab"><i class="icon icon-leaf"></i>&nbsp;文章</a></li>
      <li><a href="###" data-target="#tab3Content6" data-toggle="tab"><i class="icon icon-music"></i>&nbsp;音乐</a></li>
      <li><a href="###" data-target="#tab3Content7" data-toggle="tab"><i class="icon icon-cog"></i>&nbsp;设置</a></li>
    </ul>
  </div>
  <div class="col-xs-9">
    <div class="tab-content col-xs-9">
      <div class="tab-pane fade active in" id="tab3Content1">
        <iframe src="<%=request.getContextPath() %>/faxie/Wel.do" width="1415" height="1200" frameborder="0" name="f1" id="f1"></iframe>
      </div>
      <div class="tab-pane fade" id="tab3Content2">
        <iframe src="<%=request.getContextPath() %>/faxie/datauser.do" width="1415" height="1200" frameborder="0" name="f2" id="f2"></iframe>
      </div>
      <div class="tab-pane fade" id="tab3Content3">
        <iframe src="<%=request.getContextPath() %>/faxie/gocon.do" width="1415" height="1200" frameborder="0" name="f2" id="f2"></iframe>
      </div>
      <div class="tab-pane fade" id="tab3Content4">
        <iframe src="<%=request.getContextPath() %>/faxie/gowrite_diary_list.do" width="1415" height="1200" frameborder="0" name="f4" id="f4"></iframe>
      </div>
      
      <div class="tab-pane fade" id="tab3Content5">
        <h2>对不起此路不通！作者正在努力开发中>_< </h2>
      </div>
      <div class="tab-pane fade" id="tab3Content6">
        <iframe src="<%=request.getContextPath() %>/faxie/gomusic.do" width="1415" height="1200" frameborder="0" name="f6" id="f6"></iframe>
      </div>
       <div class="tab-pane fade" id="tab3Content7">
        	欢迎下次光临哦^_~  &nbsp;&nbsp; <a href="<%=request.getContextPath() %>/faxie/Write_off.do">点此</a>退出哦
      </div>
    </div>
  </div>
</div>
		
	</body>
</html>
