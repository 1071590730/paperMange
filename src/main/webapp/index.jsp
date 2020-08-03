<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>人力资源管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/cutsom-style.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>

<style type="text/css">

        @font-face {font-family: "iconfont";
          src: url('fonts/index/iconfont.eot'); /* IE9*/
          src: url('fonts/index/iconfont.eot#iefix') format('embedded-opentype'), /* IE6-IE8 */
          url('fonts/index/iconfont.woff') format('woff'), /* chrome, firefox */
          url('fonts/index/iconfont.ttf') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
          url('fonts/index/iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
        }

        .iconfont {
          font-family:"iconfont" !important;
          font-size:16px;
          font-style:normal;
          -webkit-font-smoothing: antialiased;
          -webkit-text-stroke-width: 0.2px;
          -moz-osx-font-smoothing: grayscale;
        }

    </style>

</head>
<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="index.jsp">论文申报管理系统</a>
		</div>
		<div class="left_open">
			<i title="展开左侧栏" class="iconfont">&#xe699;</i>
		</div>
	<!--  	<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+下拉菜单</a>
				<dl class="layui-nav-child">
					
					<dd>
						<a onclick="x_admin_show('资讯','http://www.baidu.com')"><i
							class="iconfont">&#xe6a2;</i>模拟窗口A</a>
					</dd>
					<dd>
						<a onclick="x_admin_show('图片','http://www.baidu.com')"><i
							class="iconfont">&#xe6a8;</i>模拟窗口B</a>
					</dd>
					<dd>
						<a onclick="x_admin_show('用户','http://www.baidu.com')"><i
							class="iconfont">&#xe6b8;</i>模拟窗口C</a>
					</dd>
				</dl></li>
		</ul> -->
		<ul class="layui-nav right">
		<!-- 通过EL表达式获取用户名 -->
			<li class="layui-nav-item to-index"><a href="index.jsp">上次登陆时间:${lastLoginTime}</a></li>
			<li class="layui-nav-item"><a href="javascript:;">欢迎：${USERNAME}</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人中心</a>
					</dd>
					<dd>
						<a tatile="修改密码" onclick="x_admin_show('修改密码','userController/modifyPassword.do?username=${USERNAME}&password=${USERID}',500,500)">
				修改密码<i class="layui-icon">&#xe642; </i>
				 </a>
					</dd>
					<dd>
						<a href="${pageContext.request.contextPath}/login.jsp">退出登录</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="index.jsp">系统首页</a></li>
		</ul>

	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<!-- 示例：这是一个下拉菜单 -->
				<li><a href="javascript:;"> <i class="iconfont">&#xe6b8;</i> <cite class="menus">用户管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<!-- 点击用户管理那么就会去控制层执行方法 -->
						<li><a _href="${pageContext.request.contextPath}/userController/toUserList.do"> <i
								class="iconfont">&#xe6a7;</i> <cite class="item1">管理员信息</cite>
						</a></li>
					</ul>
					<ul class="sub-menu">
						<!-- 点击用户管理那么就会去控制层执行方法 -->
						<li><a _href="userArchivesController/toUserListArchives.do"> <i
								class="iconfont">&#xe6a7;</i> <cite class="item1">教师信息</cite>
						</a></li>
					</ul>
					<ul class="sub-menu">
						<!-- 点击用户管理那么就会去控制层执行方法 -->
						<li><a _href="userContractController/toUserListContract.do"> <i
								class="iconfont">&#xe6a7;</i> <cite class="item1">学生信息</cite>
						</a></li>
					</ul>
					</li>
				<!-- 这组下拉菜单结束 -->

				<!-- 这是另一组菜单示例 -->
				<li><a href="javascript:;"> <i class="iconfont">&#xe629;</i> 
				<cite class="menus">论文管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="roleController/toUserRole.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item2">查看学生论文</cite>
						</a></li>
						<li><a _href="roleController/toDepart.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item2">审核学生论文</cite>
						</a></li>
					</ul></li>
	
				<!-- 示例结束 -->
				
				<!-- 这是另一组菜单示例 -->
				
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe607;</i> 
				<cite class="menus">审核管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="applyController/showApplyByUserName.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item3">我的已审核</cite>
						</a></li>
						<li><a _href="applyController/addApply.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item3">我的未审核</cite>
						</a></li>
					</ul></li>
			
				<!-- 示例结束 -->
				
				<!-- 这是另一组菜单示例 -->
			
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe602;</i> 
				 <cite class="menus">我的论文</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="porchaseController/showPorchase.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item4">提交论文</cite>
						</a></li>
						<li><a _href="porchaseController/showPorchase.do"> <i class="iconfont">&#xe6a7;</i> <cite class="item4">查看已提交</cite>
						</a></li>
					</ul></li>
			
				<!-- 示例结束 -->
				
					<!-- 这是另一组菜单示例 -->
				
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe68f;</i> 
				 <cite class="menus">论文申报</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="view/porchase/quary_bill.jsp"> <i class="iconfont">&#xe6a7;</i> <cite class="item5">我的申报结果</cite>
						</a></li>
						<li><a _href="view/alluser.jsp"> <i class="iconfont">&#xe6a7;</i> <cite class="item5">1</cite></a></li>
						<li><a _href="view/allUsers_list.jsp"> <i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/allUsersArchives_list.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/allUsersContract_list.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/modifyPassword.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/msg.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/redis_list.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/user_add.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/user_update.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/userArchives_add.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/userArchives_update.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/userContract_add.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
						<li><a _href="view/userContract_update.jsp"><i class="iconfont">&#xe6a7;</i> <cite class="item5">2</cite></a></li>
					</ul></li>
			
				<!-- 示例结束 -->


					<!-- 这是另一组菜单示例 -->

				<li><a href="javascript:;">
				<i class="iconfont">&#xe613;</i>
				<cite>菜单管理</cite> <i class="iconfont nav_right">&#xe697;</i>
				</a>
					</li>
			
				<!-- 示例结束 -->

			</ul>
		</div>
	</div>

	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<!-- 打开的标签页，无需手动添加 -->
			<ul class="layui-tab-title">
				<li>欢迎进入本系统</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='userController/showWelcome.do' frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
			<!-- 标签页结束 -->
		</div>
	</div>
	<div class="page-content-bg"></div>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
	<!-- 底部开始 -->
	<div class="footer">
		<div class="copyright">任宽 ©2020
			后端：任宽-java EE项目</div>
	</div>
	<!-- 底部结束 -->
	
</body>
</html>