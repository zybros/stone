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
规格列表
</p>

<p>
<a href="shop/productSkuAdd2.jsp?cid=${sku.categoryId}&id=${sku.productId}">添加</a>
</p>
<table border=1;>
<tr><td>规格ID</td><td>货号</td><td>类别ID</td><td>商品ID</td><td>价格</td><td>库存</td><td>规格值</td><td>edit</td><td>del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.skuNo}
</td>
<td>
${o.categoryId}
</td>
<td>
${o.productId}
</td>
<td>
${o.price}
</td>
<td>
${o.stock}
</td>
<td>
${o.valsStr}
</td>
<td>
<a href="sho/productSku_get4edit.do?id=${o.id}&categoryId=${o.categoryId}">edit</a> 
<td>
<a href="sho/productSku_del.do?id=${o.id}&productId=${o.productId}&categoryId=${o.categoryId}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>