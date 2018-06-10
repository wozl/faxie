<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/lib/kindeditor/kindeditor.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/kindeditor/kindeditor.min.js" ></script>
		
		<title>文章编辑</title>
	</head>
	<body style="background-image: url(../img/youname.jpg); background-repeat: no-repeat;">
		<ul class="nav nav-secondary">
		  <li><a href="##"><i class="icon-edit"></i>编辑文章</a></li>
		  
		</ul>
		
		<div style="margin-left: 0%; margin-top: 14%;">
			<center>
			<span style="font-size: 20px; margin: 10px;">文章标题</span>	
			<div class="input-group" style="width: 15%;margin-bottom: 50px;">
				<span class="input-group-addon"><i class="icon icon-tag"></i></span>
				<input type="text" class="form-control" id="title" placeholder="标题">
			</div>
			<span style="font-size: 20px; margin: 10px;">文章内容</span>
			
			<textarea id="content" name="content" class="form-control kindeditor" style="height:380%; width: 70%;">Hello, world!</textarea>	
			
			<button class="btn btn-primary" style="margin: 5px;" onclick="go()">提交</button>
			</center>
		</div>
	</body>
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
			
			//发布时间
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
		 		theDateStr=y+"-"+m+"-"+date+" "+hs+"："+ms+"："+ss;
		 		return theDateStr;
		 	}
			function go(){
				var time=nowTime();
				var title=document.getElementById("title").value.trim();
				var content=document.getElementById("content").value;
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/admin/adminpost_article.do',
					data:{"Aid":null,"Article_title":1,"Article_content":1,"Issuing_time":1,"Love":0},
					success:function(data){
						if(data==1){
							alert("文章发布成功！");
							document.getElementById("title").value='';
							document.getElementById("content").value='';
						}
					},
					error:function(){
						alert("发表失败，请检查网络!");
					}
				});
			}
			
		</script>
	
</html>
    