<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.stone.base.system.Domain"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#go").click(function(){
			location.href="<%=Domain.order%>/use/order_pre_confirm.do";
			
		});
	});
</script>
</head>
<body>
<center>
	<p>加入成功</p>
	<form name="productForm" action="" method="POST">
		<table border="1" cellspacing="0">
			<tr bgcolor="#CCCCCC">
				<td>id</td>
				<td>名称</td>
				<td>单价</td>
				<td>数量</td>
			</tr>
			<c:forEach var="item" varStatus="s" items="${cart.items}">
				<tr>
				<td>${item.sku.id} </td>
				<td>${item.sku.product.title}</td>
				<td>${item.sku.price}</td>
				<td>${item.count}</td>
			</tr>
		</c:forEach>
		</table>
		<p>
			总价：${cart.getTotalPrice()}
		</p>
		
		<p>
			<input type="button" value="继续购物" onclick="history.back(-1);" />
			<input id="go" type="button" value="去结算" />
		</p>
	</form>
</center>
</body>
</html>

