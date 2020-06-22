<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/1
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/flat-ui.min.js"></script>
    <style>
        .row{
            margin-top: 20px;;
        }
        .center{
            text-align: center;
        }
        .pagination{
            background: #cccccc;
        }
    </style>
    <script>
        $(function(){
            $('#myTabs a').click(function (e) {
                $(this).tab('show')
            });
        });


        $(".carousel").carousel({
            interval:100 //每隔两秒自动轮播
        });

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
            <a class="navbar-brand" href="#">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
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
    <div id="carousel-example-generic" class="carousel slide">
        <!-- 轮播图上的圆圈链接 -->
        <ol class="carousel-indicators radiou">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
        <!-- 轮播图具体内容 -->
        <div class="carousel-inner">

            <div class="item active">
                <img src="https://img9.doubanio.com/view/subject/l/public/s29518349.jpg" height="650" width="400"/>
            </div>

            <div class="item" >
                <img src="https://img9.doubanio.com/view/subject/l/public/s25648004.jpg" height="650" width="400"/>
            </div>
            <div class="item" >
                <img src="https://img9.doubanio.com/view/subject/l/public/s29195878.jpg" height="650" width="400"/>
            </div>
        </div>

        <!-- 轮播图上的向前一图切换链接 -->
        <a href="#carousel-example-generic" data-slide="prev" class="left carousel-control">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <!-- 轮播图上的向后一图切换链接 -->
        <a href="#carousel-example-generic" data-slide="next" class="right carousel-control">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>


    <ul class="nav nav-tabs" id="myTabs">
        <li class="active"><a href="homePage">所有图书</a></li>
        <li><a href="homePage/python">python</a></li>
        <li><a href="homePage/java">java</a></li>
        <li><a href="homePage/cpp">c/c++</a></li>
        <li><a href="homePage/deeplearning">深度学习</a></li>
        <li><a href="homePage/cs">计算机基础</a></li>
    </ul>
    <br/>
    <form action="search"  method="GET">
        <input name="bookName" placeholder="搜索"/>
        <input type="submit" value="确定"/>
    </form>

    <div class="row">

        <c:forEach var="book" items="${bookInfo}">
            <div class="col-sm-4 col-md-3">
                <div class="thumbnail" >
                    <a href="detail/${book.bookId}">
                        <img style="width: 400px; height: 300px; display: block;" alt="100%x200" data-holder-rendered="true" src= "${book.pictureUrl}" >
                    </a>
                    <div class="caption center">
                        <h5>${book.bookName}</h5>
                        <p><span>价格:</span><span>${book.price}</span></p>
                        <p><a class="btn btn-primary btn-block" role="button" href="detail/${book.bookId}">查看详情</a></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>


    <nav class="center">
        <ul class="pagination  pagination-lg">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">末页</span>
                </a>
            </li>
        </ul>
    </nav>

</div>

<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>
</body>
</html>
