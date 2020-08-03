<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<title>修改密码</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
</head>
<body>
    <div class="x-body">
        <form id="form1" class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" value="${username}" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
             <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="password" name="password"   lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>确认新密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cPassword" name="cPassword"   lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <!-- 当button没有设置type,默认为sumit -->
              <button type="button" class="layui-btn" onclick="updateUser('${USERID}')">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
    	function updateUser(userId) {
			//拿到输入框的值
			var password = $("#password").val();
			var cPassword = $("#cPassword").val();
			if(cPassword!=password){
				layer.msg("密码不一致！",{icon:2});
			}else{
			//alert(sex);
			//使用ajax发送请求到后台
			$.ajax({
				type:"post",
				url:"userController/relModifyPassword.ajax",
				data:{
					userId:userId,
					password:password
				},
				dataType:"text",
				success:function(info){
					//显示是否增加的信息
					layer.msg("修改成功，将重新登录",{
						icon:1,
						time:4000,
					},function(){
					/* 	//关闭字窗口,刷新父窗口
						//1.先拿到当前窗口的实例
						var index = parent.layer.getFrameIndex(window.name);
						//2.刷新父窗口
						parent.location.reload();
						//3.关闭子窗口
						parent.layer.close(index); */
						
						window.location.href="userController/login.do"
					})
				},
				error:function(){
					layer.msg("ajax请求失败！",{icon:2});
				}
				
				
				
			})
			}
		}
          
        
    </script>
    <script>
    	var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();
    	</script>
  </body>

</html>
