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
栏目列表
</p>

<p>
<a href="adm/tuan_ctg_pre_add.do?parentId=0">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>父级栏目</td><td>栏目名称</td><td>栏目描述</td><td>是否启用</td><td>显示顺序</td><td>创建人</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.parentId}
</td>
<td>
${o.name}
</td>
<td>
${o.description}
</td>
<td>
${o.status}
</td>
<td>
${o.order}
</td>
<td>
${o.adminId}
</td>
<td>
<a href="adm/tuan_ctg_find_edit.do?id=${o.id}">edit</a> || <a href="adm/tuan_ctg_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>