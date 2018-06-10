<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.js" ></script>
		<title>管理用户页</title>
	</head>
	<body>
		
		<!--
        	作者：LQ
        	时间：2017-09-23
        	描述：用户搜索区
        -->
		<div class="input-group">
			<span class="input-group-addon">
				<i class="icon-search"></i>
			</span>
  			<input type="text" id="user" class="form-control" style="width: 15%;">
  			
    		<button class="btn btn-primary" type="button" onclick="search()"><i class="icon-rocket"></i>&nbsp;搜索</button>
  			
		</div>
		
		
		<!--
        	作者：LQ
        	时间：2017-09-20
        	描述：数据显示区
        -->
		<div style=" width: 100%; height: 530px;overflow:auto">
		<table class="table datatable" id="datas">
			<thead>
				<tr>
					<th>用户id</th>
					<th>用户名</th>
					<th>密码</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="content">
				
			</tbody>
		</table>
		</div>
		
		
	</body>
	<script type="text/javascript">
		$('table.datatable').datatable({
				
				storage:true,
				fixedHeader:true,
				ready:getAllUser()
			});
			
			
			//查询所有注册用户
			function getAllUser(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/admin/admingetallusersinfo.do',
					data:{},
					async:false,
					beforeSend:function(){
						//初始化表格中的内容
						document.getElementById("content").innerHTML='';
						 document.getElementById("content").innerHTML='<tr><td><div style="margin-left: 50%; margin-top: 20px;">'+
						'<centent>'+
						'<i class="icon icon-spin icon-spinner-indicator icon-2x"></i><span style="color: #93A1A1;">加载中...</span>'
						+'</centent>'
						+'</td></tr></div>';  
					},
					success:function(data){
						if(data!=null){
							//初始化表格中的内容
							document.getElementById("content").innerHTML='';
							
							
							
							for (var i=0;i<data.length;i++) {
								document.getElementById("content").innerHTML+='<tr>'+
								'<td>'+data[i].id+'</td>'+
								'<td>'+data[i].userName+'</td>'+
								'<td>'+data[i].passWord+'</td>'+
								'<td><a href="##" onclick="updateUserPassWord(this)"><i class="icon-edit"></i>编辑</a>'+
								'<a class="text-danger" href="##" onclick="deleteUser(this)"><i class="icon-trash"></i>删除</a>'	
								+'</td>'
								+'</tr>';
							} 
						}else{
							document.getElementById("content").innerHTML='';
							 document.getElementById("content").innerHTML='<tr><td><div style="margin-left: 50%; margin-top: 20px;">'+
							'<centent>'+
							'<span style="color: #93A1A1;">暂无数据</span>'
							+'</centent>'
							+'</td></tr></div>';  
						}
					},
					error:function(){
						new $.zui.Messager('获取用户资料失败，请检查网络！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
							//初始化表格中的内容
						document.getElementById("content").innerHTML='';
						document.getElementById("content").innerHTML='<tr><td><div style="margin-left: 50%; margin-top: 20px;">'+
						'<centent>'+
						'<i class="icon  icon-frown icon-2x"></i><span style="color: #93A1A1;">加载出错</span>'
						+'</centent>'
						+'</td></tr></div>';
						
					},
					complete:function(){
						
					}
				});
			}
			
			//更新用户密码信息
			function updateUserPassWord(obj){
				var tr=obj.parentNode.parentNode;//得到父节点tr
				console.log(tr);
				var index=obj.rowIndex; //行下标
				var id=tr.cells[0].innerText;
				var UserName=tr.cells[1].innerText;
				var PassWord=tr.cells[2].innerText;
				/* var username=obj.cells[1].innerText;
				var password=obj.cells[2].innerText; */
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/admin/adminupdateuserpwd.do',
					data:{"id":id,"UserName":UserName,"PassWord":PassWord},
					success:function(data){
						new $.zui.Messager('密码更新成功！',{
							icon:'ok-sign',
							type:'success'
						}).show();
						getAllUser();
					},
					error:function(){
						new $.zui.Messager('更新失败！',{
							icon:'ok-sign',
							type:'success'
						}).show();
					}
				});
				
			}			
			//搜索指定用户
			function search(){
				var search_value= $("#user").val();//获取搜索的值
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/admin/adminfinduser.do',
					data:{"name":search_value},
					async:false,
					beforeSend:function(){
						document.getElementById("content").innerHTML='<tr><td><div style="margin-left: 50%; margin-top: 20px;">'+
						'<centent>'+
						'<i class="icon icon-spin icon-spinner-indicator icon-2x"></i><span style="color: #93A1A1;">搜索中...</span>'
						+'</centent>'
						+'</td></tr></div>';
					},
					success:function(data){
						//初始化表格中的内容
						document.getElementById("content").innerHTML='';
						document.getElementById("content").innerHTML='<tr>'+
						'<td>'+data.id+'</td>'+
						'<td>'+data.userName+'</td>'+
						'<td>'+data.passWord+'</td>'+
						'<td><a href="##" onclick="updateUserPassWord(this)"><i class="icon-edit"></i>编辑</a>'+
						'<a class="text-danger" href="##" onclick="deleteUser(this)"><i class="icon-trash"></i>删除</a>'	
						+'</td>'
						+'</tr>';
					},
					error:function(){
						new $.zui.Messager('搜索失败！请确认输入信息是否有误!',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
							document.getElementById("content").innerHTML='';
							document.getElementById("content").innerHTML='<tr><td><div style="margin-left: 50%; margin-top: 20px;">'+
						'<centent>'+
						'<i class="icon  icon-frown icon-2x"></i><span style="color: #93A1A1;">搜索出错了</span>'
						+'</centent>'
						+'</td></tr></div>';
					},
					complete:function(){
						
					}
				});
			}
			
			
			
			
			//删除用户
			function deleteUser(obj){
				var tr=obj.parentNode.parentNode;//得到父节点tr
				var index=obj.rowIndex; //行下标
				var id=tr.cells[0].innerText;
				//ajax访问后台
				$.ajax({
					type:"post",
					url:'${pageContext.request.contextPath}/admin/admindeleteuser.do',
					data:{"id":id},
					beforeSend:function(){
						
					},
					success:function(){
						new $.zui.Messager('删除成功！',{
							icon:'ok-sign',
							type:'success'
						}).show();
						getAllUser();
					},
					error:function(){
						
					},
					complete:function(){
						
					}
				});
			}
			
			
		
       	
	</script>
</html>
    