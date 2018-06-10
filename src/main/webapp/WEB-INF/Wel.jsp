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
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<div id="html_1">
			<iframe align="center" width="1910" height="180" src="<%=request.getContextPath() %>/faxie/tianqi.do" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>


		</div>
			<!--<div style="display: none;">
				<h4>音乐播放</h4>
				<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=32139848&auto=1&height=66"></iframe>
			</div>-->
		
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
					<img src="img/b.jpg" />
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待！</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
					<div class="cards-acions">
						<button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
    					<div class="pull-right text-danger"><i class="icon-heart-empty"></i> 0 人喜欢</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-lg-3">
				<a class="cards" href="###">
					<img src="img/b.jpg" />
					
					<div class="card-heading"><strong>敬请期待</strong></div>
					<div class="card-content text-muted">开发中，敬请期待！</div>
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
			<iframe src="<%=request.getContextPath() %>/faxie/music.do" width="500" height="430" frameborder="0">
				
			</iframe>
			
		</div>
		<hr />
	</body>
</html>
