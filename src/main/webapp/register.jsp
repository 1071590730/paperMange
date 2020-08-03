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
<title>用户注册</title>
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
		<div class="message" style="letter-spacing: 6px; font-size: 17px;">论文申报系统-用户注册</div>
		
		<font  id="error" size="15" class="text-align:center" color="red"></font>
		<div id="darkbannerwrap"></div>
		<form  class="layui-form" >
			<input id="username" placeholder="用户名" type="text" 
				class="layui-input">
			<hr class="hr15">
			<input id="password" placeholder="密码" type="password" 
				class="layui-input">
			<hr class="hr15">
			<input id="checkPassword" placeholder="确认密码" type="password" 
				class="layui-input">
			<hr class="hr15">
			<input id="email" placeholder="邮箱" type="text" 
				class="layui-input">
			<hr class="hr15">
			<input lay-submit lay-filter="login" style="width: 100%;"
				type="button" value="注册" onclick="register()" />
			<hr class="hr20">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>有账号？<a href="login.jsp">返回登录</a>	</span>	
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
	function register() {
		var username = $("#username").val();
		var password = $("#password").val();
		var checkPassword = $("#checkPassword").val();
		var email = $("#email").val();
		var checkEmail = /^\w+\@[a-z0-9]+\.[a-z]+$/i;//正则表达式，邮箱校验

		if(checkPassword!=password){
			layer.msg("密码不一致，请重新输入！",{time:3000, icon:1});
		}else{
			if(checkEmail.test(email)){
				$.ajax({
					url:"userController/register.ajax",
					type:"post",
					dataType:"text",
					data:{
						username:username,
						password:password,
						checkPassword:checkPassword,
						email:email
					},
					success:function(info){
						layer.msg("注册成功，请前往邮箱激活",{time:6000, icon:1});
					},
					error:function(){
						layer.msg("ajax请求失败！",{icon:2});
					}
				})
			}else{
				layer.msg("邮箱不符合命名规则！",{icon:2});
			}
		}
	}
</script>