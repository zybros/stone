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
	
	var i = 0;
	
	 var appendField = function(i){
		 var fields = '<table class="field" border="1"><tr><td>导航名称</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].name" value=""></td></tr>'+
		   '<tr><td>导航链接</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].url" value=""></td></tr>'+
		   '<tr><td>显示顺序</td><td><INPUT TYPE="text" NAME="fieldList['+i+'].order" value=""></td></tr>'+
		  '<tr><td>是否启用</td><td><INPUT TYPE="radio" checked="checked"  NAME="fieldList['+i+'].status" value="1">启用&nbsp;&nbsp;<INPUT TYPE="radio" NAME="fieldList['+i+'].status" value="2">禁用</td></tr>'+
		  '<tr><td>是否推荐</td><td><INPUT TYPE="radio" checked="checked"  NAME="fieldList['+i+'].hot" value="1">正常&nbsp;&nbsp;<INPUT TYPE="radio" NAME="fieldList['+i+'].hot" value="2">推荐</td></tr>'+
		  '<tr><td colspan="2"><input class="del" type="button" value="删除"></td></tr></table>';
		  $("#fields").append(fields);
	 }
	  
	 appendField(i);
	 
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
新增导航
</p>

<FORM METHOD=POST ACTION="adm/navi_record_add.do">
<h3>导航基本属性</h3>
  <table border="1">
   <tr>
  	<td>导航类型</td>
  	<td><INPUT TYPE="radio" NAME="type" checked="checked" value="1">纵向&nbsp;&nbsp;<INPUT TYPE="radio" NAME="type" value="2">横向</td>
  </tr>
   <tr>
  	<td>显示顺序</td>
  	<td><INPUT TYPE="text" NAME="order" value=""></td>
  </tr>
  <tr>
  	<td>是否启用</td>
  	<td><INPUT TYPE="radio" checked="checked"  NAME="status" value="1">启用&nbsp;&nbsp;<INPUT TYPE="radio" NAME="status" value="2">禁用</td>
  </tr>
  </table>
  <h3>导航字段项</h3>
  <span><input id="add" type="button" value="添加"></span>
  <div id="fields">
  </div>
  <p>
   <input type="hidden" name="parentId" value="${param.parentId}" />
	<INPUT TYPE="submit" value="提交">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>