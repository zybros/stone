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
	
	$("#del").click(function(){
		$("#imgDiv").html('<input type="file" name="imgObj"/>');
	});
	
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
修改品牌
</p>

<FORM METHOD=POST ACTION="admin/brand_update.do" enctype="multipart/form-data">
   <table border="1">
  <tr>
  	<td>名称</td>
  	<td><INPUT TYPE="text" NAME="name" value="${brand.name}"></td>
  </tr>
   <tr>
  	<td>描述</td>
  	<td><INPUT TYPE="text" NAME="desc" value="${brand.desc}"></td>
  </tr>
  <tr>
  	<td>广告图片</td>
  	<td>
  	<div id="imgDiv">
  	<img width="100" height="60" src="<%=FilePath.baseImgServer%>${brand.img}"><span style="cursor:pointer" id="del">删除</span>
  	<input style="display:none;" type="file" name="imgObj"/>
  	<input type="hidden" name="img" value="${brand.img}"/>
  	</div>
  	</td>
  </tr>
  <tr>
  	<td>品牌網址</td>
  	<td><INPUT TYPE="text" NAME="website" value="${brand.website}"></td>
  </tr>
  <tr>
  	<td>是否显示</td>
  	<td>
  		<c:choose> 
  <c:when test="${brand.status==1}">   
  <INPUT TYPE="radio" checked="checked"  NAME="status" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" NAME="status" value="2">隐藏
  </c:when> 
  <c:otherwise>   
    <INPUT TYPE="radio" NAME="status" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" checked="checked"  NAME="status" value="2">隐藏
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="id" value="${brand.id}" />
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>