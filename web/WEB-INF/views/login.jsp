<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/1
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>登录</title>
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
            <a class="navbar-brand" href="/homePage">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/homePage">首页</a></li>
                <li><a href="order">我的订单</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="#">登录</a></li>
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
            <h1 class="text-center" style="margin-bottom: 30px">用户登录</h1>
        </div>
        <div class="col-sm-6">
            <form action="/usrLogin" class="form-horizontal caption"  method="post">
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" name="userName" class="form-control" id="username" placeholder="用户名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-8">
                        <input type="password" name="userPassword" class="form-control" id="password" placeholder="密码">
                    </div>


                </div>
<%--                <div class="form-group">--%>
<%--                    <div class="col-sm-offset-3 col-sm-9">--%>
<%--                        <div class="checkbox">--%>
<%--                            <label>--%>
<%--                                <input type="checkbox">记住我--%>
<%--                            </label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <input type="radio" name="authority" value="admin"/>管理员
                        <br/>
                        <input type="radio" checked="checked" name="authority" value="usr"/>用户
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-success btn-block" >登录</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-sm-6">
            <div class="caption">
                <h3>免责声明</h3>
                <p>一切解释权归ztt所有</p>

            </div>

        </div>

    </div>
</div>


<!--footer-->
<div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div>
<script>
    function usrLoginStatus(loginStatus) {
        if (loginStatus === 1) alert("登录成功");
        else if (loginStatus === 0) alert("密码错误");
    }
</script>
</body>
</html>
