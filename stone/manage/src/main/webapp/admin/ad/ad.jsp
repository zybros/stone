<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<%@page import="com.stone.base.system.*"%>  
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
广告信息
</p>

  <table border="1">
  <tr>
  	<td>名称</td>
  	<td>${a.adName}</td>
  </tr>
   <tr>
  	<td>描述</td>
  	<td>${a.adDescription}</td>
  </tr>
  <tr>
  	<td>显示类型</td>
  	<td>
  	<c:choose> 
  <c:when test="${a.adType==1}">   
 图片
  </c:when> 
  <c:otherwise>   
    文字
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
  <tr>
  	<td>广告文字</td>
  	<td>${a.adWords}</td>
  </tr>
  <tr>
  	<td>广告图片</td>
  	<td>
  	<img width="100" height="60" src="<%=FilePath.adImgServer%>${a.adImg}">
  	</td>
  </tr>
  <tr>
  	<td>是否显示</td>
  	<td>
  		<c:choose> 
  <c:when test="${a.adStatus==1}">   
 显示
  </c:when> 
  <c:otherwise>   
   隐藏
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
   <tr>
  	<td>广告链接</td>
  	<td>${a.adUrl}</td>
  </tr>
   <tr>
  	<td>投放者</td>
  	<td>${a.ownerId}</td>
  </tr>
  </table>
  <p>
	<INPUT id="back" TYPE="button" value="返回">
	</p>
 </div>
</center>
</body>
</html>