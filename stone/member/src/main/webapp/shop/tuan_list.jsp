<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"src="resource/js/tuan.js"></script>
</head>
<body>
<center>

<div id="right">
<p>
团购列表
</p>

<p>
<a href="shop/tuan_ctg_list4tuan_add.do">添加</a>
</p>
<table border=1; style="width:90%;table-layout:fixed;">
<tr><td>id</td><td>标题</td><td>价格</td><td>折扣</td><td>销售数量</td><td>开始时间</td><td>结束时间</td><td>状态</td><td>edit || del</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
${o.id}
</td>
<td>
${o.title}
</td>
<td>
${o.price}
</td>
<td>
${o.discount}
</td>
<td>
${o.saleNum}
</td>
<td>
${o.startTime}
</td>
<td>
${o.endTime}
</td>
<td>
<script type="text/javascript">
		document.write($().getStatus("${o.status}"));
</script>
</td>
<td>
<a href="shop/tuan_4_edit.do?id=${o.id}">edit</a> || <a href="shop/tuan_del.do?id=${o.id}">del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</center>
</body>
</html>