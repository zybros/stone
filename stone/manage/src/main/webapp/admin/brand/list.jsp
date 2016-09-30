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
品牌列表
</p>

<p>
<a href="admin/brand/add.jsp">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>名称</td><td>描述</td><td>图片</td><td>品牌網址</td><td>是否显示</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.name}
</td>
<td>
${o.desc}
</td>
<td>
<img width="100" height="60" src="<%=FilePath.baseImgServer%>${o.img}">
</td>
<td>
${o.website}
</td>
<td>
<c:choose> 
<c:when test="${o.status==1}">   
  显示
  </c:when> 
  <c:otherwise>   
    隐藏
  </c:otherwise> 
</c:choose> 
</td>
<td>
<a href="admin/brand_get4edit.do?id=${o.id}">edit</a> || <a href="admin/brand_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>