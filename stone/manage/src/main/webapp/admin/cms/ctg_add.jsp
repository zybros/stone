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
	
	var initOptions = function(ctgArr,line){
		var html = '';
		for(i in ctgArr){
    		var ctg = ctgArr[i];
    		html += '<option value="'+ctg.id+'">'+line+ctg.name+'</option>';
    		if(ctg.sublist.length>0){
    			html += initOptions(ctg.sublist,line+"--");
    		}
    	}
		return html;
	}
	
	
	
	
    var initRegionSelected =  function(navArr) {
    	
    	var html = '<option value="0">根级栏目</option>';
    	
    	html+=initOptions(navArr,"");
    	
        $("#pCtg").html(html);
    }
    
    var ctgArr = ${ctgArr};
    initRegionSelected(ctgArr);
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
新增栏目
</p>

<FORM METHOD=POST ACTION="adm/cms_ctg_add.do">
  <table border="1">
  <tr>
  	<td>父级栏目</td>
  	<td>
  		<select id="pCtg" name="parentId"></select>
  	</td>
  </tr>
  <tr>
  	<td>栏目名称</td>
  	<td><INPUT TYPE="text" NAME="name" value=""></td>
  </tr>
   <tr>
  	<td>栏目描述</td>
  	<td><INPUT TYPE="text" NAME="description" value=""></td>
  </tr>
   <tr>
  	<td>是否启用</td>
  	<td><INPUT TYPE="radio" checked="checked"  NAME="status" value="1">启用&nbsp;&nbsp;<INPUT TYPE="radio" NAME="status" value="2">禁用</td>
  </tr>
   <tr>
  	<td>显示顺序</td>
  	<td><INPUT TYPE="text" NAME="order" value=""></td>
  </tr>
  </table>
  <p>
	<INPUT TYPE="submit" value="添 加">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>