<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<%@page import="com.stone.base.system.*"%>                
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready( function() {
	$("#update").click(function(){
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
<p>
商品规格编辑
</p>

<FORM id="myform" METHOD=POST ACTION="sho/productSku_update.do">
	<table border="1">
	<tr>
		<td>SKU编号</td>
		<td><input type="text" value="${list[2][0].skuNo}" name="skuNo"/></td>
	</tr>
	<tr>
		<td>价格</td>
		<td><input type="text" value="${list[2][0].price}" name="price"/></td>
	</tr>
	<tr>
		<td>库存</td>
		<td><input type="text" value="${list[2][0].stock}" name="stock"/></td>
	</tr>
	</table>
	
 <p>平台设置的规格</p>
  <div id="mall">
  	<jsp:include page="productSku_edit_inner.jsp"/>
</div>
 <p>商家设置的规格</p>
  <div id="shop">
  <jsp:include page="productSku_edit_inner2.jsp"/>
</div>
  <p>
	<INPUT id="update" TYPE="button" value="更新">
	</p>
 <br>
 <input type="hidden" name="id" value="${list[2][0].id}"/>
  <input type="hidden" name="productId" value="${list[2][0].productId}"/>
  <input type="hidden" name="categoryId" value="${list[2][0].categoryId}"/>
  <div id="vals"></div>
 </FORM>
 </div>
</center>
</body>
</html>