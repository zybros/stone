<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="admin/head.jsp" %>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - Standard Data </TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="resource/css/tree.css" type="text/css">
	<link rel="stylesheet" href="resource/css/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="resource/js/jquery.ztree.core-3.5.min.js"></script>

	<SCRIPT type="text/javascript">
	
		<!--
		var setting = {	};

		var zNodes =${tree};

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>
</HEAD>

<BODY>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	
</div>
</BODY>
</HTML>
