<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<div id="right">
<p>
导航列表
</p>

<p>
<a href="adm/navi_record_list.do?parentId=0">首级</a>&nbsp;&nbsp;||&nbsp;&nbsp;
<a href="admin/nav/navigation_add.jsp?parentId=${parentId}">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>父级导航</td><td>导航名称</td><td>导航类型</td><td>显示顺序</td><td>是否启用</td><td>子级</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.recordId}
</td>
<td>
${o.parentId}
</td>
<td>
${o.fieldNamesStr}
</td>
<td>
<c:choose> 
<c:when test="${o.type==1}">   
纵向
  </c:when> 
  <c:otherwise>   
   横向
  </c:otherwise> 
</c:choose> 
</td>
<td>
${o.order}
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
<a href="adm/navi_record_list.do?parentId=${o.recordId}">进入</a>
</td>
<td>
<a href="adm/navi_record_find_edit.do?recordId=${o.recordId}">edit</a> || <a href="adm/navi_record_del.do?recordId=${o.recordId}&parentId=${o.parentId}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>