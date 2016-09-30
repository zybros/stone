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
	   $("#parentId").val(node.id);
	}

	var zNodes =${tree};
	$.fn.zTree.init($("#tree"), setting, zNodes);
	
	var treeObj = $.fn.zTree.getZTreeObj("tree");
	var node = treeObj.getNodeByParam("id", "${al.parentId}");
	treeObj.selectNode(node,true);
	
});
	</SCRIPT>
</head>
<body>
<div id="content">
<h3>修改广告位</h3>
	<div id="left">
	<div class="content_wrap">
		父级栏位
		<div class="zTreeDemoBackground left">
			<ul id="tree" class="ztree"></ul>
		</div>
	</div>
	</div>
	<div id="right">
<FORM METHOD=POST ACTION="admin/ad_loca_update.do">
   <table border="1">
  <tr>
  	<td>位置名称</td>
  	<td><INPUT TYPE="text" NAME="locationName" value="${al.locationName}"></td>
  </tr>
   <tr>
  	<td>位置描述</td>
  	<td><INPUT TYPE="text" NAME="locationDescriptions" value="${al.locationDescriptions}"></td>
  </tr>
  <tr>
  	<td>宽度</td>
  	<td><INPUT TYPE="text" NAME="locationWidth" value="${al.locationWidth}"></td>
  </tr>
  <tr>
  	<td>高度</td>
  	<td><INPUT TYPE="text" NAME="locationHigh" value="${al.locationHigh}"></td>
  </tr>
  <tr>
  	<td>广告源码</td>
  	<td><INPUT TYPE="text" NAME="locationCode" value="${al.locationCode}"></td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="locationId" value="${al.locationId}" />
    <INPUT id="parentId" TYPE="hidden" NAME="parentId" value="${al.parentId}">
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
 </div>
</body>
</html>