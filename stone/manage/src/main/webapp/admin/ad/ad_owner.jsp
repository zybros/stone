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
广告商家信息
</p>

  <table border="1">
  <tr>
  	<td>联系人</td>
  	<td>${ao.linkMan}</td>
  </tr>
   <tr>
  	<td>联系人电话</td>
  	<td>${ao.phone}</td>
  </tr>
  <tr>
  	<td>联系邮箱</td>
  	<td>${ao.email}</td>
  </tr>
  <tr>
  	<td>机构、个人</td>
  	<td>
  <c:choose> 
  <c:when test="${ao.type==1}">   
  	 机构
  </c:when> 
  <c:otherwise>   
   	个人
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
  <tr>
  	<td>地址</td>
  	<td>${ao.address}</td>
  </tr>
  <tr>
  	<td>公司名称</td>
  	<td>${ao.companyName}</td>
  </tr>
   <tr>
  	<td>公司站点</td>
  	<td>${ao.companySite}</td>
  </tr>
   <tr>
  	<td>公司电话</td>
  	<td>${ao.officePhone}</td>
  </tr>
  </table>
  <p>
	<INPUT id="back" TYPE="button" value="返回">
	</p>
 </div>
</center>
</body>
</html>