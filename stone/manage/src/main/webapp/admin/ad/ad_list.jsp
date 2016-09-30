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
</head>
<body>
<center>
		<div id="right">
<p>
广告列表
</p>

<p>
<a href="admin/ad/ad_add.jsp">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>名称</td><td>描述</td><td>显示类型</td><td>广告文字</td><td>广告图片</td><td>是否显示</td><td>广告链接</td><td>广告商家</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
<a href="admin/ad_get.do?adId=${o.adId}">${o.adId}</a>
</td>
<td>
${o.adName}
</td>
<td>
${o.adDescription}
</td>
<td>
<c:choose> 
<c:when test="${o.adType==1}">   
图片
  </c:when> 
  <c:otherwise>   
文字
  </c:otherwise> 
</c:choose> 
</td>
<td>
${o.adWords}
</td>
<td>
<img width="100" height="60" src="<%=FilePath.adImgServer%>${o.adImg}">
</td>
<td>
<c:choose> 
<c:when test="${o.adStatus==1}">   
  显示
  </c:when> 
  <c:otherwise>   
    隐藏
  </c:otherwise> 
</c:choose> 
</td>
<td>
${o.adUrl}
</td>
<td>
${o.ownerId}
</td>
<td>
<a href="admin/ad_get4edit.do?adId=${o.adId}">edit</a> || <a href="admin/ad_del.do?adId=${o.adId}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>