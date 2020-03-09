$(function(){

	//获取用户的用户名
	var username = $("#usernameSpan").html();
	$.ajax({
		url:"user/showUserPortrait.user",
        data:{
			"username":username
        },
		dataType:"json",
		type:"post",
		success:function(data){
			if(data == null){
				$("#imgShow").attr('src','/QianNiu/img/new_logo.png');
				$("#loginorregiester").css('display','block');
			}
			$("#imgShow").attr('src','/QianNiu/upload'+'/'+data.phone+'/'+data.pimage);
		}
	})

	$("#MyMessage").click(function(){

		$.ajax({
			url:"user/showUserMessage.user",
			data:{
				"username":username
			},
			dataType:"json",
			type:"get",
			success:function(data){

				//显示用户信息
				$("#nicheng").val(data.username);
				$("#phone").val(data.phone);
				$("#name").val(data.name);
				$("#birthday").val(data.birthday);
				$("#email").val(data.email);
				$("#IDcard").val(data.IDcard);

				//开启模态窗口
				$("#exampleModal").modal("show");

			}
		})
	})
})
