<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title>
		
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href = "css/bootstrap.min.css">
		
		<!-- css -->
		<link rel="stylesheet" type="text/css" href = "css/ProductShop.css">
		
	</head>
	<body>
		<script type="text/javascript" src="js/starback.js" opacity="0.5" zindex="-1" count="200"></script>
		<head>
			千牛后台商品模块
			<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group">
				    
			
			    	<input type="text" id = "SearchInput" class="form-control" name = "name" placeholder="Search for...">
			    	<span class="input-group-btn">
				        <button class="btn btn-default" id = "pageButton"type="submit">Go!</button>
				    </span>
				    
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		</head>
		
		<!-- 数据表格 -->
		<table border="1" style="text-align: center; margin-left: 35%; width:600px; height:200px; margin-top: 60px;">
			<thead>
				<tr>
					<td>
						名字
					</td>
					
					<td>
						价格
					</td>
				</tr>
			</thead>
			
			<tbody id = "tBody">
				
			</tbody>
		</table>
		
				
		<!-- 分页查询 -->
		<nav aria-label="Page navigation" style="margin-top: 100px;">
		  <ul class="pagination" id = "pagination">
		    <!-- <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li> -->
		   <!--  <li><a class="pagination_a">1</a></li>
		    <li><a class="pagination_a">2</a></li>
		    <li><a class="pagination_a">3</a></li>
		    <li><a class="pagination_a">4</a></li>
		    <li><a class="pagination_a">onclick="work(this)"5</a></li> -->
		    <!-- <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li> -->
		  </ul>
		</nav>
		<script type="text/javascript" src = "js/ProductShop.js"></script>
	</body>
</html>
