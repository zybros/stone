<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="../common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<!-- left 菜单区域开始 -->

	<jsp:include page="menu.jsp"/>

	<!--left 菜单区域结束 -->

	<!-- right 内容区开始 -->

	<iframe id='content_frame' src="shop/shop_get.do?shopId=${user.shopId}&view=shop/shop_info" style="border:none;left:50;position:relative;left:80;" width="970" height="850" scrolling="no"></iframe>
	
	<!-- right 内容区结束 -->


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