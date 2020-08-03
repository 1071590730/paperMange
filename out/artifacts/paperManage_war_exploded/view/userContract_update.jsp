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
<title>更新合同</title>
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
                  <span class="x-red">*</span>员工编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="u_id" name="u_id" value="${user.u_id}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同开始时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="c_sTime" name="c_sTime" value="${user.c_sTime}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同结束时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="c_eTime" name="c_eTime" value="${user.c_eTime}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工职务
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="u_post" name="u_post" value="${user.u_post}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同内容
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="c_content" name="c_content" value="${user.c_content}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="remarks" name="remarks" value="${user.remarks}" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <!-- 当button没有设置type,默认为sumit -->
              <button type="button" class="layui-btn" onclick="updateUserContract('${user.c_id}')">
                  修改
              </button>
          </div>
      </form>
    </div>
    <script>
    	function updateUserContract(c_id) {
			//拿到输入框的值
			var u_id = $("#u_id").val();
			var c_sTime = $("#c_sTime").val();
			var c_eTime = $("#c_eTime").val();
			var u_post = $("#u_post").val();
			var c_content = $("#c_content").val();
			var remarks = $("#remarks").val();
			//alert(sex);
			//使用ajax发送请求到后台
			$.ajax({
				type:"post",
				url:"userContractController/relUpdateUserContract.ajax",
				data:{
					c_id:c_id,
					u_id:u_id,
					c_sTime:c_sTime,
					c_eTime:c_eTime,
					u_post:u_post,
					c_content:c_content,
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
