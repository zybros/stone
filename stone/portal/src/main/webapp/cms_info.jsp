<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>金老虎商城-信息</title>
<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
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



	<!-- cms开始 -->

	<c:import charEncoding="utf-8" url="${cmsHtmlServer}${param.id}_content.html"/>
<%-- 	<c:import url="cms_info01.jsp"/> --%>
	
	<!-- cms结束 -->


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