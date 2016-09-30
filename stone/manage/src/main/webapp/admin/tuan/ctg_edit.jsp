<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="js/template.js"></script>
<script>
$(document).ready( function() {
	
	var init = function(){

	}
	
	init();
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
栏目修改
</p>

<FORM METHOD=POST ACTION="adm/tuan_ctg_update.do">
  <table border="1">
  <tr>
  	<td>栏目名称</td>
  	<td><INPUT TYPE="text" NAME="name" value="${ctg.name}"></td>
  </tr>
   <tr>
  	<td>栏目描述</td>
  	<td><INPUT TYPE="text" NAME="description" value="${ctg.description}"></td>
  </tr>
   <tr>
  	<td>显示顺序</td>
  	<td><INPUT TYPE="text" NAME="order" value="${ctg.order}"></td>
  </tr>
  <tr>
  	<td>是否启用</td>
  	<td>
		<input type="radio" value="1" name="status"<c:if test='${ctg.status == 1}'> checked</c:if> />启用&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" value="2" name="status"<c:if test='${ctg.status== 2}'> checked</c:if> />禁用
  		</td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="id" value="${ctg.id}" />
   <input type="hidden" name="parentId" value="${ctg.parentId}" />
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>