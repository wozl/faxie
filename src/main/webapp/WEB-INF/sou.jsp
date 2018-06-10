<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/stylesheets/style.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js" ></script>
		<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			/*function go(){
				window.location.href="http://s.music.qq.com/fcgi-bin/music_search_new_platform?t=0&n=5&aggr=1&cr=1&loginUin=0&format=json&inCharset=GB2312&outCharset=utf-8&notice=0&platform=jqminiframe.json&needNewCode=0&p=1&catZhida=0&remoteplace=sizer.newclient.next_song&w="+document.getElementById("sou").value;
			}*/
			
			function message(){
				new $.zui.Messager('搜索成功！',{
					icon:'ok-sign',
					type:'success'
					
				}).show();
			}
			
			function error(){
				new $.zui.Messager('网络超时或无网络！',{
					icon:'exclamation-sign',
					type:'danger'
					
				}).show();
			}
			
			function message(){
				new $.zui.Messager('搜索成功！',{
					icon:'icon-ok-sign',
					type:'success'
					
				}).show();
			}
			
			var att=new Array(15);
			var music1=[];
			var music2=[];
			var music3=[];
			var music4=[];
			var music5=[];
			var music6=[];
			var music7=[];
			var music8=[];
			var music9=[];
			var music10=[];
			var music11=[];
			var music12=[];
			var music13=[];
			var music14=[];
			var music15=[];
			function go(){
				$('#music').empty();//清空上一次搜索条目
				//清空上一次播放列表
				$('#playlist').empty();
				$("#audio").remove();//清除上一次播放的音乐
				
				$.ajax({
					type:'GET',
					url:"http://s.music.qq.com/fcgi-bin/music_search_new_platform?t=0&n=15&aggr=1&cr=1&loginUin=0&format=jsonp&inCharset=GB2312&outCharset=utf-8&notice=0&platform=jqminiframe.json&needNewCode=0&p=1&catZhida=0&remoteplace=sizer.newclient.next_song&w="+document.getElementById("sou").value+"&callback=?",
					//async: false,
					
					dataType:"jsonp",
					jsonp:"callback",  
          			jsonpCallback:"callback",
					success:function(data){
						message();
						//alert("a");
						var cc=data['data']['song']['list'];
					
						for(var i=0;i<cc.length;i++){
							//alert(cc[i].f);
							att[i]=(cc[i].f).split("|");
							//document.getElementById("as").innerHTML+='<h4 id="'+(1+i)+'">'+att[i]+'</h4>';
						}
						
					 music1=(att[0].toString()).split(",");
					 music2=(att[1].toString()).split(",");
					 music3=(att[2].toString()).split(",");
					 music4=(att[3].toString()).split(",");
					 music5=(att[4].toString()).split(",");
					 music6=(att[5].toString()).split(",");
					 music7=(att[6].toString()).split(",");
					 music8=(att[7].toString()).split(",");
					 music9=(att[8].toString()).split(",");
					 music10=(att[9].toString()).split(",");
					 music11=(att[10].toString()).split(",");
					 music12=(att[11].toString()).split(",");
					 music13=(att[12].toString()).split(",");
					 music14=(att[13].toString()).split(",");
					 music15=(att[14].toString()).split(",");
					 //alert(music1[0]);
					document.getElementById("music").innerHTML='<p id="1"><span id="url1">'+music1[0]+'</span>&nbsp;'+'<span id="name1">'+music1[1]+'</span>&nbsp;<span id="singer1">'+music1[3]+'</span>&nbsp;<span id="img1">'+music1[4]+'</span></p>'+
					'<p id="2"><span id="url2">'+music2[0]+'</span>&nbsp;'+'<span id="name2">'+music2[1]+'</span>&nbsp;<span id="singer2">'+music2[3]+'</span>&nbsp;<span id="img2">'+music2[4]+'</span></p>'+
					'<p id="3"><span id="url3">'+music3[0]+'</span>&nbsp;'+'<span id="name3">'+music3[1]+'</span>&nbsp;<span id="singer3">'+music3[3]+'</span>&nbsp;<span id="img3">'+music3[4]+'</span></p>'+
					'<p id="4"><span id="url4">'+music4[0]+'</span>&nbsp;'+'<span id="name4">'+music4[1]+'</span>&nbsp;<span id="singer4">'+music4[3]+'</span>&nbsp;<span id="img4">'+music4[4]+'</span></p>'+
					'<p id="5"><span id="url5">'+music5[0]+'</span>&nbsp;'+'<span id="name5">'+music5[1]+'</span>&nbsp;<span id="singer5">'+music5[3]+'</span>&nbsp;<span id="img5">'+music5[4]+'</span></p>'+
					'<p id="6"><span id="url6">'+music6[0]+'</span>&nbsp;'+'<span id="name6">'+music6[1]+'</span>&nbsp;<span id="singer6">'+music6[3]+'</span>&nbsp;<span id="img6">'+music6[4]+'</span></p>'+
					'<p id="7"><span id="url7">'+music7[0]+'</span>&nbsp;'+'<span id="name7">'+music7[1]+'</span>&nbsp;<span id="singer7">'+music7[3]+'</span>&nbsp;<span id="img7">'+music7[4]+'</span></p>'+
					'<p id="8"><span id="url8">'+music8[0]+'</span>&nbsp;'+'<span id="name8">'+music8[1]+'</span>&nbsp;<span id="singer8">'+music8[3]+'</span>&nbsp;<span id="img8">'+music8[4]+'</span></p>'+
					'<p id="9"><span id="url9">'+music9[0]+'</span>&nbsp;'+'<span id="name9">'+music9[1]+'</span>&nbsp;<span id="singer9">'+music9[3]+'</span>&nbsp;<span id="img9">'+music9[4]+'</span></p>'+
					'<p id="10"><span id="url10">'+music10[0]+'</span>&nbsp;'+'<span id="name10">'+music10[1]+'</span>&nbsp;<span id="singer10">'+music10[3]+'</span>&nbsp;<span id="img10">'+music10[4]+'</span></p>'+
					'<p id="11"><span id="url11">'+music11[0]+'</span>&nbsp;'+'<span id="name11">'+music11[1]+'</span>&nbsp;<span id="singer11">'+music11[3]+'</span>&nbsp;<span id="img11">'+music11[4]+'</span></p>'+
					'<p id="12"><span id="url12">'+music12[0]+'</span>&nbsp;'+'<span id="name12">'+music12[1]+'</span>&nbsp;<span id="singer12">'+music12[3]+'</span>&nbsp;<span id="img12">'+music12[4]+'</span></p>'+
					'<p id="13"><span id="url13">'+music13[0]+'</span>&nbsp;'+'<span id="name13">'+music13[1]+'</span>&nbsp;<span id="singer13">'+music13[3]+'</span>&nbsp;<span id="img13">'+music13[4]+'</span></p>'+
					'<p id="14"><span id="url14">'+music14[0]+'</span>&nbsp;'+'<span id="name14">'+music14[1]+'</span>&nbsp;<span id="singer14">'+music14[3]+'</span>&nbsp;<span id="img14">'+music14[4]+'</span></p>'+
					'<p id="15"><span id="url15">'+music15[0]+'</span>&nbsp;'+'<span id="name15">'+music15[1]+'</span>&nbsp;<span id="singer15">'+music15[3]+'</span>&nbsp;<span id="img15">'+music15[4]+'</span></p>';
					
					$.getScript('<%=request.getContextPath() %>/js/jquery-ui-1.8.17.custom.min.js');
					$.getScript('<%=request.getContextPath() %>/js/script.js');
						
						//console.log(data['data']['song']['list'])
						
					},
					error:function(){
						error();
					}
				});
			}
			
			function a(att,len){
				var a_len=att.length;
				var rst=[];
				for(var j=0;j<a_len.length;j+=len){
					rst.push(att.slice(j,j+len));
					
				}
				return rst;
			}
			
			
			
		</script>
		<title></title>
	</head>
	<body style="background-image: url(<%=request.getContextPath() %>/img/e.jpg);">
		<center>
		
		<!--<form method="get" action="http://s.music.qq.com/fcgi-bin/music_search_new_platform?t=0&n=5&aggr=1&cr=1&loginUin=0&format=json&inCharset=GB2312&outCharset=utf-8&notice=0&platform=jqminiframe.json&needNewCode=0&p=1&catZhida=0&remoteplace=sizer.newclient.next_song&w=">
			<input type="text" id="sou"/>		
			<button type="button" onclick="go();">搜索</button>
		</form>
				-->	
			<!--<div>
				<input type="text" id="sou"/>		
			<button type="button" onclick="go();">搜索</button>
			</div>-->
			
			
			
			
		<br />
		<div id="as" style="display: none;">
			
			
		</div>
		<div id="music" style="display: none;">
			
			
		</div>
		
		
		<center>
	<div id="background"></div>
	<div class="input-group">
				<input type="text" class="form-control" placeholder="输入歌手或者歌曲名" id="sou"/>
				
				<span style="background-color: #03A2B6;"><input type="button" value="搜索" class="btn btn-primary" onclick="go();" /></span>
	</div>
	<div id="player" style="margin-top:230px;">
		<div class="cover"></div>
		<div class="ctrl">
			<div class="tag">
				<strong>Title</strong>
				<span class="artist">Artist</span>
				<span class="album">Album</span>
			</div>
			<div class="control">
				<div class="left">
					<div class="rewind icon"></div>
					<div class="playback icon"></div>
					<div class="fastforward icon"></div>
				</div>
				<div class="volume right">
					<div class="mute icon left"></div>
					<div class="slider left">
						<div class="pace" ></div>
					</div>
				</div>
			</div>
			<div class="progress">
				<div class="slider">
					<div class="loaded"></div>
					<div class="pace"></div>
				</div>
				<div class="timer left">0:00</div>
				<div class="right">
					<div class="repeat icon"></div>
					<div class="shuffle icon"></div>
				</div>
			</div>
		</div>
	</div>
	</center>
	<ul id="playlist"></ul>
	<footer style="margin-top:330px;margin-left:-170px">
		Copyright &copy; 2017 <a href="##">LQ</a>
	</footer>
		
		
		</center>
		
	</body>
</html>