<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<div id="right">
<p>
品牌管理
</p>

<p>
<a href="adm/category/listWithView.do?pid=0&view=/admin/brand/ctg_list">首级</a>
</p>
<table border=1;>
<tr><td>id</td><td>名称</td><td>父级</td><td>状态</td><td>进入</td><td>品牌</td></tr>
<c:forEach var="ctg" varStatus="s" items="${list}">
<tr>
<td>
${ctg.id}
</td>
<td>
${ctg.name}
</td>
<td>
${ctg.pid}
</td>
<td>
${ctg.status}
</td>
<td>
<a href="adm/category/sublistWithView.do?pid=${ctg.id}&view=/admin/brand/ctg_list">进入</a>
</td>
<td>
<a href="admin/brand_listByCtgId.do?ctgId=${ctg.id}">品牌</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>