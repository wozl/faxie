<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/mzui/css/mzui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/mzui/js/mzui.min.js" ></script>
<script type="text/javascript">
	function go(){
		var content=document.getElementById("content").value;
		var time=nowTime();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/faxie/getPublished.do',
			data:{"Did":null,"Content":content,"SubmitTime":time,"UsersId":null,"UserdyId":null},
			success:function(data){
				if(data==1){
					alert("发表成功");
				}
			},
			error:function(){
				
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
<title>动态测试</title>
</head>
<body>
		 <div>
		<div>
			<div class="title">
				<strong>发表你的动态吧</strong>
			</div>
		</div>
		<form action="" class="content has-padding">
		  <div class="control">
		    <textarea name="content" id="content" cols="30" rows="5" class="textarea" placeholder="请和谐评论"></textarea>
		  </div>
		</form>
		<div class="footer has-padding">
  			<button type="submit" class="btn primary" data-dismiss="display" onclick="go();">发布</button>
		</div>
		</div>


</body>
</html>