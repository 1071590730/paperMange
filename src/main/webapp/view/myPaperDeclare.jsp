<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//获取项目名
	String path = request.getContextPath();
	//获取根路径
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>我的申报结果</title>
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
<script type="text/javascript" src="js/kkpager.js"></script>
<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <%-- 分页相关 --%>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/kkpager/jpager.css">
<%--<script type="text/javascript">--%>
<%--        $(function(){--%>
<%--        	var pageNo = getParameter('page');--%>
<%--        	if(!pageNo){--%>
<%--        		pageNo = 1;--%>
<%--        	}--%>
<%--        	initUserList(pageNo);--%>
<%--        	--%>
<%--        	--%>
<%--        	--%>
<%--        })--%>
<%--        --%>
<%--        function initUserList(pageNo){--%>
<%--        	$.ajax({--%>
<%--        		type:"post",--%>
<%--        		url:"userController/showUser.do",--%>
<%--        		dataType:"json",--%>
<%--        		async:false,--%>
<%--        		data:{--%>
<%--        			pageNo:pageNo,--%>
<%--        			pageSize:2,--%>
<%--        		},--%>
<%--        		success:function(data){--%>
<%--        			alert(data);--%>
<%--        		},--%>
<%--        		error:function(){--%>
<%--        			alert("ajax请求失败！");--%>
<%--        		}--%>
<%--        		--%>
<%--        		--%>
<%--        	})--%>
<%--        }--%>
<%--</script>--%>
</head>

<body onload="load(1)">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>论文申报</a> <a> <cite>我的申报结果</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="view/myPaperDeclare.jsp" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">


		<xblock>
		<span class="x-right" style="line-height: 40px"></span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th>院级审核结果</th>
					<th>校级审核结果</th>
					<th>审核意见</th>
					<th>审核时间</th>
					<th>下载</th>
				</tr>
			</thead>
			<tbody>
				<tr id="tb">
<%--					<td>${paper.departreview}</td>--%>
<%--					<td>${paper.schoolreview}</td>--%>
<%--					<td>${paper.uploadtime}</td>--%>
<%--					<td>${paper.paperpro}</td>--%>

				</tr>
			</tbody>
		</table>
		<div align="center" id="jpager"></div>
		<!-- 分页部分 -->
		 <div id="kkpager"></div>
		<!--  end 分页  -->

	</div>
</body>
</html>
<script>

	function load(p) {
		console.log("ajax请求")
		var name = "TOM"
		//发送ajaxj请求
		$.ajax({
			url: "<%=basePath%>/student/queryPaperById.ajax?name="+name,
			type: "get",
			dataType: "json",

			success:function (data) {
				console.log(data)
				var html="";
				html+=
						"<td>"+data.departreview+"</td>"+
						"<td>"+data.schoolreview+"</td>"+
						"<td>"+data.paperpro+"</td>"+
						"<td>"+data.uploadtime+"</td>"+
						"<td bgcolor='#0099FF' onclick=\"window.open('"+data.paperurl+"')\">下载我的论文</td>"
						// "<td>"+data.paperurl+"</td>"
						;
				// for (var i=0;i<data.list.length;i++){
				// 	html+="<tr>" +
				// 			"<td>"+data.list[i].departreview+"</d>" +
				// 			"<td>"+data.list[i].schoolreview+"</td>" +
				// 			"<td>"+data.list[i].uploadtime+"</td>" +
				// 			"<td>"+data.list[i].paperpro+"</td>" +
				// 			"</tr>"
				// }
				//把拼接的html变量信息显示在id=rName的标签上
				$("#tb").html(html)
			}

		})

	}
</script>