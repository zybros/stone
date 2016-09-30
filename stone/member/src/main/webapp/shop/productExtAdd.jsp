<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/template.js"></script>
<script>
	$(document).ready(function() {


});
</script>
</head>
<body>
	<center>

		<div id="right">
			<p>商品基本属性-><b>商品扩展属性</b>->商品规格属性</p>

			<FORM id="myform" METHOD="POST" ACTION="sho/productExt_add.do">
				<table border="1" width="500">
					<tr>
						<td width=30%>类别</td>
						<td>${product.cid}</td>
					</tr>
					<tr>
						<td>名称</td>
						<td>${product.title}</td>
					</tr>
				</table>
				<div id="tmps">
				
				<jsp:include page="template_getByCidAndType.do">
					<jsp:param value="${product.cid}" name="categoryId"/>
					<jsp:param value="1" name="type"/>
					<jsp:param value="/shop/productExtAddInner" name="view"/>
				</jsp:include>
				
				
				</div>
				<p>
					<INPUT TYPE="submit" value="提交">
				</p>
				<br>
				<input type="hidden" name="id" value="${product.id}" /> 
				<input type="hidden" name="shopId" value="${product.shopId}" /> 
				<input id="ctgId" type="hidden" name="cid" value="${product.cid}" />
				<input type="hidden" name="title" value="${product.title}" /> 
			</FORM>
		</div>
	</center>
</body>
</html>