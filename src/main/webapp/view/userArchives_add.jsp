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
<title>添加档案</title>
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

<script src="lib/layui/lay/modules/laydate.js"></script>
<script>
//执行一个laydate实例
laydate.render({
  elem: '#birthday' //指定元素
});
</script>

</head>
<body>
    <div class="x-body">
        <form id="form1" class="layui-form">
       
          
             <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>员工编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="u_id" name="u_id" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>档案名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="a_name" name="a_name" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>内容摘要
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="summary" name="summary" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="remarks" name="remarks" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <!-- 当button没有设置type,默认为sumit -->
              <button type="button" class="layui-btn" onclick="addUserArchives()">
                  增加
              </button>
          </div>
      </form>
    </div>
    <script>
    	function addUserArchives() {
			//拿到输入框的值
			//$("#ddlregtype").find("option:selected").text();//取得select被选中的文本值
			//var a_id = $("#a_id").val();
			var u_id= $("#u_id").val();
			var a_name= $("#a_name").val();
			var summary = $("#summary").val();
			var remarks = $("#remarks").val();						
			//alert(sex);
			//使用ajax发送请求到后台
			$.ajax({
				type:"post",
				//将数据提交到后台执行方法
				url:"userArchivesController/addUserArchives.ajax",
				//把用户名，密码，性别，三个字段提交到后台
				data:{
					//a_id:a_id,
					u_id:u_id,
					a_name:a_name,
					summary:summary,
					remarks:remarks
				},
				dataType:"text",
				success:function(info){
					//显示是否增加的信息
					layer.msg("增加成功",{
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

  </body>

</html>
