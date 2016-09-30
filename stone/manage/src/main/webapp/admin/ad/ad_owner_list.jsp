<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
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
广告商家列表
</p>

<p>
<a href="admin/ad/ad_owner_add.jsp">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>联系人</td><td>联系人电话</td><td>邮箱</td><td>来源</td><td>地址</td><td>公司名称</td><td>公司站点</td><td>办公电话</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
<a href="admin/ad_owner_get.do?id=${o.id}">${o.id}</a>
</td>
<td>
${o.linkMan}
</td>
<td>
${o.phone}
</td>
<td>
${o.email}
</td>
<td>
${o.type}
</td>
<td>
${o.address}
</td>
<td>
${o.companyName}
</td>
<td>
${o.companySite}
</td>
<td>
${o.officePhone}
</td>
<td>
<a href="admin/ad_owner_get4edit.do?id=${o.id}">edit</a> || <a href="admin/ad_owner_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>