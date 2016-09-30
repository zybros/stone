<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="mainleft">

		<div class="lunbo">

		   <ul class="pic">
				<c:forEach var="item" varStatus="s" items="${adList}">
					<c:choose>
						<c:when test="${s.index==0}">
							<li style="display:block"><a href="${item.adUrl}" target="_blank"><img width="779" height="400" src="${adImgServer}${item.adImg}" alt="${item.adName}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${item.adUrl}" target="_blank"><img width="779" height="400" src="${adImgServer}${item.adImg}" alt="${item.adName}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		   </ul> 

		   <ul class="nav">
				<c:forEach var="item" varStatus="s" items="${adList}">
					<c:choose>
						<c:when test="${s.count==1}">
							<li class="on">1</li>
						</c:when>
						<c:otherwise>
							<li>${s.count}</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		    </ul>

		</div>

<!-- 		<div class="liulan"> -->

<!-- 			<div class="liuleft"> -->

<!-- 				<div class="lefttu"></div> -->

<!-- 			</div> -->

<!-- 			<div class="liucenter"> -->

<!-- 				<ul> -->

<%-- 					<li><a href=""><img src="${adImgServer}c1.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c2.jpg" alt="" /></a></li> --%>

<%-- 					<li style="border-right:none"><a href=""><img src="${adImgServer}c3.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c4.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c5.jpg" alt="" /></a></li> --%>

<%-- 					<li style="border-right:none"><a href=""><img src="${adImgServer}c6.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c7.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c8.jpg" alt="" /></a></li> --%>

<%-- 					<li style="border-right:none"><a href=""><img src="${adImgServer}c9.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c10.jpg" alt="" /></a></li> --%>

<%-- 					<li><a href=""><img src="${adImgServer}c11.jpg" alt="" /></a></li> --%>

<%-- 					<li style="border-right:none"><a href=""><img src="${adImgServer}c12.jpg" alt="" /></a></li> --%>

<!-- 				</ul> -->

<!-- 			</div> -->

<!-- 			<div class="liuright"> -->

<!-- 				<div class="righttu"></div> -->

<!-- 			</div> -->

<!-- 		</div> -->

	</div>
