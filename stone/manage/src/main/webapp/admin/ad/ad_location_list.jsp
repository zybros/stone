<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resource/css/tree.css" type="text/css">
<link rel="stylesheet" href="resource/css/ad_loca_add.css" type="text/css">
	<link rel="stylesheet" href="resource/css/zTreeStyle.css" type="text/css">
	<style type="text/css">
		table{
			border:1px;
		}
	
	</style>
	<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="resource/js/jquery.ztree.core-3.5.min.js"></script>

	<SCRIPT type="text/javascript">
$(document).ready(function(){
	var setting = {	
		callback: {
	        onClick: treeNodeClick
	    }
	};
 
	function treeNodeClick(event, id, node, clickFlag) {
// 		alert(node.id);
	   window.location.href="admin/ad_loca_list.do?parentId="+node.id;
	}

	var zNodes =${tree};
	$.fn.zTree.init($("#tree"), setting, zNodes);
	
	var treeObj = $.fn.zTree.getZTreeObj("tree");
	var node = treeObj.getNodeByParam("id", "${parentId}");
	treeObj.selectNode(node,true);
	
});
	</SCRIPT>
</head>
<body>
<div id="content">
<h3>广告位列表</h3>
	<div id="left">
	<div class="content_wrap">
		父级栏位
		<div class="zTreeDemoBackground left">
			<ul id="tree" class="ztree"></ul>
		</div>
	</div>
	</div>
	<div id="right">

<p>
<a href="ad_loca_tree_4_add.do?parentId=${parentId}&page=/admin/ad/ad_location_add">添加</a>
</p>
<table border=1; width="900">
<tr><td>id</td><td>位置名称</td><td>位置描述</td><td>edit || del</td><td>广告明细</td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
<a href="admin/ad_loca_get.do?locationId=${o.locationId}">${o.locationId}</a>
</td>
<td>
${o.locationName}
</td>
<td>
${o.locationDescriptions}
</td>
<td>
<a href="admin/ad_loca_get4edit.do?locationId=${o.locationId}">edit</a> || <a href="admin/ad_loca_del.do?locationId=${o.locationId}&parentId=${o.parentId}">del</a>
</td>
<td>
<a href="admin/ad_listByLocation.do?locationId=${o.locationId}">广告</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</body>
</html>