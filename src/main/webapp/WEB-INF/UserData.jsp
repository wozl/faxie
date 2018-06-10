<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/mzui/css/mzui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>	
		<script type="text/javascript" src="<%=request.getContextPath() %>/mzui/js/mzui.min.js" ></script>
		<script type="text/javascript">
			window.onload=function(){
				data();
			}	
		
			function data(){
				$.ajax({
						type:"POST",
						url:"${pageContext.request.contextPath}/faxie/goUserData.do",
						data:{},
						beforeSend:function(){
							document.getElementById("Loading").style.display="block";
							document.getElementById("content").style.display="none";
						},
						success:function(data){
							$("#name").val(data.name);
							document.getElementById("time").innerHTML=data.registeredTime;
							var radio=document.getElementsByName("sex");
							for(var i=0;i<radio.length;i++){
								if(radio[i].value==data.sex){
									radio[i].checked=true;
									break;
								}
							}
							$("#age").val(data.age);
							
							var hib=(data.hobbies).split("-");
							var 	checkbox=document.getElementsByName("Hobbies");
							for(var j=0;j<checkbox.length;j++){
								if(checkbox[j].value==hib[j]){
									checkbox[j].checked=true;
									continue;
								}else{break;}
								
							}
							$("#add").val(data.address);
						},
						error:function(){
							new $.zui.Messager('获取用户资料失败，请检查网络或者联系管理员！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
						},
						complete:function(){
							document.getElementById("Loading").style.display="none";
							document.getElementById("content").style.display="block";
						}
					});
				}
			
		</script>
		</script>
		<title>个人资料</title>
	</head>
	<body>
		<style>
			.profile-haeder {position: relative; overflow: hidden; min-height: 8rem}
			.profile-haeder > .back {top: -2rem; left: -2rem; right: -2rem; bottom: -2rem; background-position: center; background-size: cover}
			.profile-haeder > .front {background: rgba(0,0,0,.1); text-align: center; padding: 1.5rem}
		</style>
		<div id="Loading" style="margin-top:10px; display: none;">
				<center>
					<button type="button" class="btn loading loading-light gray">加载中...</button>
					<strong style="font-size:16px;color:#808080;">加载中...</strong>
				</center>
		</div>
		<div id="content">
		<div class="profile-haeder space shadow">
  <div class="gray dock blur-lg back" style="background-image: url(<%=request.getContextPath() %>/img/avatar.png)"></div>
  <div class="front dock text-white">
    <div class="avatar avatar-xl circle space-sm">
      <img src="<%=request.getContextPath() %>/img/avatar.png" alt="">
    </div>
    <h4 class="lead text-shadow-black">${sessionScope.username}</h4>
  </div>
</div>

<div class="section">
  <div class="list with-divider">
    <a class="item with-avatar">
      <div class="avatar text-gray"><i class="icon-folder-open"></i></div>
      <div class="title">个人资料</div>
    </a>
  </div>
</div>
<div>
	
	<span><i class="icon icon-user"></i></span>
	<input type="text" class="form-control" placeholder="姓名" id="name" readonly="readonly"/>
		<br />
		<br />
		<strong>注册时间：</strong>
		<span id="time"></span>
		<br/>
	<div style="margin-top: 10px;" class="control">
		<strong>性别:</strong>&nbsp;
		<div class="radio inline-block">
			<input type="radio" name="sex" value="男"/>
			<label for="a">男</label>
		</div>
		<div class="radio inline-block">
			<input type="radio" name="sex" value="女"/>
			<label for="a">女</label>
		</div>
	</div>	
	
	<div>
		<strong>年龄:</strong>&nbsp;
		<input type="text" class="form-control" placeholder="年龄" style="width: 50px;" id="age" readonly="readonly"/>
	</div>
	<div style="margin-top: 10px;">
		<strong>爱好:</strong>&nbsp;
		<input type="checkbox" value="1" name="Hobbies"/>上网&nbsp;
		<input type="checkbox"  value="2" name="Hobbies"/>运动&nbsp;
		<input type="checkbox"  value="3" name="Hobbies"/>聊天&nbsp;
		<input type="checkbox"  value="4" name="Hobbies"/>听音乐&nbsp;
		<input type="checkbox"  value="5" name="Hobbies"/>旅游&nbsp;
	</div>
	
	<div style="margin-top: 10px;">
		<strong>地址:</strong>&nbsp;&nbsp;
		<input type="text" class="form-control" placeholder="省/市/区/镇" id="add" readonly="readonly"/>
	</div>
</div>
</div>
		
	</body>
</html>
