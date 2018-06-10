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
			window.onload=function(){
				show();
			}
			function show(){
				
				$("#tishi").modal('show');
			}
			
			function data(){
				window.location.assign("${pageContext.request.contextPath}/faxie/userdata.do");
			}
			
			
			
		</script>
		<title>提示填写用户资料</title>
	</head>
	<body>
		<div class="modal fade" id="tishi">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">关闭</span></button>
						<h4 class="modal-title">请仔细阅读以下文本</h4>
					</div>
					<div class="modal-body">
						<p><strong style="color: red;">首次登录请填写您的个人资料哦~</strong></p>
						<p><strong style="color: red;">如果您介意填写正确的个人资料，您可以把姓名地址随意填写，谢谢支持小弟哦~</strong></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="data();"><i class="icon icon-rocket"></i>已阅读，出发吧~</button>
					</div>
				</div>
			</div>
		</div>
		
		
	</body>
	
</html>
