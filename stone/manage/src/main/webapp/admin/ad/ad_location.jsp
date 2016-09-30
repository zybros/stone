<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/template.js"></script>
<script>
$(document).ready( function() {
	
		$("#back").click(function(){
			window.history.back();
		});	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
广告位信息
</p>

   <table border="1">
  <tr>
  	<td>位置名称</td>
  	<td>${al.locationName}</td>
  </tr>
   <tr>
  	<td>位置描述</td>
  	<td>${al.locationDescriptions}</td>
  </tr>
  <tr>
  	<td>宽度</td>
  	<td>${al.locationWidth}</td>
  </tr>
  <tr>
  	<td>高度</td>
  	<td>${al.locationHigh}</td>
  </tr>
  <tr>
  	<td>创建时间</td>
  	<td>${al.createTime}</td>
  </tr>
  <tr>
  	<td>更新时间</td>
  	<td>${al.updateTime}</td>
  </tr>
  <tr>
  	<td>广告源码</td>
  	<td>${al.locationCode}</td>
  </tr>
  </table>
  <p>
	<INPUT id="back" TYPE="button" value="返回">
	</p>
 </div>
</center>
</body>
</html>