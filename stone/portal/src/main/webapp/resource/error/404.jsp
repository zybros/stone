<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%><head>	<title>404 - 当前页面不存在</title>	<base href="<%=basePath%>"/>
	<style>
	body{
		background: #ccc;
	}
	.xy{
		width: 650px;
		height: 400px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -325px;
		margin-top: -200px;
	}
	.xydd{
		color: #999;
		font-family: '微软雅黑';
		font-size: 20px;
		text-align: center;
	}
	</style>
</head>
<body>
	<div class="xy">
		<img src="resource/images/404.jpg" alt="" />
	</div>
	<div class="xydd">
		<h1>当前页面被UFO抓走了！！！</h1>
	</div>
</body>
</html>