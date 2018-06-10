<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/mzui/css/mzui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/mzui/js/mzui.min.js" ></script>
		<script type="text/javascript">
			window.onload=function(){
				loadingAllDynamic();
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
					result=parseInt(monthc)+"个月前";
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
			
			
			
			//加载所有评论
			function loadingAllDynamic(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/faxie/getalldynamic.do',
					data:{},
					//成功返回前
					beforeSend:function(){
						document.getElementById("loading").style.display="block";
						//document.getElementById("content").style.display="none";
					},
					success:function(data){
						document.getElementById("loading").style.display="none";
						console.log(data);
						for(var i=0;i<data.length;i++){
							var a=data[i].submitTime.trim();
							//转换成时间戳
							//console.log(getDataDiff(new Date(a.replace(/-/gi,"/")).getTime()));
							document.getElementById("contentDynamic").innerHTML+='<div class="item comments"><div class="item with-avatar multi-lines">'+
							'<div class="content">'+
							 '<div><a class="text-link strong">'+data[i].userName+'</a><div class="muted small pull-right">'+getDataDiff(new Date(a.replace(/-/gi,"/")).getTime())+'</div></div>'+
							 '<div>'+data[i].content+'</div>'+'</div>'
							+'</div>'
							+'</div>';
						}
					},
					error:function(){
						alert("未知错误");
					},
					//执行完成后
					complete:function(){
						document.getElementById("loading").style.display="none";
						document.getElementById("content").style.display="block";
					}
				});
			};
			
			//发表时间
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
		 	};
		 	
		 	 function go(){
		 		var content=document.getElementById("contents").value;
				var time=nowTime();
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/faxie/getPublished.do',
					data:{"Did":null,"Content":content,"SubmitTime":time,"UsersId":null,"UserdyId":null},
					beforeSend:function(){
						document.getElementById("subbutton").innerHTML='<button type="button" class="btn disabled" disabled>提交中</button>';
					},
					success:function(data){
						if(data==1){
							alert("发表成功");
							//清空评论显示区
							document.getElementById("contentDynamic").innerHTML='';
							//清空发表区的值
							document.getElementById("contents").value="";
							loadingAllDynamic();
						}
					},
					error:function(){
						alert("发表失败");
					},
					complete:function(){
						document.getElementById("subbutton").innerHTML='<button type="submit" class="btn primary" data-dismiss="display" onclick="Published()">发布</button>';
					}
				});
		 	} 
		</script>
		<style>
			.comments .item > .content > .imgs {margin-top: 0}
			.comments .item > .content > .imgs img {margin: 0}
			.comments > .list {box-shadow: inset .1rem 0 0 rgba(0,0,0,.1)}
			#fabNav {display: none!important} /* 隐藏主界面浮动按钮 */
		</style>
		<title>用户动态</title>
	</head>
	<body>
		<!--
        	作者：LQ
        	时间：2017-09-13
        	描述：背景图区
        -->
		<div>
			<strong>互动区</strong>
			<center>
			<img src="<%=request.getContextPath() %>/img/tak.png" />
			</center>
		</div>
		
		
		<!--
        	作者：LQ
        	时间：2017-09-13
        	描述：评论框
        -->
        <div>
		<div>
			<div class="title">
				<strong>发表你的动态吧</strong>
			</div>
		</div>
		<form action="" class="content has-padding">
		  <div class="control">
		    <textarea name="contents" id="contents" cols="30" rows="5" class="textarea" placeholder="请和谐评论"></textarea>
		  </div>
		</form>
		<div class="footer has-padding"  id="subbutton">
  			<button type="button"class="btn primary" onclick="go();">发布</button>
		</div>
		</div>
		<h3><a href="<%=request.getContextPath() %>/faxie/userdys.do" >查看我的动态</a></h3>
		<!--
        	作者：LQ
        	时间：2017-09-13
        	描述：动态区
        -->
        <div id="loading" style="display:none;">
        	<centent>
        		<button type="button" class="btn disabled loading loading-light gray" disabled>加载中...</button>
        	</centent>
        </div>
        
        <div id="content" style="display:none;">
		<div class="section" data-display="modal" data-selector=".btn-reply" data-remote="" data-placement="bottom">
			<div class="hidden">
				<div class="title"><i class="icon icon-comments-alt muted"></i><strong>评论</strong><small class="muted"></small></div>
			</div>
			<div id="contentDynamic">
			
			</div>
			
			
			
		</div>
		</div>
		
	</body>
</html>
