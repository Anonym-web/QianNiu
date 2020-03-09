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
    $(".cd-cart").mouseenter(function(){

        /*页面发送ajax查询cookie里面存储的商品*/
        $.ajax({

            url:"product/getProductCookie.do",
            type:"get",
            dataType:"json",
            success:function(data){

                if(data.plist == null & data.value == null){

                    $("#shoppingTab").html("对不起，购物车里暂时还没有东西哦")
                }
                /*
                后台要往前端传一个List<>集合
                * */
                $.each(data.plist,function(i,n){

                    $("#shoppingTab").append('<li class = "product_li">' +
                        '<img id = "product_pimage" src="/QianNiu/product_pimage/'+n.pimage+'" style="width: 50px; height: 50px"/>' +
                        ''+n.name+'*'+n.productNum+''+
                        '&nbsp;&nbsp;$'+n.price+''+
                        '</li>');
                })
            }
        })
    })
}
function getProductList(SearchInputValue,pageNo,pageSize){

    $.ajax({

        url:"product/getProduct.do",
        type:"post",
        data:{
            "name":SearchInputValue,
            "pageNo":pageNo,
            "pageSize":pageSize
        },
        beforeSend:function(){

            alert("预加载");
        },
        dataType:"json",
        success:function(data){
            $(".row").html("");
            /*
            * 获取商品的信息将信息添加到div中
            * */
            $.each(data.productList,function(i,n){

                //对ProductController这个div进行追加li商品列表
                $(".row").append(
                    '<div class="col-md-3 col-sm-6">'+
                    '<div class="product-grid">'+
                    '<div class="product-image">'+
                    '<a href="#">'+
                    '<img class="pic-1" onclick="getProductById(\'+n.id+\')" src="/QianNiu/product_pimage/'+n.pimage+'">'+
                    '</a>'+
                    '</div>'+
                    '<div class="product-content">'+
                    '<h3 class="title"><a href="#">'+n.name+'</a></h3>'+
                    '<div class="price">$'+n.price+''+
                    '<span>$'+n.price+'</span>'+
                    '</div>'+
                    '</div>'+
                    '<ul class="social">'+
                    '<li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li>'+
                    '<li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>'+
                    '<li><a id = "" onclick="addShoppingCart(\''+n.id+'\')" data-tip="Add to Cart" style="cursor: pointer;"><i class="fa fa-shopping-cart"></i></a></li>'+
                    '</ul>'+
                    '</div>'+
                    '</div>'
                );
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