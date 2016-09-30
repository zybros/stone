<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="../common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <link type="text/css" rel="stylesheet" href="resource/css/cart_002.css">
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



	<!-- 注册成功开始 -->
	
	<div style="text-align:center;padding:80px;">
	<h2>注册成功</h2><br>
	<p>账号 : ${user.phone}</p><br>
	<p>密码 : ${user.password}</p><br>
	<p><a href="user/index.do"><font color="blue">个人信息</font></a></p>
	</div>
	
	<!-- 注册成功结束 -->


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