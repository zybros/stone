<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.stone.base.system.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>金老虎商城</title>
<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="resource/css/index.css">
	<script type="text/javascript"src="resource/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="resource/js/index_jsstyle.js"></script>
	<script type="text/javascript" src="resource/js/lazy_load.js"></script>

</head>

<body>

<jsp:include page="top.jsp"/>

<!-- 搜索区域开始 -->

<jsp:include page="search.jsp"/>	

<!-- 搜索区域结束 -->



<!-- 导航条区域开始 -->

<c:url value="navi_index.do?parentId=0" var="naviUrl"/>

<jsp:include page="${naviUrl}"/>

<!-- 导航条区域结束 -->



<!-- 轮播区及浏览区开始 -->
<div id="main">
<!-- banner -->
	
<c:url value="ad_listByLocation.do?locationId=1034&page=/index_banner" var="bannerUrl"/>
<jsp:include page="${bannerUrl}"/>
	
<!-- cms  -->

<c:url value="cms_content_list.do?categoryId=26&page=/index_cms" var="cmsUrl"/>
<jsp:include page="${cmsUrl}"/>

</div>


<!-- 轮播区及浏览区结束 -->



<!-- 特色区开始 -->

<c:url value="ad_listByLocation.do?locationId=1049&page=/index_feature" var="tsUrl"/>
<jsp:include page="${tsUrl}"/>

<!-- 特色区结束 -->

<!-- 楼层区开始 -->

<jsp:include page="index_floor.jsp"/>
<jsp:include page="index_floor2.jsp"/>


<!-- 楼层区结束 -->

<!-- hot热门区开始 -->

<jsp:include page="hot.jsp"/>

<!-- hot热门区结束 -->



<!-- 网站详情开始 -->

<jsp:include page="manual.jsp"/>

<!-- 网站详情结束 -->



<!-- 底部开始 -->

<jsp:include page="foot.jsp"/>

<!-- 底部结束 -->





</body>

</html>