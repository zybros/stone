<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>金老虎商城-列表</title>
<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="resource/js/cart_pop.js"></script>
<script type="text/javascript">
	$(function() {
		
		

	});
</script>
</head>

<body>
	<c:url value="${portalDomain}/top.jsp" var="topUrl" />
	<c:import url="${topUrl}"/>

	<!-- 搜索区域开始 -->

	<c:url value="${portalDomain}/search_shop.jsp" var="searchUrl" />
	<c:import url="${searchUrl}"/>

	<!-- 搜索区域结束 -->


	<!-- 商品详情开始 -->


	<jsp:include page="item.do"/>

	<jsp:include page="cart_pop.jsp"/>
	
	<!-- 商品详情结束 -->


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