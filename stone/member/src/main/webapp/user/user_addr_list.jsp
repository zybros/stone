<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<center>
		<div id="right">
<p>
收货地址列表
</p>

<p>
<a href="user/user_addr_add.jsp">添加</a>
</p>
<table border=1; width="90%">
<tr><td>id</td><td width="70">是否默认</td><td width="80">收件人</td><td>电话</td><td>固定电话</td><td>地址</td><td>邮编</td><td width="80">edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${addrList}">
<tr>
<td>
${o.id}
</td>
<td>
<c:choose>
	<c:when test="${o.isDefault==1}">是</c:when>
	<c:otherwise>否</c:otherwise>
</c:choose>
</td>
<td>
${o.receiver}
</td>
<td>
${o.phone}
</td>
<td>
${o.fixedPhone}
</td>
<td>
${o.wholeAddr}
</td>
<td>
${o.postCode}
</td>
<td>
<a href="use/user_addr_find.do?id=${o.id}">edit</a> || <a href="use/user_addr_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>