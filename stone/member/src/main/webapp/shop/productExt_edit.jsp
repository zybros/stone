<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<%@page import="com.stone.base.system.*"%>                
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="resource/js/template.js"></script>
<script type="text/javascript"src="resource/js/descartes.js"></script>
<script>
$(document).ready( function() {
	
	//渲染扩展属性
	var renderTmps = function(items){
	 	var html = "<table border='1' width='500'>";
		for(i in items){
			var options = $().selectedFormatElement(items[i]);
			html += "<tr><td width=30%>"+items[i].name + "</td><td>"+options+"</td></tr>";
		}
		html += "</table>";
		$("#tmps").html(html);
	}
	var extItems = ${extItems};
	renderTmps(extItems);
	
	
});
</script>
</head>
<body>
<center>
<div id="right">
<p>
商品扩展属性编辑
</p>


<FORM id="myform" METHOD=POST ACTION="sho/productExt_update.do">
  <div id="tmps">
  </div>
  <p>
	<INPUT id="update" TYPE="submit" value="更新">
	</p>
 <br>
  <input type="hidden" name="productId" value="${productId}"/>
 </FORM>
 </div>
</center>
</body>
</html>