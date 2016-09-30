<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="lifewindow">

	<div class="lifetu"></div>

	<div class="lifemain">

		<c:forEach var="item" varStatus="s" items="${adList}">
			<div class="tuarea1">
				<a href="${item.adUrl}" target="_blank">
				<img data-url='${adImgServer}${item.adImg}' src="${adImgServer}pix.png" alt="" />
				</a>
				<div class="zhe">
	
					<h3>${item.adName}</h3>
	
					<div class="life1"><a href="">${item.adWords}</a></div>
	
					<div class="life1"><a href="" style="color:#E4393C">${item.adWords}</a></div>
					<ul>
	
						<li><a href="">更多品牌</a></li>
	
						<li><a href="">进入品牌街</a></li>
	
					</ul>
	
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="lifetese">
		<div class="item"><img data-url='${adImgServer}e10.jpg' src="${adImgServer}pix.png" alt="" /></div>

		<div class="item"><img data-url='${adImgServer}e11.jpg' src="${adImgServer}pix.png" alt="" /></div>

		<div class="item"><img data-url='${adImgServer}e12.jpg' src="${adImgServer}pix.png" alt="" /></div>
	</div>

</div>

