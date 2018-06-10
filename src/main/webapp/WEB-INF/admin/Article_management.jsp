<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/pagination.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.pagination.js" ></script>
		<title>文章管理</title>
	</head>
	<body style="background-image: url(../img/Sound_shape.jpg); background-repeat: no-repeat;">
		<div style="overflow:auto"">
		<table class="table datatable" id="Articles">
			<thead>
				<tr>
					<th>文章id</th>
					<th>文章标题</th>
					<th>发布时间</th>
					<th>喜欢人数</th>
					<th>发布者</th>
					<th>操作</th>
				</tr>
			</thead>
			
				
				
				
				<tbody id="content">
					<!-- <tr>
						<td>1</td>
						<td>测试</td>
						<td>2017-09-23</td>
						<td>1</td>
						<td>admin</td>
						<td>
							<a href="#" class="text-danger" type="button" onclick=""><i class="icon-trash"></i></a>
						</td>
					</tr> -->	
				</tbody>
			
		</table>
		</div>
		
	
		
	</body>
	<script type="text/javascript">
		
	
		//初始化表格
		$('table.datatable').datatable({

				storage:true,
				fixedHeader:true,
				ready:allArticle()
			});

		//加载数据
		function allArticle(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/admin/admingetallarticle.do",
				data:{},
				async:false,
				beforeSend:function(){
					//初始化
					document.getElementById("content").innerHTML='';
					//显示加载动画
					document.getElementById("content").innerHTML='<tr><td></td><td></td><td></td><td></td><td></td><td><div style="margin-left: 50%; margin-top: 20px;">'+
						'<centent>'+
						'<i class="icon icon-spin icon-spinner-indicator icon-2x"></i><span style="color: #93A1A1;">加载中...</span>'
						+'</centent>'
						+'</td></tr></div>';
				},
				success:function(data){
					//console.log(data);
					//初始化
					document.getElementById("content").innerHTML='';
					for(var i=0;i<data.length;i++){
						document.getElementById("content").innerHTML+='<tr>'+
						'<td>'+data[i].aid+'</td>'+
						'<td>'+data[i].article_title+'</td>'+
						'<td>'+data[i].issuing_time+'</td>'+
						'<td>'+data[i].love+'</td>'+
						'<td>'+data[i].posted_by+'</td>'+
						'<td>'+
						'<a href="#" class="text-danger" type="button" onclick="del(this)"><i class="icon-trash"></i></a>'+
						'</td>'
						+'</tr>';
					}
				},
				error:function(){
					new $.zui.Messager('拉取文章列表失败！请检查网络！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
				},
				complete:function(){
					
				}
				
			});
		}
		
		
		function del(obj){
			var tr=obj.parentNode.parentNode;//获取当前节点的父节点（tr）
			var index=tr.rowIndex;//获取当前行号
			var code=tr.cells[0].innerText;//获取文章id
			if(confirm("您确定要删除么？")){
				 $.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/admin/admindelarticle.do',
					data:{"id":code},
					success:function(data){
						if(data==1){
							alert("删除成功!");
							//allArticle();
							
							window.location.reload();
							
						}
					},
					error:function(){
						alert("删除失败!");
					}
				}) 
			}
		}
		
	</script>
</html>
    