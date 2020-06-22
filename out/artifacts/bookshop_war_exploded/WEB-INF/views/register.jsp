<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANJUN0810
  Date: 2020/6/4
  Time: 11:22
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
            <a class="navbar-brand" href="Index.html">图书商城</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.html">首页</a></li>
                <li><a href="Order.html">我的订单</a></li>
                <li><a href="UserInfo.html">个人中心</a></li>
                <li><a href="FriendLink.html">友情链接</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.html">登录</a></li>
                <li><a href="Register.html">注册</a></li>
                <li>
                    <a href="Cart.html"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<!--content-->
<div class="container">
    <div class="row thumbnail">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">用户注册</h1>
        </div>
        <div class="col-sm-6">
            <form action="/usrRegister"class="form-horizontal caption" method="post">
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="userName" id="username" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" name="userPassword"id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">确认密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" name="confirmPassword" id="password2" placeholder="确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-3 control-label">真实姓名</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" name="realName" id="realName" placeholder="真实姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-3 control-label">电话</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" name="phone" id="telephone" placeholder="电话号码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="address" id="address" placeholder="地址">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">邮箱</label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control" name="email" id="email" placeholder="邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-success btn-block">注册</button>
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
</body>
</html>
