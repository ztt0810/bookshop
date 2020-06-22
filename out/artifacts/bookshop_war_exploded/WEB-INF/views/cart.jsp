<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/3
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/flat-ui.min.js"></script>
    <title></title>
    <style>
        .row{
            margin-left: 20px;
            margin-right: 20px;;
        }
        .line-center{
            line-height:50px;
            text-align: center;
        }
        .row input{
            width: 50px;
        }
    </style>
</head>
<body>
<!-- Static navbar -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="homePage">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="homePage">首页</a></li>
                <li><a href="order">我的订单</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="login">登录</a></li>
                <li><a href="register">注册</a></li>
                <li>
                    <a href="cart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<!--content-->
<div class="container">
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">购物车</h1>
        </div>
        <div class=" list-group">

            <div class="col-sm-12 thumbnail">
                <div class="col-sm-4 line-center">图书</div>
                <div class="col-sm-1 line-center">单价</div>
                <div class="col-sm-4 line-center">数量 </div>
                <div class="col-sm-2 line-center">小计</div>
                <div class="col-sm-1 line-center">操作</div>
            </div>


            <c:forEach items="${userCart}" var="cart">
                <c:if test="${cart.quantity >= 1}">
                    <div class="col-sm-12  list-group-item">
                        <div class="col-sm-1 line-center" style="width: 50px;height: 50px;">
                            <img src="..${pageContext.request.contextPath}/static/img/book.png" style="height: 100%;" alt=""/>
                        </div>
                        <div class="col-sm-3 line-center" id="bookName" value="${cart.bookName}">书名:${cart.bookName}</div>
                        <div class="col-sm-1 line-center">${cart.price}</div>
                        <div class="col-sm-4 line-center">
                            <form action="/cart/minus/${cart.bookName}" method="post">
                                <button type="submit" class="btn btn-default" name = "aaa" >
                                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                </button>
                            </form>

                            <input type="text" class="small" value="${cart.quantity}" readonly="true"/>

                            <form action="/cart/add/${cart.bookName}" method="post">
                                <button type="submit" class="btn btn-default" >
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                </button>
                            </form>
                        </div>
                        <div class="col-sm-2 line-center">小计:${cart.price * cart.quantity}</div>
                        <div class="col-sm-1 line-center">
                            <form action="/cart/delete/${cart.bookName}" method="post">
                                <button class="btn btn-danger">删除</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>




            <div class="col-sm-12 thumbnail">
                <div class=" col-sm-offset-4 col-sm-2 text-right">总数：${totalPriceAndNum.get("totalNum")}</div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2 text-right">总价：</div>
                <div class="col-sm-2">${totalPriceAndNum.get("totalPrice")}</div>
            </div>
        </div>
        <div class="col-sm-offset-7 col-sm-5" style="padding: 30px;">
            <a href="/homePage">
                <div class="col-sm-6 btn btn-success btn-block">继续购物</div>
            </a>
            <a href="/orderDetail">
                <div class="col-sm-6  btn btn-success btn-block">提交订单</div>
            </a>
        </div>
    </div>
</div>


<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>

<script type="text/javascript">
    // function minusFunc() {
    //     var currentBookName = $("#bookName").attr("value");
    //     console.log(currentBookName);
    //     document.changeCart.action="cart/minusOneItem/"+currentBookName;
    //     document.changeCart.submit();
    // }

</script>
</body>
</html>
