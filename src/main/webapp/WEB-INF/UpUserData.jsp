<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
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
					new $.zui.Messager('请输入验证码！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
				}else if(oValue !=code){
					new $.zui.Messager('验证码不正确，请重新输入！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
					oValue=' ';
					createCode();
				}else{
					
				}
			}
			
			window.onload=function(){
				createCode();
			}
			
			function upuserdata(){
				var regdata=nowTime();
				var id=null;
				var name=document.getElementById("name").value;
				var value="";
				var radio=document.getElementsByName("sex");
				for(var i=0;i<radio.length;i++){
					if(radio[i].checked){
						value=radio[i].value;
						}
					}
				var age=document.getElementById("age").value;
				var 	checkbox=document.getElementsByName("Hobbies");
				var hobbies=[];
				for(var j=0;j<checkbox.length;j++){
				 if(checkbox[j].checked){
						hobbies[j]=checkbox[j].value;	
					}
				}
				alert(hobbies);
				//将数组转成字符串
				var hibbie=hobbies.join("-");
				var add=document.getElementById("address").value;
				$.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/faxie/getuserdata.do',
					data:{"id":id,"Name":name,"RegisteredTime":regdata,"Sex":value,"Age":age,"Hobbies":hibbie,"Address":add,"UserID":null},
					beforeSend:function(){//请求发送前
						document.getElementById("butdata").innerHTML='<button class="btn  disabled"><span class="icon icon-spin icon-spinner"></span>更新中...</button>';
					},
					success:function(data){
						if(data==0){
							new $.zui.Messager('更改成功！',{
								icon:'ok-sign',
								type:'success'
							}).show();
							setTimeout(function(){
								window.location.assign("${pageContext.request.contextPath}/faxie/home.do");
							},3000);
						}else if(data==1){
							new $.zui.Messager('更新失败！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
						}
						
					},
					error:function(){
						new $.zui.Messager('更新用户资料失败，请检查网络或者联系管理员！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
					},
					complete:function(){//不论成功还是失败都会执行
						document.getElementById("butdata").innerHTML='<button class="btn btn-primary" onclick="upuserdata();">提交</button>';
					}
				});
				
			}
			
			function nowTime(){
		 		var times=new Date();
		 		var y,m,date,day,hs,ms,ss,theDateStr;
		 		y=times.getFullYear();//四位年例如2017
		 		m=times.getMonth()+1;//月
		 		date=times.getDate();//天
		 		day=times.getDay();//星期
		 		hs=times.getHours();//时
		 		ms=times.getMinutes();//分
		 		ss=times.getSeconds();//秒
		 		if(m<10){
		 			m="0"+m;
		 		}
		 		if(ms<10){
		 			ms="0"+ms;
		 		}
		 		if(ss<10){
		 			ss="0"+ss;
		 		}
		 		if(date<10){
		 			date="0"+date;
		 		}
		 		theDateStr=y+"-"+m+"-"+date+"  "+hs+":"+ms+":"+ss;
		 		return theDateStr;
		 	}
			
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
		<title>完善个人信息</title>
	</head>
	<body>
		<!--<div>  
	        <input type = "text" id = "input" value="" />  
	        <input type = "button" id="code"/>  
	        <input type = "button" value = "验证" onclick = "validate()"/>  
    	</div> -->
    	<center>
    		<h2>请完善如下资料</h2>
    		<table>
    			<tr>				
    				<td>
    					<label>姓名：</label>
    					<input type="text" placeholder="姓名"  id="name"/>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>性别：</label>
    					<input type="radio"  name="sex" value="男" checked="checked"/>男 &nbsp;&nbsp;
    					<input type="radio"  name="sex" value="女"/>女
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>年龄：</label>
    					<input type="text" placeholder="年龄" id="age"/>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>爱好：</label>
    					<input type="checkbox" value="1" name="Hobbies"/>上网&nbsp;
						<input type="checkbox" value="2" name="Hobbies"/>运动&nbsp;
						<input type="checkbox"  value="3" name="Hobbies"/>聊天&nbsp;
						<input type="checkbox"  value="4" name="Hobbies"/>听音乐&nbsp;
						<input type="checkbox" value="5" name="Hobbies"/>旅游&nbsp;
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>地址：</label>
    					<input type="text"  placeholder="省/市/区/镇" id="address"/>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>验证码：</label>
    					<input type = "text" id = "input" placeholder="验证码" value="" style="width: 60px;" onmouseout="validate();"/>  
	       			 	<input type = "button" id="code" onclick="createCode();"/>&nbsp;&nbsp;<span style="color: orangered; font-size: 15px;">请区分大小写!</span>
    				</td>
    			</tr>
				<tr>
					<td id="butdata">
						<button class="btn btn-primary" onclick="upuserdata();">提交</button>
					</td>
				</tr>
    		</table>
    	</center>
    	<br />
    	
    	
		
	</body>
</html>
