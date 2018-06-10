<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/lib/kindeditor/kindeditor.css" />
		
		<title>编辑日记</title>
	</head>
	<body style="background-image: url(<%=request.getContextPath() %>/img/a.jpg); background-repeat: no-repeat;">
		<center>
		<h2 style="color:white">标题</h2>
		<div class="input-group" style="margin-left: 40%;">
			<span class="input-group-addon"><i class="icon icon-tag"></i></span>
			<input type="text" class="form-control" placeholder="标题名称" style="width: 220px;" id="title"/>
		</div>
		
		<br />
		<br />
<textarea id="content" name="content" class="form-control kindeditor" style="height:80%; width: 70%;"></textarea>		
		</center>
		<br />
		<br />
		<button class="btn btn-primary" style="margin-left: 300px;" onclick="go();">提交</button>
	</body>
	<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/kindeditor/kindeditor.min.js" ></script>
		<script type="text/javascript">
			window.onload=function(){
				a();
			}
			
			function a(){
					KindEditor.create('textarea.kindeditor', {
				    basePath: '../zui/lib/kindeditor/',
				    bodyClass : 'article-content',
				    resizeType : 1,
				    allowPreviewEmoticons : false,
				    allowImageUpload : false,
				    items : [
				        'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				        'insertunorderedlist', '|', 'emoticons'
				    ],
				    afterBlur:function(){this.sync();}//同步kindeditor的值到文本域
				});
			}
					
			function go(){
				var id=null;
				var title=document.getElementById("title").value;
				var content=$("#content").val();
				alert(content);
				var time=nowTime();
				alert(time);
				$.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/faxie/writedata.do',
					data:{"id":id,"Title":title,"Content":content,"WriteTime":time,"UserDiary":null},
					success:function(data){
						if(data==1){
							new $.zui.Messager('发表成功！',{
								icon:'ok-sign',
								type:'success'
							}).show();
							setTimeout(function(){
								window.location.assign("${pageContext.request.contextPath}/faxie/gowrite_diary_list.do");
							},3000);
						}else if(data==0){
							new $.zui.Messager('发表失败！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
						}
					},
					error:function(){
						new $.zui.Messager('未知错误，请检查网络或者联系管理员！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
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
		 		theDateStr=y+"-"+m+"-"+date+" "+hs+":"+ms+":"+ss;
		 		return theDateStr;
		 	}
			
		</script>
</html>
