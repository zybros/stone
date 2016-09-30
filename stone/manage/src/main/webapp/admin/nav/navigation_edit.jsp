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
	
	var i = "${record.fieldList.size()}";
	var appendField = function(i){
		 var fields = '<table class="field" border="1"><tr><td>导航名称</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].name" value=""></td></tr>'+
		   '<tr><td>导航链接</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].url" value=""></td></tr>'+
		   '<tr><td>显示顺序</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].order" value=""></td></tr>'+
		  '<tr><td>是否启用</td><td><INPUT TYPE="radio" checked="checked"  NAME="fieldList['+i+'].status" value="1">启用&nbsp;&nbsp;<INPUT TYPE="radio" NAME="fieldList['+i+'].status" value="2">禁用</td></tr>'+
		  '<tr><td>是否推荐</td><td><INPUT TYPE="radio" checked="checked"  NAME="fieldList['+i+'].hot" value="1">正常&nbsp;&nbsp;<INPUT TYPE="radio" NAME="fieldList['+i+'].hot" value="2">推荐</td></tr>'+
		  '<tr><td colspan="2"><input class="del" type="button" value="删除"></td></tr></table>';
		  $("#fields").append(fields);
	 }
	  
	 $("#add").live('click', function() {
		 i++;
		 appendField(i);
	 });
	 
	 
	 $(".del").live('click', function() {
		 $(this).closest(".field").remove();
	 });
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
导航修改
</p>

<FORM METHOD=POST ACTION="adm/navi_record_update.do">
<h3>导航基本属性</h3>
  <table border="1">
   <tr>
  	<td>导航类型</td>
  	<td>
  	<input type="radio" value="1" name="type"<c:if test='${record.type == 1}'> checked</c:if> />纵向&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" value="2" name="type"<c:if test='${record.type== 2}'> checked</c:if> />横向
  	</td>
  </tr>
   <tr>
  	<td>显示顺序</td>
  	<td><INPUT TYPE="text" NAME="order" value="${record.order}"></td>
  </tr>
  <tr>
  	<td>是否启用</td>
  	<td>
  		<input type="radio" value="1" name="status"<c:if test='${record.status == 1}'> checked</c:if> />启用&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" value="2" name="status"<c:if test='${record.status== 2}'> checked</c:if> />禁用
  	</td>
  </tr>
  </table>
   <h3>导航字段项</h3>
  <span><input id="add" type="button" value="添加"></span>
  <div id="fields">
  
  <c:forEach var="o" varStatus="s" items="${record.fieldList}">
  
  <table class="field" border="1"><tr><td>导航名称</td><td><INPUT TYPE="text" NAME="fieldList[${s.index}].name" value="${o.name}"></td></tr>
<tr><td>导航链接</td><td><INPUT TYPE="text" NAME="fieldList[${s.index}].url" value="${o.url}"></td></tr>
<tr><td>显示顺序</td><td><INPUT TYPE="text" NAME="fieldList[${s.index}].order" value="${o.order}"></td></tr>
<tr><td>是否启用</td><td><INPUT TYPE="radio" <c:if test='${o.status == 1}'> checked</c:if>  NAME="fieldList[${s.index}].status" value="1">启用&nbsp;&nbsp;<INPUT TYPE="radio" <c:if test='${o.status == 2}'> checked</c:if> NAME="fieldList[${s.index}].status" value="2">禁用</td></tr>
<tr><td>是否推荐</td><td><INPUT TYPE="radio" <c:if test='${o.hot == 1}'> checked</c:if>  NAME="fieldList[${s.index}].hot" value="1">正常&nbsp;&nbsp;<INPUT TYPE="radio" <c:if test='${o.hot == 2}'> checked</c:if> NAME="fieldList[${s.index}].hot" value="2">推荐</td></tr>
<tr><td colspan="2"><input class="del" type="button" value="删除"></td></tr></table>
  </c:forEach>
  
  
  </div>
  
  
  
  
  
  
  <p>
  <input type="hidden" name="recordId" value="${record.recordId}" />
   <input type="hidden" name="parentId" value="${record.parentId}" />
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>