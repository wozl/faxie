<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			window.onload=function(){
				go();
			}
			
			function go(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/faxie/gettitle.do',
					
					beforeSend:function(){//请求发送前
						document.getElementById("Loading").style.display="block";
					},
					success:function(data){
						
						if(data!=null){
							for(var i=0;i<data.length;i++){
								console.log(data[i].writeTime);
									document.getElementById("items").innerHTML+='<div>'+'<span>'+(i+1)+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'<a onclick="gocontent(\''+data[i].writeTime+'\')">'+data[i].title+'</a>'+'<strong style="float: right;">'+data[i].writeTime+'</strong>'+'</div>';
							}
							
						}else{
							document.getElementById("items").innerHTML="<h3>暂无数据</h3>";
						}
						
					},
					error:function(){
						new $.zui.Messager('查询失败，请检查网络或者联系管理员！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
						document.getElementById("items").innerHTML="<h3>出错了 >_<</h3>";
					},
					complete:function(){//不管是请求成功还是失败都会执行
						document.getElementById("Loading").style.display="none";
					}
				});
			}
			
			function gocontent(times){
				//js拼接from表单
				var url='${pageContext.request.contextPath}/faxie/gocontent.do';
				var turnForm = document.createElement("form");  
				//一定要加入到body中！！   
				document.body.appendChild(turnForm);
				turnForm.method = 'post';
				 turnForm.action =url;
				 turnForm.target = '_self';
				 //创建隐藏表单
				 var newElement = document.createElement("input");
				 newElement.setAttribute("name","times");
				 newElement.setAttribute("type","text");
				 newElement.setAttribute("style","display: none;");
				 newElement.setAttribute("value",times);
				 turnForm.appendChild(newElement);
				 turnForm.submit();
			}
			
		</script>
		<title>日记列表页</title>
	</head>
	<body>
		<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;filter:alpha(opacity=30); -moz-opacity:0.3;-khtml-opacity: 0.3;opacity: 0.4;margin-top: -50px;">    
			<img src="<%=request.getContextPath() %>/img/h.jpg" height="100%" width="100%"/>
		</div>
	<div>
		<p>
		<img src="<%=request.getContextPath() %>/img/fg.jpg" width="130px" height="130px" class="img-circle"/>
		<span style="font-size: 25px;">Hi~ o(*￣▽￣*)ブ,<span style="color:#FFADAD;">欢迎回到你的日记小屋哦~</span></span>
		<br />
		<span style="font-size: 25px;color: dodgerblue; margin-left: 150px;">快来看看你留下的小爪印吧^_^</span>
		</p>
	</div>
	
	
	<br />
	<br />
		
		<h3>哈？想写新日记？<a href="<%=request.getContextPath() %>/faxie/gowrite_diary.do">点此</a>留下你的爪印吧>.<</h3>
	<br />
	<div class="list">
	  <!-- 列表头部 -->
	  <header>
	    <h1>列表标题</h1>
	  </header>
	  <!-- 列表项组 -->
	  <section class="items" id="items">
	   <!--  <div class="item">1
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;55456
	    	<strong style="float: right;">2017-01-01</strong>
	    </div> -->
	    <div id="Loading" style="display: none;">
	    	<i class="icon icon-spin icon-spinner-indicator icon-3x"></i><br />
	    	<strong style="font-size: 16px;color: #808080;">加载中...</strong>
	    </div>
	    
	  </section>
	  <!-- 列表底部 -->
	  <footer>
	    <ul class="pager pager-justify">
	      <li class="previous disabled"><a href="#"><i class="icon-arrow-left"></i> 上一页</a></li>
	      <li class="next disabled"><a href="#">没有下一页 <i class="icon-arrow-right"></i></a></li>
	    </ul>
	  </footer>
	</div>
	
</body>
</html>
