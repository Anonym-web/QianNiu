<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset=utf-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!--
    	作者：805705089@qq.com
    	时间：2019-07-17
    	描述：星空css
    -->
    <link rel="stylesheet" href="css/star.css">
   
    <!--
    	作者：805705089@qq.com
    	时间：2019-07-17
    	描述：页面css，js
    -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css" />
    <script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		
		$(function(){
			
			$("#regiestbtn").click(function(){
				
				window.location.href = "html/regiests.jsp";
				
			})	
		})
	
	</script>
</head>

<body class="hold-transition login-page">

	<!--
    	作者：805705089@qq.com
    	时间：2019-07-07
    	描述：背景图
    -->
	<div class="all">
	<div class="star"></div>
	
	
	  <div class="login-box">
        <div class="login-logo">
            千牛网登录
        </div>

		<!--
        	作者：805705089@qq.com
        	时间：2019-07-07
        	描述：登录面板
       -->
	        
	        <form action="user/login.do" method="post">
	        	<!--
	        	作者：805705089@qq.com
	        	时间：2019-07-07
	        	描述：用户名框
	       		 -->
	        	<div class="form-group has-feedback" data-loginbox-elem="emailTr">
	            <input type="text" id = "LoginUsername" name = "username" class="form-control" placeholder="用户名/手机号" data-loginbox-elem="emailInput">
	            <span class="glyphicon glyphicon-user form-control-feedback"></span>
	        	</div>
	        	
	        	<!-- 手机框 -->
	        	<input type="hidden" name = "LoginPhone">
	        	
	        	<!--
	        		作者：805705089@qq.com
	        		时间：2019-07-07
	        		描述：密码框
	        	-->
	       		 <div class="form-group has-feedback" data-loginbox-elem="passwdTr">
	        	    <input type="password" id = "LoginPassword" name = "password" class="form-control" placeholder="密码" data-loginbox-elem="passwdInput">
	         	   <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	     	   	</div>
	        	
	        	<input type = "checkbox" name = "flag"/><h3 style = "color:white">十天免登录</h3>
	       		 
	        	<div class="row" style="padding-top: 15px;">
	        		
	        		<!--
	        		作者：805705089@qq.com
	        		时间：2019-07-07
	        		描述：登录按钮
	       		 	-->
	          	  	<div class="col-xs-12" style="height:40px; width: 100px;">
	           	     	<button type="submit" class="btn btn-primary btn-block btn-flat" style="height:40px; width: 100px;" data-loginbox-elem="loginBtn">登录</button>
	           	 	</div>
	           	 	
	        	</div>
	        </form>
	        
	        <!--
           	作者：805705089@qq.com
            时间：2019-07-17
            描述：注册按钮
             -->
     	 	<div class="col-xs-12" style="height:40px; width: 100px; margin-left: 80px;">
     	     	<button type="submit" id = "regiestbtn" name = "regiestbtn" class="btn btn-primary btn-block btn-flat" style="height:40px; width: 100px;" data-loginbox-elem="loginBtn">注册</button>
     	 	</div>
     	 	
     	 	<!--
                 	作者：805705089@qq.com
                 	时间：2019-07-17
                 	描述：忘记密码
                 -->
     	 	<a id = "forword_pass" href="forword_pass.html">忘记密码?</a>
     	 	<a href = "QQlogin">QQ登录测试</a>
               
    </div>
    
	</div>
	
	<!--
		作者：805705089@qq.com
		时间：2019-07-18
		描述：星空js
	-->
	<script src="js/star.js"></script>
</body>
</html>