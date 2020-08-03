<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--2个自定义标签解释  -->
<!--使用这两个标签的前提是引入 jstl包 -->
<!--要使用某些特殊标签 c:if c:foreach....  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--时间 格式转换 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--下面代码是获取项目根路径  -->
<%
	//获取项目名
	String path = request.getContextPath();
   //项目的根路径
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>职工合同管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/kkpager_orange.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript" src="js/kkpager.min.js"></script>
<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <%-- 分页相关 --%>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>

<script type="text/javascript">
        /* function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        } */
</script>

<script type="text/javascript">

</script>
</head>

<body onload="load()">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>职工合同管理</a> <a> <cite>职工合同管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="userContractController/toUserListContract.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
		
			<!-- 这个form表单时弹出层iframe组件，将其信息发送到控制层，然后控制层去数据库查询满足条件的相应的记录 -->
			<!-- 表单一点击查询就会将数据跳到后台去执行方法，得到数据后下边的if：foreach就会循环数据来显示 -->
			<!-- 这个地方等于就是改造后台查询方法 -->
			<form class="layui-form layui-col-md12 x-so" method="post" action="userContractController/toUserListContract.do">
				<span>合同查询：</span>
				 					
					
					<!-- 这儿的name值是后台写sql语句需要的EL表达式值 -->
				 <input class="layui-input" placeholder="请输职务"	name="u_post"> 
				<button type="submit" class="layui-btn" lay-submit="sreach()" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
			
		</div>
		
	<!-- 	<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" >
				<span>通过时间查询账单：</span> <input class="layui-input"  onClick="WdatePicker()"
							readonly="readonly" value="1900-01-01" 
					name="materialName1" id="porchaseTime1"> <input type="text" name="materialName2" onClick="WdatePicker()"
							readonly="readonly" value="1900-01-01" id="porchaseTime2"
					 autocomplete="off" class="layui-input">
				<button type="button" class="layui-btn" lay-submit="sreach()" lay-filter="sreach" onclick="quaryBill();">
					<i class="layui-icon">&#xe615;</i>
				</button>
				<span>结果为：</span> <input   class="layui-input"  name="ifo" id="ifo"
							readonly="readonly"  >
				
			</form>
		</div> -->
		<xblock>
		<!-- 点击按钮后打开弹出层组件iframe，将数据提交给控制层方法 -->
		<button class="layui-btn"
			onclick="x_admin_show('添加合同','userContractController/addUIContract.do',500,500)">
			<i class="layui-icon">&#xe608;</i>添加合同
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：${countUser} 条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
		            <th>员工编号</th>
		            <th><i class="layui-icon" id="t1" onclick="t1()">&#xe625;</i>合同开始日期</th>
		            <th><i class="layui-icon" id="t2" onclick="t2()">&#xe625;</i>合同结束日期</th>
		            <th>员工职务</th>
		            <th>合同内容</th>
		            <th>备注</th>
		            <th>操作</th>
				</tr>
			</thead>
			<tbody>
			
			
				<!-- 数据示例,用c标签来循环数据 ，var用来给users集合起别名-->
				<c:forEach items="${users}" var="user">
				<tr>
				
				<td>${user.u_id}</td>
				<td>${user.c_sTime}</td>
				<td>${user.c_eTime}</td>
				<td>${user.u_post}</td>
				<td>${user.c_content}</td>
				<td>${user.remarks}</td>
				<td class="td-manage">
				<!-- //点击修改用户按钮，会把点击的记录的user_id传后台 ，
				这是一个弹出层ifram组件x_admin_show，第一个参数是title，第二个是控制层的url，第三个第四个是宽和高-->
				<a tatile="修改" onclick="x_admin_show('修改合同','userContractController/updateUserContract.do?c_id=${user.c_id}',500,500)">
				<i class="layui-icon">&#xe642; </i>
				 </a>				 
				 <!-- 将当前记录的userId传给函数 ，obj指当前对象，因为使用了forEach循环-->
				<a tatile="删除" onclick="user_del(this,'${user.c_id}')">
				<i class="layui-icon">&#xe640; </i>
				 </a>				 
				</td>
				</tr>
				</c:forEach>
				
				<!-- 前台传数据到后台的方法：
				1、通过url的？传值
				2、通过form提交
				3、通过ajax提交 -->
				
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
function user_del(obj,c_id){
	layer.msg("确定删除吗？",{
		time:0,//不自动关闭
		btn:['确定删除','取消返回'],
		yes:function(index){
			$.ajax({
				type:"post",
				url:"userContractController/delUserContract.ajax",
				data:{
					c_id:c_id
				},
				dataType:"text",
				success:function(info){
					//显示是否增加的信息
					layer.msg("删除成功",{
						icon:1,
						time:1000,
					},function(){
						//刷新当前窗口
						location.replace(location.href);
					})
				},
				error:function(){
					layer.msg("ajax请求失败！",{icon:2});
				}				
			})
		}
	})
}
</script>
</body>
</html>