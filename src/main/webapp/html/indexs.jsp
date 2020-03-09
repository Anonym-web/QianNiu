<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!doctype html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="assets/img/favicon.png">
	<!--
	作者：805705089@qq.com
	时间：2019-07-17
	描述：页面css,js
	-->
	<link  rel="stylesheet" href="css/index.css"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Get Shit Done Kit Tutorial by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    
	<link href="css/gsdk.css" rel="stylesheet" />
    <link href="css/demo.css" rel="stylesheet" />
	
    <link href="css/font-awesome.css" rel="stylesheet">
	<!-- bootstrap css -->
	<link rel="stylesheet" type="text/css" href = "css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>

	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/gsdk-checkbox.js"></script>
	<script src="js/gsdk-radio.js"></script>
	<script src="js/gsdk-bootstrapswitch.js"></script>
	<script src="js/get-shit-done.js"></script>
  	<script type="text/javascript" src = "js/index_ajax.js" defer="defer"></script>
</head>
<body>

	<div id="navbar-full">
	    <div class="container">
	        <nav class="navbar navbar-ct-blue navbar-transparent navbar-fixed-top" role="navigation">
	          
	          <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <a href="#">
	                     <div class="logo-container">
	                        <div class="logo">
	                            <img id = "imgShow" style="width:50px;height:50px;">
	                        </div>
	                        <div class="brand">
	                            Creative <span id = "usernameSpan">${user.username}</span>
								<input type="hidden" value="${user.id}">
								<a href="login.html" id = "loginorregiester">登录/注册</a>
	                        </div>
	                    </div>
	                </a>
	            </div>
	        
	            <!-- Collect the nav links, forms, and other content for toggling -->
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	              <ul class="nav navbar-nav navbar-right">
	                    <li><a href="html/SearchInput.jsp">into shopping</a></li>
	                    
	                    <li><button id = "MyMessage" type="button" class="btn btn-round btn-default" data-whatever="@mdo" style = "margin-top: 15px" >Message</button></li>
		                    
	               </ul>
	              
	            </div><!-- /.navbar-collapse -->
	          </div><!-- /.container-fluid -->
	        </nav>
	    </div><!--  end container-->
	    
	    <div class='blurred-container'>
	        <div class="motto">
	            <div>Get</div>
	            <div class="border no-right-border">Sh</div><div class="border">it</div>
	            <div>Done</div>
	        </div>
	        <div class="img-src" style="background-image: url('assets/img/cover_4.jpg')"></div>
	        <div class='img-src blur' style="background-image: url('assets/img/cover_4_blur.jpg')"></div>
    	</div>
	    
	</div>
	
	<div class="main">
		<div class="container tim-container">
			 <span class = "glyphicon glyphicon-menu-down" id = "spanMenuDown" style="margin-left: 50%"></span>
			 <div id = "div_Controller">
    		</div>
    		
			<!-- 弹出的模态窗口 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      
			      <!-- 我的信息标题 -->
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">我的信息</h4>
			      </div>
			      
			      <div class="modal-body">
			      
			      	<!-- 我的信息模态窗口表单开始 -->
			        <form>
			        	<!-- 表单禁用状态 -->
			          	<fieldset disabled>
			          		<!-- 昵称禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">昵称</label>
						      <input type="text" id="nicheng" class="form-control" placeholder="Disabled input">
						    </div>
						    
						    <!-- 手机号禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">手机号</label>
						      <input type="text" id="phone" class="form-control" placeholder="Disabled input">
						    </div>
						    
						    <!-- 姓名禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">姓名</label>
						      <input type="text" id="name" class="form-control" placeholder="Disabled input">
						    </div>
						    
						    <!-- 生日禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">生日</label>
						      <input type="text" id="birthday" class="form-control" placeholder="Disabled input">
						    </div>
						    
						    <!-- email禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">email</label>
						      <input type="text" id="email" class="form-control" placeholder="Disabled input">
						    </div>
						    
						    <!-- 身份证号禁用状态 -->
						    <div class="form-group">
						      <label for="disabledTextInput">身份证号</label>
						      <input type="text" id="IDcard" class="form-control" placeholder="Disabled input">
						    </div>
						  </fieldset>
						  <!-- 表单禁用状态END -->
			        </form>
			        <!-- 我的信息模态窗口表单结束 -->
			        
			      </div>
			      
			      <!-- 模态窗口修改按钮 -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" id = "UpdateMessage">更改信息</button>
			      </div>
			      
			    </div>
			  </div>
			</div>
			
			<!-- 我的信息按钮以及模态窗口结束 -->
		</div>
	<!-- end container -->
	</div>
	
	<div class="footer">
	    <div class="overlayer">
	    <div class="container">
	        <div class="row support">
	            <div class="col-sm-3">
					
	            </div>
	            <div class="col-sm-3">
	
	            </div>
	            <div class="col-sm-4">
	
	            </div>
	            <div class="col-sm-2">
	
	            </div>
	        </div>
	        <div class="row">
	            <div class="credits">
	                &copy; 2016 Get Shit Done Kit, made with <i class="fa fa-heart heart" alt="love"></i> for a better web.
	            </div>
	        </div>
	    </div>
	    </div>
	</div>   
    
   	<div id="bottomTime">
    	<span></span>时&nbsp;&nbsp;<span></span>分&nbsp;&nbsp;<span></span>秒
    	
    	<div id = "closeBottomTime">×</div>
    </div>
    
    <!-- <div id = "rotate">
    	<div id = "rotateli"></div>
    </div>  -->
	<script type="text/javascript" src = "js/index.js"></script>
</body>

</html>