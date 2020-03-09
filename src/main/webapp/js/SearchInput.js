window.onload = function(){
	var SearchInput = document.getElementById("SearchInput");
	SearchInput.value = "";
	/*页面刚加载时候执行方法*/
	getProductList(SearchInput.value,1,2);
	var flag = true;
	SearchInput.oninput = function(){
		flag = true;

		setTimeout(function(){

			//输入的长度大于等于一之后开始查询
			if(flag){

				//获取文本框输入的模糊查询之后发送ajax
				getProductList(SearchInput.value,1,2);
				flag = false;
			}
		},2000)
	}

	$("#SearchInput").focus(function(){
		$("#SearchInput").animate({
			"opacity":"1.0",
			"color":"wheat"},300)
	})

	$("#SearchInput").blur(function(){
		$("#SearchInput").animate({
			"opacity":"0.5",
			"color":"wheat"},300)
	})

	$("#shoppingCarta").mouseover(function(){
		$("#shoppingTab").html("");
		$("#shoppingTab").css('display','block')
		/*发送ajax查询商品列表*/
		$.ajax({
			url:"product/getProductshopping.do",
			type:"post",
			data:{
				"name":null,
				"pageNo":1,
				"pageSize":10
			},
			dataType:"json",
			success:function(data){
				$.each(data,function(i,n){

					//对ProductController这个div进行追加li商品列表
					$("#shoppingTab").append('<li class = "product_li">' +
						'<img id = "product_pimage" src="/QianNiu/product_pimage/'+n.pimage+'" style="width: 50px; height: 50px"/>' +
						''+n.name+'*'+n.productNum+''+
						'&nbsp;&nbsp;$'+n.price+''+
						'</li>');
				})
			}
		})
	})
	$("#shoppingCarta").mouseout(function(){
		$("#shoppingTab").css('display','none')
	})
	$("#shoppingTab").mouseover(function(){
		$("#shoppingTab").css('display','block')
	})
	$("#shoppingTab").mouseout(function(){
		$("#shoppingTab").css('display','none')
	})
}
function getProductList(SearchInputValue,pageNo,pageSize){
    $("#ProductController ul").html("");
	$.ajax({

		url:"product/getProduct.do",
		type:"post",
		data:{
			"name":SearchInputValue,
			"pageNo":pageNo,
			"pageSize":pageSize
		},
		dataType:"json",
		success:function(data){
			/*
            * 获取商品的信息将信息添加到div中
            * */
			$.each(data.productList,function(i,n){

				//对ProductController这个div进行追加li商品列表
				$("#ProductController ul").append('<li class = "product_li">' +
					'<div id = "rotate">' +
					'<img id = "product_pimage" onclick="getProductById(\'+n.id+\')" src="/QianNiu/product_pimage/'+n.pimage+'"/>' +
					'<div id = "product_name">'+n.name+'</div>' +
					'<div id  ="product_price">'+n.price+'</div>' +
					'<div id = "product_shop">'+n.shopId+'</div>' +
					'<div id = "attention" style="cursor: pointer;"><img src="/QianNiu/product_pimage/12c41f6813078cdf3ce6cfa0f9865f4b.png"/></div>' +
					/*点击之后跳转到一个新的页面，及商品详情页面*/
					/*'<div id = "shoppingCart" style="cursor: pointer;" ><img src="/QianNiu/product_pimage/shoppingCart.jpg"/></div>'+*/
					'<div id = "shoppingCart" style="cursor: pointer" onclick="addShoppingCart(\''+n.id+'\')"><img src="/QianNiu/product_pimage/shoppingCart.jpg"></div>'+
					'</div>' +
					'</li>');
			})
		}
	})
}

function addShoppingCart(id){

	//获取到商品的id之后发送ajax添加到数据库或存到cookie
    $.ajax({

        url:"product/addshoppingCart.do",
        type:"post",
        data:{
            "id":id
        },
        dataType:"json",
        success:function(data){

            //成功之后返回添加成功购物车页面
            if(data.success){


            }
        }
    })
}

function getProductById(id){

}