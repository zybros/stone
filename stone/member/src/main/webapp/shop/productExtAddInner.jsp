<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resource/js/template.js"></script>
<table border='1' width='500'>
<c:forEach var="tpl" varStatus="s" items="${list}">
	<tr>
		<td width=30%>${tpl.name}</td>
		<td>
		<script type="text/javascript">
			document.write($().createFormatElement(${tpl}));
		</script>
		</td>
	</tr>
</c:forEach>
</table>
