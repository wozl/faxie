<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../zui/css/zui.min.css" />
		<script type="text/javascript" src="../zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="../zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			
			
		</script>
		<title>查看发泄友友动态</title>
	</head>
	<body>
		<div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
		        <i class="icon icon-reply"></i> <strong>回复</strong> 张三
		      </div>
		      <div class="modal-body">
		        <textarea name="" id="" cols="61" rows="5" class="textarea" placeholder="请和谐评论"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary">发布</button>
		      </div>
		    </div>
		  </div>
		</div>

		<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">启动对话框</button><br />
		<button class="btn" type="button"><i class="icon icon-star"></i>刷新动态</button>
		<style>
			.comments .item > .content > .imgs {margin-top: 0}
			.comments .item > .content > .imgs img {margin: 0}
			.comments > .list {box-shadow: inset .1rem 0 0 rgba(0,0,0,.1)}
			#fabNav {display: none!important} /* 隐藏主界面浮动按钮 */
		</style>
		
		<div class="heading">
    		<div class="title"><i class="icon icon-comments-alt muted"></i> <strong>泄友友们的动态</strong> <small class="muted"></small></div>
  		</div>
		<div class="list comment">
			<div class="item with-avatar multi-lines">
				<a href="##" class="avatar circle"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>Catouse</strong></a>
				<div class="content">
					<div>
						<a class="text-link strong">Catouse：</a>
						<div class="muted small pull-right">刚刚</div>
						
					</div>
					<div class="btn-reply state">当人们还在争论何去何从的时候，太阳在 46 亿年前诞生之时就已经帮地球做出了决定。<button class="btn-primary">评论</button></div>
					
				</div>
			</div>
			<br />
			<div class="item with-avatar multi-lines">
				<a href="##"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>赵大宝</strong></a>
				<div class="content">
					<div>
						<a class="text-link strong">赵大宝：</a>
						<div class="muted small pull-right">33分钟前</div>
					</div>
					<div class="btn-reply state">看看我叔叔从火星发来的照片~~<button class="btn-primary">评论</button></div>
					 	<div>
          					<a href="img/c.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="img/c.jpg" class="img-rounded" width="200" alt=""></a>
							<a href="img/d.jpeg" data-toggle="lightbox" data-group="image-group-1"><img src="img/d.jpeg" class="img-rounded" width="200" height="130" alt=""></a>
							<a href="img/b.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="img/b.jpg" class="img-rounded" width="200" alt=""></a>
        			</div>
				</div>
			</div>
			<br />
			<div class="list">
				<div class="item with-avatar multi-lines">
					<a href="##" class="avatar circle"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>Catouse</strong></a>
					<div class="content">
						<div>
							<a class="text-link strong">Catouse：</a><small class="muted">回复</small>
							<div class="muted small pull-right">2分钟前</div>
						</div>
							<div class="btn-reply state">火星不能复制。<button class="btn-primary">评论</button></div>
					</div>
				</div>
				<div class="item with-avatar multi-lines">
					<a href="##" class="avatar circle"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>Catouse</strong></a>
					<div class="content">
						<div>
							<a class="text-link strong">李开心：</a><small class="muted">回复</small>
							<div class="muted small pull-right">29分钟前</div>
						</div>
						<div class="btn-reply state">真开心:)<button class="btn-primary">评论</button></div>
					</div>
				</div>
			</div>
			<br />
			<div class="item with-avatar multi-lines">
				<a href="##" class="avatar circle"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>Catouse</strong></a>
				<div class="content">
					<div>
						<a class="text-link strong">Catouse：</a>
						<div class="muted small pull-right">1小时前</div>
					</div>
					<div class="btn-reply state">听说地球 1102 号传送门又发生爆炸了？！<button class="btn-primary">评论</button></div>
				</div>
			</div>
			<br />
			<div class="item with-avatar multi-lines">
				<a href="##" class="avatar circle"><img class="img-circle" src="img/d.jpeg" width="45" height="45"/><strong>孙悟空</strong></a>
				<div class="content">
					<div>
						<a class="text-link strong">孙悟空：</a>
						<div class="muted small pull-right">1小时前</div>
					</div>
					<div class="btn-reply state">大家还是现实一点吧，专心写代码才是正事。<button class="btn-primary">评论</button></div>
				</div>
			</div>
		</div>
		
		
		
		
	</body>
</html>
