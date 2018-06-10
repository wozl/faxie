<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zn-cn">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>欢迎各位发泄大佬</title>
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/CityId.js" ></script>
		<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
		var ip=returnCitySN["cip"];
		var city;
		var c;//数据源
		var ico;//今天天气图标
		var textt;//今天天气情况
		var ico1;//明天
		var textt1;//明天
		var ico2;//后天
		var textt2;//后天
		
		var url="http://ip.taobao.com/service/getIpInfo.php?ip="+ip;
	
		window.onload=function(){
			citys();
		}
		
		
		function citys(){
			
				
			
			  $.getJSON('http://eezzo.com/API/CD',{url:encodeURI(url)},function(json){
				 
				var cityid;
			 city=json.data.city;
			 //console.log(city);
			 //alert('aa');
			 var province=json.data.region;
			cityid=weatherMap[province][city];
			if(cityid=="" || cityid==undefined){
			cityid=weatherMap.defaultCity;
			
			}
			var html='<script src="http://weather.gtimg.cn/city/'+cityid+'.js"><\/script>';
			$("#tests").html(html);
			var script=['http://weather.gtimg.cn/city/'+cityid+'.js'];
			seriesLoadScripts(script,function(){
				var a=__weather_city;
				c=(a.wk['0']);
				//console.log(a.wk['0']);
				//alert(c[0].wd);
				var max=c[0].tmax;//当天最高气温
				var min=c[1].tmin;//当天的最低气温
				var nums=c[0].wt;//当天的天气状况
				//获取当天天气状况的ico图标，具体天气信息
				ico=weatherMap.weatherIcon[nums].day;//图标
				textt=weatherMap.weatherIcon[nums].txt;//具体天气情况
				document.getElementById("button").innerHTML=''+city+'&nbsp;&nbsp;&nbsp;'+'<img src="'+ico+'"/>&nbsp;&nbsp;&nbsp;'+min+'~'+max+'';
				
			});
			});  
			
			//动态创建script
			
			
		}
		
		
		function seriesLoadScripts(scripts,callback) {
			   if(typeof(scripts) != "object") var scripts = [scripts];
			   var HEAD = document.getElementsByTagName("head").item(0) || document.documentElement;
			   var s = new Array(), last = scripts.length - 1, recursiveLoad = function(i) {  //递归
			       s[i] = document.createElement("script");
			       s[i].setAttribute("type","text/javascript");
			       s[i].onload = s[i].onreadystatechange = function() { //Attach handlers for all browsers
			           if(!/*@cc_on!@*/0 || this.readyState == "loaded" || this.readyState == "complete") {
			               this.onload = this.onreadystatechange = null; this.parentNode.removeChild(this); 
			               if(i != last) recursiveLoad(i + 1); else if(typeof(callback) == "function") callback();
			           }
			       }
			       s[i].setAttribute("src",scripts[i]);
			       HEAD.appendChild(s[i]);
			   };
			   recursiveLoad(0);
	}

		function showWeather(){
			
			
			
			
			var max=c[0].tmax;//当天最高气温
			var min=c[1].tmin;//当天的最低气温
			var max1=c[2].tmax;//明天最高
			var min1=c[3].tmin;//明天最低
			var num1=c[2].wt;
			var ico1=weatherMap.weatherIcon[num1].day;//天气图标
			var textt1=weatherMap.weatherIcon[num1].txt;//具体天气情况
			var max2=c[4].tmax;//后天最高气温
			var min2=c[5].tmin;//后天最低气温
			var num2=c[4].wt;//
			var ico2=weatherMap.weatherIcon[num2].day;//天气图标
			var textt2=weatherMap.weatherIcon[num2].txt;//具体天气情况
			
			$(".text-blue").popover({
						placement: 'bottom',
						html:true,
						tipClass:'success',
						template:'<div id="aaa" class="popover div" style="width="200px" heigth="200px"><div class="arrow"></div><h3><span style="color: dodgerblue;">&nbsp;'+city+'</span>&nbsp;&nbsp;<span style="color: dodgerblue;">'+textt+'</span>&nbsp;<span style="color: dodgerblue;">'+min+'/'+max+'℃</span></h3><div><div style="float: left;"><p><img src="'+ico+'" width="40px" heigth="40px"/></p><span>今日</span><br/>'+max+'℃&nbsp<span style="color:#757575;">'+min+'℃</span></div><div style="border-left: 1px dashed #757575;float: left;"><p><img src="'+ico1+'" width="40px" heigth="40px"/></p>明日<br/>'+max1+'℃&nbsp;<span style="color:#757575;">'+min1+'℃</span></div><div style="border-left: 1px dashed #757575;float: left;"><p><img src="'+ico2+'" width="40px" heigth="40px"/></p>后日<br/>'+max2+'℃&nbsp;<span style="color:#757575;">'+min2+'℃</span></div></div></div>'
					});
					$(function(){$(".text-blue").popover('show');});
			
		}

		
		
		
		//动态显示时间
		var days=new Array("日","一","二","三","四","五","六");
	 	function nowTime(){
	 		var times=new Date();
	 		var y,m,date,day,hs,ms,ss,theDateStr;
	 		y=times.getFullYear();//四位年例如2017
	 		m=times.getMonth();+1//月
	 		date=times.getDate();//天
	 		day=times.getDay();//星期
	 		hs=times.getHours();//时
	 		ms=times.getMinutes();//分
	 		ss=times.getSeconds();//秒
	 		if(ms<10){
	 			ms="0"+ms;
	 		}
	 		if(ss<10){
	 			ss="0"+ss;
	 		}
	 		if(date<10){
	 			date="0"+date;
	 		}
	 		theDateStr="现在是："+"<strong>"+y+"</strong>"+"年"+"<strong>"+m+"</strong>"+"月"+"<strong>"+date+"</strong>"+"日"+"星期："+"<strong>"+days[day]+"</strong>"+"  "+"<strong>"+hs+"</strong>"+"："+"<strong>"+ms+"</strong>"+"："+"<strong>"+ss+"</strong>";
	 		document.getElementById("time").innerHTML=theDateStr;
	 	}
	 	
	 	window.setInterval(nowTime,1000);
		</script>
	</head>
	<body>
		<!-- <div id="html_1">
			<iframe align="center" width="1910" height="180" src="<%=request.getContextPath() %>/faxie/tianqi.do" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>


		</div> -->
			<!--<div style="display: none;">
				<h4>音乐播放</h4>
				<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=32139848&auto=1&height=66"></iframe>
			</div>-->
			<div style="">
		<span id="time"></span>
		<button id="button" type="button" onmouseover="showWeather()"  class="btn text-blue" data-toggle="popover" data-tip-class="popover-danger"  title="天气" style="background-color: white;" style="color: dodgerblue"></button>
	</div>
		<div>
			<center>
				<a class="btn btn-primary" href="<%=request.getContextPath() %>/faxie/Login.do"><i class="icon icon-circle-arrow-left"></i>去登陆</a>
				&nbsp;&nbsp;
				<a class="btn btn-primary" href="<%=request.getContextPath() %>/faxie/register.do"><i class="icon icon-circle-arrow-right"></i>去注册</a>
			</center>
			
		</div>	
		<div>
			<marquee><strong style="color: red;">欢迎各位大佬访问本站，小弟技术渣渣，想要体验更多功能请点击上方的注册，已有账号的可以点击登陆，更多好玩的期待你的发现</strong></marquee>
			
		</div>
		<div class="carousel slide" id="myNiceCarousel" data-ride="carousel">
			<!--
            	作者：LQ
            	时间：2017-08-03
            	描述：原点指示器
            -->
			<ol class="carousel-indicators">
				<li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myNiceCarousel" data-slide-to="1"></li>
				<li data-target="#myNiceCarousel" data-slide-to="1"></li>
				
			</ol>
			<!--
            	作者：LQ
            	时间：2017-08-03
            	描述：轮播项目
            -->
			<div class="carousel-inner">
				<div class="item active">
					<img alt="one" src="<%=request.getContextPath() %>/img/a.jpg" />
					<div class="carousel-caption">
						<h4>敬请期待</h4>
					</div>
				</div>
				
				<div class="item">
						<img alt="two" src="<%=request.getContextPath() %>/img/b.jpg"/>
						<div class="carousel-caption">
							<h4>敬请期待</h4>
						</div>
				</div>
				
				<div class="item">
					<img alt="three" src="<%=request.getContextPath() %>/img/c.jpg" />
					<div class="carousel-caption">
						<h4>敬请期待</h4>
					</div>
				</div>
				
				
			</div>
			<!--
            	作者：LQ
            	时间：2017-08-03
            	描述：项目切换按钮
            -->
			<a class="left carousel-control" >
    			<span class="icon icon-chevron-left" href="#myNiceCarousel" data-slide="prev"></span>
  			</a>
  			<a class="right carousel-control" >
   				 <span class="icon icon-chevron-right"  href="#myNiceCarousel" data-slide="next"></span>
  			</a>
		</div>
		
		<hr />
		<h3>文章</h3>
		<div class="cards cards-borderless">
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="<%=request.getContextPath() %>/img/b.jpg" />
					
					<div class="card-heading"><strong>文章</strong></div>
					<div class="card-content text-muted">敬请期待</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="<%=request.getContextPath() %>/img/b.jpg" />
					
					<div class="card-heading"><strong>文章</strong></div>
					<div class="card-content text-muted">敬请期待</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="<%=request.getContextPath() %>/img/b.jpg" />
					
					<div class="card-heading"><strong>文章</strong></div>
					<div class="card-content text-muted">敬请期待</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="<%=request.getContextPath() %>/img/b.jpg" />
					
					<div class="card-heading"><strong>文章</strong></div>
					<div class="card-content text-muted">敬请期待</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			
		</div>
		<hr />
		<h3>音乐</h3>
		<div>
			<%-- <iframe src="<%=request.getContextPath() %>/faxie/music.do" width="500" height="430" frameborder="0">
				
			</iframe> --%>
			
		</div>
		<hr />
	</body>
	<script type="text/javascript">
	
	
	</script>
</html>
