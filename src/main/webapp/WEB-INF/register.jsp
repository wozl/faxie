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
			
			var code;//设置全局变量，用于保存验证码
			
			function createCode(){
				//滞空code
				code="";
				//产生4位长度的验证码，长度可以更改
				var codeLength=4;
				var codeV=document.getElementById('code');
				//设置随机字符
				var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
				//循环codeLength 循环4次
				for(var i=0;i<codeLength;i++){
					//设置随机数范围 这里为0~36
					var index=Math.floor(Math.random()*36);
					//字符串拼接 将每次产生的随机数进行拼接
					code +=random[index];
				}
				//将拼接好的字符串赋值给展示的value
				codeV.value=code;
			}
			
			//判断输入的字符串是否和产生的随机数相等
			function validate(){
				
				var oValue=document.getElementById('input').value.toUpperCase();
				if(oValue==0){
					var msg= new $.zui.Messager('请输入验证码!',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
				}else if(oValue !=code){
					var msg= new $.zui.Messager('验证码输入不正确，请注意大小写！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
					oValue=' ';
					createCode();
					return false;
				}else{
					//alert('验证成功，即将跳转到');
					return true;
				}
				
			}
		
		//提交前检查
		function checkName(){
			
			var name=document.getElementById("username").value.trim();
			if(!name){
				var m= new $.zui.Messager('请检查用户名是否为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
			return true;
		}
		
		function checkPwd(){
			
			var pwd=document.getElementById("pwd").value.trim();
			var pwd2=document.getElementById("pwd2").value.trim();
			if(!pwd || !pwd2){
				var m= new $.zui.Messager('密码不能为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}else if(!(pwd==pwd2)){
				var m= new $.zui.Messager('两次输入的密码不一致！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
			return true;
		}
		
		
		window.onload=function(){
				createCode();
				
			}
		//提交前检查
		function go(){
			checkName();
			checkPwd();
			validate();
			if(!checkName() || !checkPwd() || !validate()){
				new $.zui.Messager('注册失败，请确保填写信息正确！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
			}else{
				var id=null;
				var user=document.getElementById("username").value.trim();
				var pwd=document.getElementById("pwd2").value.trim();
				//alert(pwd);
				$.ajax({
					type:"post",
					url:'${pageContext.request.contextPath}/faxie/reg.do',
					//contentType:'application/json',
					data:{"id":id,"UserName":user,"PassWord":pwd},
					beforeSend:function(){
						document.getElementById("butreg").innerHTML='<button class="btn  disabled"><span class="icon icon-spin icon-spinner"></span>注册中...</button>';
					},
					success:function(data){
						
						new $.zui.Messager('注册成功！',{
							icon:'ok-sign',
							type:'success'
						}).show();
						setTimeout(function(){
							mss();	
						}, 3000);
						
					},
					error:function(){
						new $.zui.Messager('注册失败!用户名'+user+'已存在',{
							icon:'exclamation-sign',
							type:'danger'
							
						}).show();
					},
					complete:function(){
						document.getElementById("butreg").innerHTML='<button class="btn btn-primary" type="button" onclick="go();" style="margin-left: 130px;" id="reg">注册</button>';
					}
				});
				
			}
		}
		 function mss(){
			 window.location.assign("${pageContext.request.contextPath}/faxie/Login.do");
			
		 }
		
		/* function reg(){
			if(event.keyCode==13){
				document.getElementById("reg").click();
			}
		} */
		 
		</script>
		<style>
			#code{  
                font-family:Arial;  
                font-style:italic;  
                font-weight:bold;  
                border:0;  
                letter-spacing:2px;  
                color:blue;  
            }
			
		</style>
		<title>欢迎注册</title>
	</head>
	<body >
		<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;filter:alpha(opacity=100); -moz-opacity:0.3;-khtml-opacity: 0;opacity: 1;margin-top: -100px;">    
			<img src="<%=request.getContextPath() %>/img/res.jpg" height="100%" width="100%"/>
		</div>
		<div style="background-color: white; width: 500px;border: 1px solid white;margin-top: 100px;margin-left: 500px;">
			<p><h2 style="text-align: center;"><i class="icon icon-user"></i>欢迎注册</h2></p>
			<div class="input-group" style="margin-left: 130px; margin-bottom: 30px;">
				<span class="input-group-addon"><i class="icon icon-user"></i></span>
				<input type="text" class="form-control" placeholder="用户名" style="width: 180px;" id="username">
			</div>
			<div class="input-group" style="margin-left: 130px; margin-bottom: 30px;">
				<span class="input-group-addon"><i class="icon icon-key"></i></span>
				<input type="password" class="form-control" placeholder="密码" style="width: 180px;" id="pwd">
			</div>
			<div class="input-group" style="margin-left: 130px;margin-bottom: 30px;">
				<span class="input-group-addon"><i class="icon icon-key"></i></span>
				<input type="password" class="form-control" placeholder="确认密码" style="width: 180px;" id="pwd2">
			</div>
			<div class="input-group" style="margin-left: 130px;margin-bottom: 30px;">
				<span class="input-group-addon"><i class="icpn icon-unlock-alt"></i></span>
				<input type="text" class="form-control" placeholder="验证码" style="width: 80px;" id="input">
				&nbsp;&nbsp;
				<input type = "button" id="code" onclick="createCode()"/>&nbsp;&nbsp;<span style="color: orangered; font-size: 15px;">请区分大小写!</span>
			</div>
			<div id="butreg">
				<button class="btn btn-primary" type="button" onclick="go();" style="margin-left: 130px;" id="reg">注册</button>
			</div>
		</div>
		
	</body>
</html>
