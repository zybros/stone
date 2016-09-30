<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<%@page import="com.stone.base.system.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready( function() {
	
	$("#all").click(function(){
		
		var ck = $(this).attr("checked");
		if(ck=="checked"){
			$(".box").attr("checked",true);
		}else{
			$(".box").attr("checked",false);
		}
	});
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
类别下的品牌
</p>

<p>
<a href="admin/brand_list4link.do?ctgId=${ctgId}">添加</a>
</p>
<FORM METHOD=POST ACTION="admin/ctgBrand_del.do">
<table border=1; width="900">
<tr><td>id</td><td>名称</td><td>描述</td><td>图片</td><td>品牌網址</td><td>是否显示</td><td><input type="checkbox" id="all"/></td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.name}
</td>
<td>
${o.desc}
</td>
<td>
<img width="100" height="60" src="<%=FilePath.baseImgServer%>${o.img}">
</td>
<td>
${o.website}
</td>
<td>
<c:choose> 
<c:when test="${o.status==1}">   
  显示
  </c:when> 
  <c:otherwise>   
    隐藏
  </c:otherwise> 
</c:choose> 
</td>
<td>
<input name="brandIds" class="box" type="checkbox" value="${o.id}"/>
</td>
</tr>
</c:forEach>
</table>
<input type="hidden" value="${ctgId}" name="categoryId"/>
<p>
	<INPUT TYPE="submit" value="删除">
	</p>
	 </FORM>
</div>
</center>
</body>
</html>