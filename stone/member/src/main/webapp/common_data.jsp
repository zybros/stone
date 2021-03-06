<%@ page language="java" import="com.stone.base.system.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="resource/css/global.css">
<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>

<% request.setAttribute("portalDomain", Domain.portal); %> 
<% request.setAttribute("itemDomain", Domain.item); %> 
<% request.setAttribute("userDomain", Domain.user); %>
<% request.setAttribute("memberDomain", Domain.member); %>
<% request.setAttribute("manageDomain", Domain.manage); %>

<% request.setAttribute("itemImgServer", FilePath.itemImgServer.toString()); %> 

