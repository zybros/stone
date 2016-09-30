<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>管理后台</title>
<base href="<%=basePath%>">
<link href="resource/css/global.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"src="resource/js/jquery-1.7.2.min.js"></script>
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
