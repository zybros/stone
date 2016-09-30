<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resource/js/template.js"></script>
<table border='1'>
<c:forEach var="tpl" varStatus="s" items="${list[0]}">
	<tr>
		<td width=30%>${tpl.name}</td>
		<td>
			<c:forEach var="option" items="${tpl.optionList}">
				<c:set var="isChecked" value="false"/>
				<c:forEach var="val" items="${list[2][0].valList}">
					<c:if test="${tpl.id==val.templateId&&option==val.value}">
						<c:set var="isChecked" value="true"/>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${isChecked}">
						<input name="std${tpl.id}" type="radio" checked="checked" value="${option}"/>${option} 
					</c:when>
					<c:otherwise>
						<input name="std${tpl.id}" type="radio" value="${option}"/>${option} 
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
	</tr>
</c:forEach>
</table>
