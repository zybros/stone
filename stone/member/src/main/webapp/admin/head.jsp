<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>stone</title>
<base href="<%=basePath%>">
<link href="resource/css/global.css" rel="stylesheet" type="text/css"/>
<link href="resource/css/admin-right.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="resource/js/jquery-1.4.4.min.js"></script>
<script>
	var getparameter = function(name){
		var location = document.location.toString();
		location = location.substring(location.indexOf("?")+1);
		var params = location.split("&");
		for(var p in params){
			var parr = params[p].split("=");
			if (name == parr[0]) {
				return parr[1];
			}
		}
	}
</script>
<div style="width:100%;height:75;text-align: center;">
<!-- <div style="background-image:url('img/logo.png');width:240;height:73;float:left;"></div> -->
<div style="height:73;text-align: center;">
<a href="front/index.jsp">前台</a>
<a href="use/user/find.do">会员中心</a>
<a href="admin/index.jsp">后台</a>
</div>
</div>
