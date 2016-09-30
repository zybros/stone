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
		$("#imgDiv").html('<input type="file" name="img"/>');
	});
	
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
修改广告
</p>

<FORM METHOD=POST ACTION="admin/ad_update.do" enctype="multipart/form-data">
   <table border="1">
  <tr>
  	<td>名称</td>
  	<td><INPUT TYPE="text" NAME="adName" value="${a.adName}"></td>
  </tr>
   <tr>
  	<td>描述</td>
  	<td><INPUT TYPE="text" NAME="adDescription" value="${a.adDescription}"></td>
  </tr>
  <tr>
  	<td>显示类型</td>
  	<td>
  	<c:choose> 
  <c:when test="${a.adType==1}">   
  <INPUT TYPE="radio" checked="checked"  NAME="adType" value="1">图片&nbsp;&nbsp;<INPUT TYPE="radio" NAME="adType" value="2">文字
  </c:when> 
  <c:otherwise>   
    <INPUT TYPE="radio" NAME="adType" value="1">图片&nbsp;&nbsp;<INPUT TYPE="radio" checked="checked"  NAME="adType" value="2">文字
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
  <tr>
  	<td>广告文字</td>
  	<td><INPUT TYPE="text" NAME="adWords" value="${a.adWords}"></td>
  </tr>
  <tr>
  	<td>广告图片</td>
  	<td>
  	<div id="imgDiv">
  	<img width="100" height="60" src="<%=FilePath.adImgServer%>${a.adImg}"><span style="cursor:pointer" id="del">删除</span>
  	<input style="display:none;" type="file" name="img"/>
  	<input type="hidden" name="adImg" value="${a.adImg}"/>
  	</div>
  	</td>
  </tr>
  <tr>
  	<td>是否显示</td>
  	<td>
  		<c:choose> 
  <c:when test="${a.adStatus==1}">   
  <INPUT TYPE="radio" checked="checked"  NAME="adStatus" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" NAME="adStatus" value="2">隐藏
  </c:when> 
  <c:otherwise>   
    <INPUT TYPE="radio" NAME="adStatus" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" checked="checked"  NAME="adStatus" value="2">隐藏
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
   <tr>
  	<td>广告链接</td>
  	<td><INPUT TYPE="text" NAME="adUrl" value="${a.adUrl}"></td>
  </tr>
   <tr>
  	<td>投放者</td>
  	<td><INPUT TYPE="text" NAME="ownerId" value="${a.ownerId}"></td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="adId" value="${a.adId}" />
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>