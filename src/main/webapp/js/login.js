$(function(){

    /*
登录
* */
    $("#loginBtn").click(function(){
        alert("1");
        $.ajax({

            url:"user/login.do",
            type:"post",
            dataType:"json",
            data:{
                "username":$.trim($("#username").val()),
                "password":$.trim($("#password").val())
            },
            success:function(data){

                if(data.success){
                    /*证明登录成功跳转页面*/
                    window.location.href = "html/indexs.jsp"
                }else{
                    $("#loginCheck").html(data.msg);
                }
            }
        })
    })

})
