<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../zui/css/zui.min.css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/CityId.js" ></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="../zui/lib/jquery/jquery.js" ></script>
<script type="text/javascript" src="../zui/js/zui.min.js" ></script> 
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
		$.getJSON("http://eezzo.com/API/CD",{url:encodeURI(url)},function(json){
			var cityid;
		 city=json.data.city;
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

	
	/*function test(){
		
		//天气接口
		var cityid="";
		var provincename=$("#province").innerText;
		//alert(provincename);
		var cityname=$("#cityname").innerText;
		//alert(cityname);
		cityid=weatherMap[provincename][cityname];
		if(cityid=="" || cityid==undefined){
		cityid=weatherMap.defaultCity;
		}
		/*url='http://weather.gtimg.cn/city/'+cityid+'.js';
		$("#iframe").attr("src",url);
		/*var message=iframe();
		alert(message.bi_name);*/
		//alert($(document.getElementById('iframe').contentWindow.document.body).find('.subscription').text());
		//alert($("#iframe").contents().find('body').html());*/
		/*var html='<script src="http://weather.gtimg.cn/city/'+cityid+'.js"><\/script>';
		$("#tests").html(html);
	}*/
	
	
	//动态显示时间
	var days=new Array("日","一","二","三","四","五","六");
 	function nowTime(){
 		var times=new Date();
 		var y,m,date,day,hs,ms,ss,theDateStr;
 		y=times.getFullYear();//四位年例如2017
 		m=times.getMonth();//月
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
<title>天气</title>
</head>
<body style="background-color:#A1A1A1">
	
	<div style="float: right; margin-right: 800px;">
		<span id="time"></span>
		<button id="button" type="button" onmouseover="showWeather()"  class="btn text-blue" data-toggle="popover" data-tip-class="popover-danger"  title="天气" style="background-color: white;" style="color: dodgerblue"></button>
	</div>
	<br /><br /><br /><br /><br />
	<center>
		<div id="message">
			<div id="indemo">
				<div id="demo1" style="color: blue; font-size: 15px;">
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;各位使用者你们好<br />
               		 
               		 	
               		 	小弟技术渣渣，目前是测试版，大家随意玩，如果发现bug请反馈给我
               		 <br />
               		 邮箱：<strong>460296813@qq.com</strong>谢谢大家支持
            </div>
            <div id="demo2"></div>
			</div>
			
		</div>
	</center>
	
	
</body>
</html>