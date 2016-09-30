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
<script type="text/javascript" src="resource/js/descartes.js"></script>
<script>
	$(document).ready(function() {
		
		$("#btn").click(function(){
			var index = 0;
			var vals = "";
			$("input[name^='std'][type='radio']").each(function(){
				if($(this).attr("checked")=="checked"){
					var templateId = $(this).attr("name").substring(3);
					var value = $(this).val();
					vals += '<input type="hidden" name="valList['+index+'].templateId" value="'+templateId+'"/>';
					vals += '<input type="hidden" name="valList['+index+'].value" value="'+value+'"/>';
					index++;
				}
			});
			$("#vals").html(vals);
			
			$("#myform").submit();
			
		});
		
		
		
	});
											

</script>
</head>
<body>
	<center>

		<div id="right">
			<p>商品基本属性->商品扩展属性-><b>商品规格属性</b></p>

			<FORM id="myform" METHOD="POST" ACTION="sho/productSku_add.do">
				<table border="1" width="500">
					<tr>
						<td width=30%>类别</td>
						<td>${product.cid}</td>
					</tr>
					<tr>
						<td>名称</td>
						<td>${product.title}</td>
					</tr>
					<tr>
						<td>SKU编号</td>
						<td><input type="text" value="" name="skuNo"/></td>
					</tr>
					<tr>
						<td>价格</td>
						<td><input type="text" value="" name="price"/></td>
					</tr>
					<tr>
						<td>库存</td>
						<td><input type="text" value="" name="stock"/></td>
					</tr>
				</table>

				<jsp:include page="template_getByCidAndType.do">
					<jsp:param value="${product.cid}" name="categoryId"/>
					<jsp:param value="2" name="type"/>
					<jsp:param value="/shop/productSkuAddInner" name="view"/>
				</jsp:include>
				
				
				<jsp:include page="template_getSelf4shop.do">
					<jsp:param value="${product.cid}" name="categoryId"/>
					<jsp:param value="/shop/productSkuAddInner2" name="view"/>
				</jsp:include>

				<p>
					<INPUT id="btn" TYPE="button" value="提交">
				</p>
				<input type="hidden" name="productId" value="${product.id}" /> 
				<input id="ctgId" type="hidden" name="categoryId" value="${product.cid}" />
				<div id="vals"></div>
			</FORM>
		</div>
	</center>
</body>
</html>