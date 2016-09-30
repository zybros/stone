<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<center>

<div id="right">
<p>
商品列表
</p>

<p>
<a href="shop/productAdd.jsp">添加</a>
</p>
<table border=1;>
<tr><td>id</td><td>类别ID</td><td>名称</td><td>价格</td><td>时间</td><td>状态</td><td>edit</td><td>del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.cid}
</td>
<td>
${o.title}
</td>
<td>
${o.price}
</td>
<td>
${o.time}
</td>
<td>
${o.status}
</td>
<td>
<a href="sho/product_get4edit.do?id=${o.id}">修改基本属性</a><br/>
<a href="sho/productExt_get4edit.do?id=${o.id}">修改扩展属性</a><br/>
<a href="sho/productSku_list.do?productId=${o.id}&categoryId=${o.cid}">修改规格属性</a> 
</td>
<td>
<a href="sho/product_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>