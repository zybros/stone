<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="resource/js/template.js"></script>
<script type="text/javascript"src="resource/js/tuan.js"></script>
 <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
 <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script>
$(document).ready( function() {
	var status = "${tuan.status}";
	$("#statusSpan").initializeStatus(status);
	
	var fileCount = 0;
	$("#addFile").click(function() {
				var s = '<tr id="tr'+fileCount+'"><td><input  name="files" type="file"/></td><td><input id="'+fileCount+'" type="button" value="删除"  class="delFile"/></td></tr>';
				$("#uploadTable").append(s);
				fileCount++;
	});
	$(".delFile").live('click', function() {
		var id = $(this).attr("id");
		$("#tr" + id).remove();
	});
	
	//渲染商品图片
	var renderImgs = function(imgs){
		if(imgs.length==0)return;
		var imgArr = imgs.split(";");
	 	var html = '';
		for(i in imgArr){
			var imgUrl = "<%=FilePath.tuanImgServer%>"+imgArr[i];
			html += '<tr id="tr'+fileCount+'"><td width=30%><img width="100" onclick="javascript: location.href=" height="80" src="'+imgUrl+ '"/></td><td>'+
			'<input id="'+fileCount+'" type="button" value="删除"  class="delFile"/><input type="hidden" name="imgList" value="'+imgArr[i]+'"/></td></tr>';
			fileCount++;
		}
		$("#uploadTable").append(html);
	}
	renderImgs("${tuan.images}");
	
	
	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
});
</script>
</head>
<body>
<center>

<div id="right">
<p>
团购编辑
</p>


<FORM id="myForm" METHOD=POST ACTION="shop/tuan_edit.do" enctype="multipart/form-data">
 <table border="1" width="500">
  <tr>
  	<td>标题</td>
  	<td><INPUT TYPE="text" NAME="title" value="${tuan.title}"></td>
  </tr>
   <tr>
  	<td>原价格</td>
  	<td><INPUT TYPE="text" NAME="price" value="${tuan.price}"></td>
  </tr>
  <tr>
  	<td>折扣</td>
  	<td><INPUT TYPE="text" NAME="discount" value="${tuan.discount}"><span>(0-100直接的整数)</span></td>
  </tr>
  <tr>
  	<td>团购价格</td>
  	<td><INPUT TYPE="text" NAME="discountPrice" value="${tuan.discountPrice}"></td>
  </tr>
   <tr>
  	<td>开始时间</td>
  	<td><INPUT TYPE="text" NAME="startTime" value="${tuan.startTime}"></td>
  </tr><tr>
  	<td>结束时间</td>
  	<td><INPUT TYPE="text" NAME="endTime" value="${tuan.endTime}"></td>
  </tr>
  <tr>
  	<td>是否推荐</td>
  	<td>
  	<c:choose>
  		<c:when test="${tuan.recommend==1}">
  			<INPUT TYPE="radio" NAME="recommend" value="0">否 &nbsp;&nbsp;<INPUT TYPE="radio" checked="checked" NAME="recommend" value="1">是
  		</c:when>
  		<c:otherwise>
  			<INPUT TYPE="radio" checked="checked" NAME="recommend" value="0">否 &nbsp;&nbsp;<INPUT TYPE="radio" NAME="recommend" value="1">是
  		</c:otherwise>
  	</c:choose>
  	</td>
  </tr>
  <tr>
  	<td>状态</td>
  	<td><span id="statusSpan"></span></td>
  </tr>
   <tr>
  	<td>团购描述</td>
  	<td><INPUT TYPE="text" NAME="text.description" value="${tuan.text.description}"></td>
  </tr><tr>
  	<td>团购详情</td>
  	<td>
  	<textarea name="text.detail" id="editor" style="width:800px;height:300px;">${tuan.text.detail}</textarea>
  	</td>
  </tr>
  </table>
  <table id="uploadTable" border="1" width="500">
	<tr>
		<td><input style="display:none;" type="file" name="files">商品图片</td>
		<td><input type="hidden" name="imgList" value=""/>
		<input type="button" id="addFile" value="添加"></td>
	</tr>
</table>
  <div id="tmps">
  </div>
  <p>
	<INPUT id="update" TYPE="submit" value="更新">
	</p>
 <br>
  <input type="hidden" name="id" value="${tuan.id}"/>
  <input type="hidden" name="categoryId" value="${tuan.categoryId}"/>
  <input type="hidden" name="productId" value="${tuan.productId}"/>
 </FORM>
 </div>
</center>
</body>
</html>