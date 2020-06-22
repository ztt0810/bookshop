<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/2
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bookInfo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/flat-ui.min.js"></script>
    <style>
        .row{
            margin-left: 20px;
            margin-right: 20px;;
        }
        .center{
            text-align: center;
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
                <li><a href="/login">登录</a></li>
                <li><a href="/register">注册</a></li>
                <li>
                    <a href="cart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<!--content-->
<div class="row thumbnail">
    <div class="col-sm-4">
<%--        <img style="width: 100%; height: 500px; display: block;" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510071051013&di=fe871132a698a7e62aa1036240aa221b&imgtype=jpg&src=http%3A%2F%2Fimg.evolife.cn%2F2015-01%2Fbde62420fc3165f8_thumb.jpg"   data-holder-rendered="true" alt="error">--%>
        <img style="width: 100%; height: 500px; display: block;" src="${bookDetail.pictureUrl}" data-holder-rendered="true" alt="error">
        <div class="caption center">
            <h3>书名: ${bookDetail.bookName}</h3>
            <p>
                <a class="btn btn-primary btn-block" role="button" href="#">立即购买</a>
                <a class="btn btn-default btn-block" role="button" href="/addToCart/${bookDetail.bookId}">加入购物车</a>
            </p>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="caption">
            <h3>图书介绍</h3>
            <p>${bookDetail.description}</p>

        </div>

    </div>

</div>

<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>
</body>
</html>
