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
文章列表
</p>

<p>
<a href="adm/cms_ctg_pre_add4content.do?parentId=0">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>所属栏目</td><td>标题</td><td>关键字</td><td>来源</td><td>是否显示</td><td>发布人</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
<a href="adm/cms_content_get.do?id=${o.id}">${o.id}</a>
</td>
<td>
${o.categoryId}
</td>
<td>
${o.title}
</td>
<td>
${o.keywords}
</td>
<td>
${o.from}
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
${o.adminId}
</td>
<td>
<a href="adm/cms_content_find_edit.do?id=${o.id}">edit</a> || <a href="adm/cms_content_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>