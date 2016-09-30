<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- 1楼左边开始 -->
		<div class="mainleft">

			<ul>
				<c:forEach var="item" varStatus="s" items="${adList}">
				
					<li><a href="${item.adUrl}">${item.adName}</a></li>
					
				</c:forEach>
					

				<li><a href="">家庭影院</a></li>

				<li><a href="">酒柜冷柜</a></li>

				<li><a href="">汽车用品</a></li>

			</ul>

			<div class="lefttu">

				<img data-url='${adImgServer}e13.jpg' src="${adImgServer}pix.png" alt="" />

			</div>

		</div>

		<!-- 1楼左边结束 -->



