<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/demo.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body onkeydown="keyLogin();">
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>欢迎你</h3>
						<form action="#" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户" id="username">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="logpass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码" id="pwd">
							</div>
							<div class="mb2"><a class="act-but submit" href="javascript:;" style="color: #FFFFFF" id="login" onclick="go();">登录</a></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="<%=request.getContextPath() %>/js/TweenLite.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/EasePack.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/rAF.js"></script>
		<script src="<%=request.getContextPath() %>/js/demo-1.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
				
			function checkName(){
				var name=document.getElementById("username").value.trim();
				if(!name){
					new $.zui.Messager('用户名不能为空！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
					return false;
				}
				return true;
			}
			
			function checkPwd(){
				
				var pwd=document.getElementById("pwd").value.trim();
				if(!pwd){
					new $.zui.Messager('登陆密码不能为空！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
					return false;
				}
				return true;
			}
			
			function go(){
				var name=document.getElementById("username").value.trim();
				var pwd=document.getElementById("pwd").value.trim();
				var id=null;
				if(!checkName() && !checkPwd()){
					new $.zui.Messager('登陆失败，请检查用户名或密码是否符合规范！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
				}else{
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/faxie/login.do",
						data:{"id":id,"UserName":name,"PassWord":pwd},
						beforeSend:function(){
							var a=document.getElementById("login");
							a.innerHTML='<div id="Loading" style="display:block;"><i class="icon icon-spin icon-spinner-indicator"></i><strong style="font-size:16px;color:#808080;">登陆中...</strong></div>';
						},
						success:function(data){
							//alert(data);
							if(data==1){
								new $.zui.Messager('登陆成功！',{
									icon:'ok-sign',
									type:'success'
								}).show();
								setTimeout(function() {
									
								window.location.assign("${pageContext.request.contextPath}/faxie/tishi.do");
								}, 3000);
							}else if(data==0){
								new $.zui.Messager('登陆成功！',{
									icon:'ok-sign',
									type:'success'
								}).show();
								setTimeout(function() {
									
									window.location.assign("${pageContext.request.contextPath}/faxie/home.do");
									}, 3000);
							}else if(data==2){
								new $.zui.Messager('用户名或密码错误！',{
									icon:'exclamation-sign',
									type:'danger'
								}).show();
							}
							//alert("登陆成功");
							//window.location.assign("${pageContext.request.contextPath}/faxie/home.do");
						},
						error:function(){
							new $.zui.Messager('未知错误！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
						},
						complete:function(){
							var a=document.getElementById("login");
							a.innerHTML="登陆";
						}
					});
				}
			}
			
			function keyLogin(){
				if(event.keyCode==13){
					document.getElementById("login").click();
				}
			}
			
		</script>
		
		<div style="text-align:center;">
</div>
	</body>
</html>