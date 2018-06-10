<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>SKPlayer</title>
    <meta name="viewport" content="width=440,user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
    <style>
        body{
            font-family:Arial,Helvetica,sans-serif;
            color:#6A6B6F;
            text-align:center;
            padding-top:17px;
            width:470px;
            margin:0 auto;
        }
        h1{
            font-size:36px;
        }
        h2{
            font-size:24px;
        }
        p{
            font-size:18px;
        }
        #skPlayer{
            margin:27px auto 0;
        }
        .container{
            margin-top:200px;
        }
        .doc{
            text-align:left;
        }
        pre{
            padding-left:2em;
            font-size:16px;
            line-height:24px;
            color:#fff;
            background-color:#272822;
            border-radius:3px;
        }
        @media screen and (max-width:768px){
            body{
                width:100%;
            }
            .doc{
                display:none;
            }
        }
    </style>
</head>
<body>
   
    <div id="skPlayer"></div>
    <div class="container">
        <button onclick="player.play()" class="btn btn-primary"><i class="icon icon-play"></i>播放</button>
        <button onclick="player.pause()"class="btn btn-primary"><i class="icon icon-pause"></i>暂停</button>
        <button onclick="player.prev()" class="btn btn-primary"><i class="icon icon-step-backward"></i>上一曲</button>
        <button onclick="player.next()" class="btn btn-primary"><i class="icon icon-step-forward"></i>下一曲</button>
        <button onclick="player.toggleList()" class="btn btn-primary"><i class="icon icon-list"></i>收起列表/显示列表</button>
        <button onclick="player.toggleMute()" class="btn btn-primary"><i class="icon icon-volume-off"></i>静音/<i class="icon icon-volume-up"></i>音量</button>
        <button onclick="player.switchMode()" class="btn btn-primary"><i class="icon icon-repeat"></i>单曲循环</button>
    </div>
    
    <script src="<%=request.getContextPath() %>/dist/skPlayer.min.js"></script>
    <script>
        var player = new skPlayer({
            autoplay: true,
            music: {
                type: 'cloud',
                source: 478964054
            }
        });
    </script>
</body>
</html>