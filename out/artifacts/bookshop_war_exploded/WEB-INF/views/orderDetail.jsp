<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/17
  Time: 12:18
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
    <title>订单详情</title>
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
        th{
            text-align: right;
            width: 200px;;
        }
        td{
            text-align: left;
            padding: 10px;
        }
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
        }
    </style>
    <script>
        function myClick(n){
            location.href = "OrderInfo.html";
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
            <a class="navbar-brand" href="/homePage">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/homePage">首页</a></li>
                <li><a href="/order">我的订单</a></li>
                <li><a href="UserInfo.html">个人中心</a></li>
                <li><a href="FriendLink.html">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="/login">登录</a></li>
                <li><a href="/register">注册</a></li>
                <li>
                    <a href="/cart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">订单详情</h1>
        </div>

        <div class="col-sm-12 ">
            <table>
                <tr>
                    <th>收货人姓名：</th><td>${userInfo.userName}</td>
                </tr>
                <tr>
                    <th>收货人地址：</th><td>${userInfo.address}</td>
                </tr>
                <tr>
                    <th>收货人电话：</th><td>${userInfo.phone}</td>
                </tr>
            </table>
        </div>
        <div class="col-sm-12">
            <table class="table table-striped table-condensed">
                <tr>
                    <th>书名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>

                <c:forEach var="orderdetail" items="${orderDetail}">
                    <tr>
                        <td>书名:${orderdetail.bookName}</td>
                        <td>单价:${orderdetail.price}</td>
                        <td>数量:${orderdetail.quantity}</td>
                        <td>小计:${orderdetail.price * orderdetail.quantity}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="col-sm-12 ">
            <table>
                <tr>
                    <th> </th><th></th> <th>商品总数：</th><td>${totalPriceAndNum.get("totalNum")}</td> <th>订单总价：</th><td><span class="text-danger">${totalPriceAndNum.get("totalPrice")}元</span></td>
                </tr>
            </table>
        </div>
    </div>
    <div></div>
    <div class="col-sm-offset-7 col-sm-5" style="padding: 30px;">
        <a href="/homePage">
            <div class="col-sm-6 btn btn-success btn-block">继续购物</div>
        </a>
        <a href="/pay">
            <div class="col-sm-6  btn btn-success btn-block">结算</div>
        </a>

    </div>
</div>

<!--footer-->
<div class="navbar navbar-default navbar-static-bottom ">
    版权声明区
</div>
</body>
</html>
