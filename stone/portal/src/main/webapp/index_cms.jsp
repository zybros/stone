<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="mainright">

		<div class="baotu">

			<a href=""><img src="${adImgServer}b30.jpg" alt="" width="200" height="80"/></a>

		</div>

		<div class="kuaibao">

			<span>金老虎快报</span>

			<a href="">更多快报></a>

		</div>

		<div class="baomain">

			<ul>

				<c:forEach var="item" varStatus="s" items="${cmsList}">
<%-- 					<li><a target="_blank" href="cms_content_item.do?id=${item.id}&page=/cms_info">${item.title}</a></li> --%>
<%-- 					<li><a target="_blank" href="${cmsHtmlServer}${item.id}_content.html">${item.title}</a></li> --%>
					<li><a target="_blank" href="cms_info.jsp?id=${item.id}">${item.title}</a></li>
				</c:forEach>

			</ul>

		</div>

	</div>

