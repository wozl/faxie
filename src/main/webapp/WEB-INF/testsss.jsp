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
		go();
	}
	
	function go(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/faxie/getallDy.do',
			data:{},
			success:function(data){
				if(data!=null){
					for(var i=0; i<data.length;i++){
						document.getElementById("content").innerHTML+='<div><p>发表于&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].submitTime+'</p><br/><strong>'+data[i].content+'</strong></div><br/>';
					}
				}
			},
			error:function(){
				alert("操作失败!");	
			}
		});
	}

</script>
<title>查看我的动态</title>
</head>
<body>
	<div id="content">
	
	</div>



</body>
</html>