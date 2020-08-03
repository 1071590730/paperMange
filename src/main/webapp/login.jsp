<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>

<base href="<%=basePath%>" />
<meta charset="UTF-8">
<title>人事资源管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script src="lib/layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript">
	//如果该页面在iframe中出现，那么会自动调用最外层窗口刷新本链接
	if (window != top) {
		top.location.href = location.href;
	}
</script>
<style type="text/css">
a:hover{
	color:red;
    border-bottom: 1px solid red; 
    cursor:pointer;
}
a{
  font-weight:bold;
}
</style>
</head>
<body class="login-bg">

	<div class="login" >
		<div class="message" style="letter-spacing: 6px; font-size: 17px;">论文申报管理系统-用户登录</div>
		
		<font  id="error" size="15" class="text-align:center" color="red"></font>
		<div id="darkbannerwrap"></div>
		<form  class="layui-form" id="submit">
			<input id="username" placeholder="用户名" type="text" 
				class="layui-input">
			<hr class="hr15">
			<input id="password" placeholder="密码" type="password" 
				class="layui-input">
			<hr class="hr15">
			<input lay-submit lay-filter="login" style="width: 100%;"
				type="button" value="登录" onclick="login()" />
			<hr class="hr20">
		</form>
		<input type="checkbox" id="ck"   >&nbsp;30天内自动登录
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>没有账号？<a href="register.jsp">注册账号</a>	</span>	
	</div>
</body>
</html>
<script type="text/javascript">
	function login() {
		//获取输入框的值
		var username = $("#username").val();
		var password = $("#password").val();
		var check = $("#ck").prop("checked");
		//给定一个变量
		var ck = "";
		if(check){
			ck = "YES";
		}else {
			ck = "NO";
		}
		if(username.length==0 || password.length==0){
			layer.msg("用户名或者密码不能为空！",{icon:2});
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/login/checkLogin.ajax",
				type:"post",
				dataType:"text",
				data:{
					username:username,
					password:password,
					ck:ck
				},
				success:function(info){
					if(info=="success") {
						window.location.href = "${pageContext.request.contextPath}/index.jsp";
					}else {
						layer.msg("账号或密码错误！", {icon: 1});
					}
				},
				error:function(){
					layer.msg("ajax请求失败！",{icon:2});
				}
			})
		}
	}

	var submit = document.getElementById("submit");
	submit.onkeydown = function (ev) {
		var evt = ev || event
		if(evt.keyCode == 13){
			login();
		}
	}
</script>