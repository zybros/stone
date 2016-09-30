<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="../common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>订单确认</title>
   <link type="text/css" rel="stylesheet" href="resource/css/cart_002.css">
<link href="resource/css/order-confirm.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="resource/js/order-confirm.js"></script>
<script type="text/javascript">
	$(function() {
		
		

	});
</script>
</head>

<body>
	<c:url value="${portalDomain}/top.jsp" var="topUrl" />
	<c:import url="${topUrl}"/>

	<!-- 搜索区域开始 -->

	<c:url value="${portalDomain}/search.jsp" var="searchUrl" />
	<c:import url="${searchUrl}"/>

	<!-- 搜索区域结束 -->



	<!-- 导航条区域开始 -->

	<c:url value="${portalDomain}/navi_list.do" var="naviUrl" >
		<c:param name="parentId" value="0"/>
			<c:param name="nav" value="0"/>
	</c:url>
	
	<c:import url="${naviUrl}"/>
	
	<!-- 导航条区域结束 -->



	<!-- 订单详情确认开始 -->
<form id="orderForm" action="use/order_submit.do" method="POST">

	<jsp:include page="order_confirm_addrs.jsp"/>
	
	<jsp:include page="order_confirm_items.jsp"/>
</form>	
	<!-- 订单详情确认结束 -->


	<!-- 网站详情开始 -->

	<c:url value="${portalDomain}/manual.jsp" var="manualUrl" />
	<c:import url="${manualUrl}"/>

	<!-- 网站详情结束 -->



	<!-- 底部开始 -->

	<c:url value="${portalDomain}/foot.jsp" var="footUrl" />
	<c:import url="${footUrl}"/>

	<!-- 底部结束 -->





</body>

</html>