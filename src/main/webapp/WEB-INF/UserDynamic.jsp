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
		document.getElementById("contentDynamic").innerHTML="";
		contents();
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
	
	function contents(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/faxie/getallDy.do',
			data:{},
			beforeSend:function(){
				document.getElementById("loading").style.display="block";
			},
			success:function(data){
				if(data!=null){
					for(var i=0;i<data.length;i++){
						var a=data[i].submitTime.trim();
						document.getElementById("contentDynamic").innerHTML+='<div class="item comments"><div class="item with-avatar multi-lines">'+
						'<div class="content">'+
						 '<div><a class="text-link strong">'+'</a><div class="muted small pull-right">'+getDataDiff(new Date(a.replace(/-/gi,"/")).getTime())+'</div></div>'+
						 '<div>'+data[i].content+'</div>'+'</div>'
						+'</div>'
						+'</div><br/>';
					}
				}
			},
			error:function(){
				alert("获取失败");
			},
			complete:function(){
				document.getElementById("loading").style.display="none";
				document.getElementById("content").style.display="block";
			}
		});
	}
	
</script>
<title>查看我的动态</title>
</head>
<body>
		<div id="loading" style="display:none;">
        	<centent>
        		<button type="button" class="btn disabled loading loading-light gray" disabled>加载中...</button>
        	</centent>
        </div>

<p><i class="icon icon- reply"></i><a href="javascript:window.history.back();" style="color:red; font-size:17px;">点此返回</a></p>
		<div id="content" style="display:none;">
		<div class="section" data-display="modal" data-selector=".btn-reply" data-remote="" data-placement="bottom">
			<div class="hidden">
				<div class="title"><i class="icon icon-comments-alt muted"></i><strong>我的动态</strong><small class="muted"></small></div>
			</div>
			<h2>我的动态</h2>
			<div id="contentDynamic">
			
			</div>
			
			
			
		</div>
		</div>
	

</body>
</html>