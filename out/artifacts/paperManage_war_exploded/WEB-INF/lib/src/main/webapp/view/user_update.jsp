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
<title>更新读者</title>
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
                  <input type="text" id="username" name="username" value="${user.username}" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
             <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="password" name="password" value="${user.password}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
              
              <!-- 用c:if进行判断当前点击修改记录的用户性别,后台是根据id查询出来的记录，用request返回的是user对象 -->
              	<c:if test="${user.sex=='男'}">
              	<input name="sex" id="a" checked="" type="radio" value="男" lay-skin="primary" title="男">
                <input name="sex" id="b" type="radio" value="女" lay-skin="primary" title="女">		
              	</c:if>
              	
                  <c:if test="${user.sex=='女'}">
              	<input name="sex" id="a" type="radio" value="男" lay-skin="primary" title="男">
                  <input name="sex" id="b" type="radio" checked=""  value="女" lay-skin="primary" title="女">                     		
              		</c:if>
              			
              	
                  <c:if test="${user.sex==''||user.sex==null}">
              	<input name="sex" id="a" type="radio" value="男" lay-skin="primary" title="男">
                  <input name="sex" id="b" type="radio" value="女" lay-skin="primary" title="女">                     		
              		</c:if>
              </div>
          </div>
       
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>出生日期
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="birthday" name="birthday" value="${user.birthday}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
        
        <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>联系电话
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="telphone" name="telphone" value="${user.telphone}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>邮箱地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="email" name="email" value="${user.email}" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学历
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="record" name="record" value="${user.record}" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>职务
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="post" name="post" value="${user.post}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>入职时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="post_joinTime" name="post_joinTime" value="${user.post_joinTime}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>状态
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="status" name="status" value="${user.status}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="remarks" name="remarks" value="${user.remarks}"  lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <!-- 当button没有设置type,默认为sumit -->
              <button type="button" class="layui-btn" onclick="updateUser('${user.userId}')">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
    	function updateUser(userId) {
			//拿到输入框的值
			var username = $("#username").val();
			var password = $("#password").val();
			var birthday = $("#birthday").val();
			var telphone = $("#telphone").val();
			var email = $("#email").val();
			var record = $("#record").val();
			var post = $("#post").val();
			var post_joinTime = $("#post_joinTime").val();
			var status = $("#status").val();
			var remarks = $("#remarks").val();
			if($("#a").prop("checked")){
				var sex = $("#a").val();
			}
			if($("#b").prop("checked")){
				var sex = $("#b").val();
			}
			var uid = 3;//表示进行修改操作，需要到数据库进行操作
			//alert(sex);
			//使用ajax发送请求到后台
			$.ajax({
				type:"post",
				url:"userController/relUpdateUser.ajax",
				data:{
					uid:uid,
					username:username,
					password:password,
					sex:sex,
					userId:userId,
					birthday:birthday,
					telphone:telphone,
					email:email,
					record:record,
					post:post,
					post_joinTime:post_joinTime,
					status:status,
					remarks:remarks
				},
				dataType:"text",
				success:function(info){
					//显示是否增加的信息
					layer.msg("修改成功",{
						icon:1,
						time:1000,
					},function(){
						//关闭字窗口,刷新父窗口
						//1.先拿到当前窗口的实例
						var index = parent.layer.getFrameIndex(window.name);
						//2.刷新父窗口
						parent.location.reload();
						//3.关闭子窗口
						parent.layer.close(index);
					})
				},
				error:function(){
					layer.msg("ajax请求失败！",{icon:2});
				}
				
				
				
			})
			
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
