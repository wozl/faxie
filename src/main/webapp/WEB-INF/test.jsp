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
	window.onload=function(){
		//$("#myModal").modal("show");
		go();
	}
	
	var minute=1000*60;
	var hour=minute*60;
	var day=hour*24;
	var halfamonth=day*15;
	var month=day*30;
	function getDataDiff(time){
		var result;
		var now=new Date().getTime();
		var diff=now - time;
		if(diff<0){
			alert("结束日期不能小于开始日期");
		}
		var monthc=diff/month;
		var weekc=diff/(7*day);
		var dayc=diff/day;
		var hourc=diff/hour;
		var minc=diff/minute;
		if(monthc>=1){
			result=parseInt(monthC)+"个月前";
		}else if(weekc>=1){
			result=parseInt(weekc)+"个星期前";
		}else if(dayc>=1){
			result=parseInt(dayc)+"天前";
		
		}else if(hourc>=1){
			result=parseInt(hourc)+"小时前";
		}else if(minc>=1){
			result=parseInt(minc)+"分钟前";
		}else{
			result="刚刚";
		}
		return result;
	}
	
	function go(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/faxie/getalldynamic.do",
			data:{},
			success:function(data){
				//console.log(data.content);
				for(var i=0;i<data.length;i++){
					console.log((data[i].submitTime).trim());
					var a=data[i].submitTime.trim();
					//转换成时间戳格式
					//console.log(new Date(a.replace(/-/gi,"/")).getTime());
					console.log(getDataDiff(new Date(a.replace(/-/gi,"/")).getTime()));
					//document.getElementById("test").innerHTML+='<strong>'+data[i].userName+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>'+getDataDiff(new Date(a.replace(/-/gi,"/")).getTime())+'</span><br/>'+'<p>'+data[i].content+'</p>';
					document.getElementById("test").innerHTML+='<div class="section" data-display="modal" data-selector=".btn-reply" data-remote="" data-placement="bottom">'+
					'<div class="item comments"><div class="item with-avatar multi-lines">'+'<div class="content">'+
					'<div><a class="text-link strong">'+data[i].userName+'</a><div class="muted small pull-right">'+getDataDiff(new Date(a.replace(/-/gi,"/")).getTime())+'</div><div class="btn-reply state">'+data[i].content+'</div></div>'
					+'</div>'+'</div></div>'
					+'</div>';
				
				}
			},
			error:function(){
				alert('error');
			}
		});
	}

</script>
<title>测试页</title>
</head>
<body>
	

	
	<div></div>
	<div id="test">
			
	</div>
	


</body>
</html>