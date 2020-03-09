<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		
		<script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
		<title></title>
		<!-- bootstrap css -->
		<link rel="stylesheet" href = "css/bootstrap.min.css"/>
	
		<!-- bootstrap js -->
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/SarchInput.css"/>
		<script src="js/SearchInput.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.color.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	<body style="background-color: #ffa638;">
		<header>
		<div id = "headController">
			<!-- 输入框 -->
			<input type="text" id="SearchInput" placeholder="Search"/>
		</div>
			<a id="shoppingCarta" role="tab" href="#home" aria-controls="home" role="tab" data-toggle="tab"><img src="product_pimage/shoppingCart.jpg">我的购物车</a>
			<!-- Tab panes -->
			<div id = "shoppingTab">

			</div>
		</header>
		<nav>



		<%--整个商品列表的div--%>
		<div id = "ProductController">
			<ul>
				<%--<li class = "product_li"><div id = "rotate"><img id = "product_pimage" src="product_pimage/weixin.png"/><div id = "product_name">我是商品的名字</div><div id  ="product_price">我是商品的价格</div><div id = "product_shop">我是商品的店铺</div></div></li>--%>
				<%--<li class = "product_li">
					&lt;%&ndash;每个商品的div&ndash;%&gt;
					<div id = "rotate">
						&lt;%&ndash;商品的图片&ndash;%&gt;
						<img id = "product_pimage" src="product_pimage/weixin.png"/>
						&lt;%&ndash;商品的名字&ndash;%&gt;
						<div id = "product_name">我是商品的名字</div>
						&lt;%&ndash;商品的价格&ndash;%&gt;
						<div id  ="product_price">我是商品的价格</div>
						&lt;%&ndash;此商品的店铺名称&ndash;%&gt;
						<div id = "product_shop">我是商品的店铺</div>
					</div>
				</li>--%>
			</ul>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
				<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
				<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		</nav>

	</body>
</html>
