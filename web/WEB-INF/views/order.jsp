<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/3
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/flat-ui.min.js"></script>
    <title>订单信息</title>
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
        .list-group-item:hover{
            background: #27ae60;

        }
        .list-group-item div:first-child:hover{

            cursor: pointer;
        }
    </style>
    <script>
        function myClick(n){
            // location.href = "OrderInfo.html";
        }
        function btnClick(){
            alert("btn");
            return false;
        }
        $(function(){

        })
    </script>
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
            <h1 class="text-center" style="margin-bottom: 30px">我的订单</h1>
        </div>
        <div class="col-sm-12 thumbnail">
            <div class="col-sm-3 line-center">订单编号</div>
            <div class="col-sm-2 line-center">订单时间</div>
            <div class="col-sm-2 line-center">商品数量 </div>
            <div class="col-sm-2 line-center">订单总价</div>
            <div class="col-sm-3 line-center">操作</div>
        </div>
        <div class="list-group">
            <c:forEach var="orderInfo" items="${userOrder}">
                <div class="col-sm-12  list-group-item" >
                    <div class="col-sm-3 line-center" onclick="myClick(1)">${orderInfo.orderId}</div>
                    <div class="col-sm-2 line-center">${orderInfo.orderTime}</div>
                    <div class="col-sm-2 line-center">${orderInfo.totalQuantity} </div>
                    <div class="col-sm-2 line-center">${orderInfo.totalPrice}</div>
                    <div class="col-sm-3 line-center">
                        <form action="/deleteOrder/${orderInfo.orderId}" method="post">
                            <button type="submit" class="btn btn-danger">删除订单</button>
                        </form>


                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
    <!--footer-->
    <div class="navbar navbar-default navbar-static-bottom">
        版权声明区
    </div>
</body>
</html>
