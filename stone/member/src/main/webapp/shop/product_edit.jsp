<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<%@page import="com.stone.base.system.*"%>                
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="resource/js/template.js"></script>
<script>
$(document).ready( function() {
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
			var imgUrl = "<%=FilePath.itemImgServer%>"+imgArr[i];
			html += '<tr id="tr'+fileCount+'"><td width=30%><img width="100" onclick="javascript: location.href=" height="80" src="'+imgUrl+ '"/></td><td>'+
			'<input id="'+fileCount+'" type="button" value="删除"  class="delFile"/><input type="hidden" name="imgList" value="'+imgArr[i]+'"/></td></tr>';
			fileCount++;
		}
		$("#uploadTable").append(html);
	}
	renderImgs("${product.imgs}");
	
	
	var initBrand = function(categoryId,brandId){
		$.get("brand_listByCtgId4ajax.do?ctgId="+ categoryId,null,function(items) {
			var html = "<option>--请选择--</option>";
			for(var i in items){
				if(items[i].id==brandId){
					html += '<option selected="true" value="'+items[i].id+'">'+items[i].name+'</option>';
				}else{
					html += '<option value="'+items[i].id+'">'+items[i].name+'</option>';
				}
			}
			$("#brandId").html(html);
		});
	}

	initBrand("${product.cid}","${product.brandId}");
});
</script>
</head>
<body>
<center>


<div id="right">
<p>
商品编辑
</p>


<FORM id="myform" METHOD=POST ACTION="sho/product_update.do" enctype="multipart/form-data">
  <table border='1'>
<tr>
	<td>品牌</td>
	<td>
		<select id="brandId" NAME="brandId">
			<option>--请选择--</option>
		</select>
	</td>
</tr>
  <tr>
  	<td width=30%>名称</td>
  	<td><INPUT TYPE="text" NAME="title" value="${product.title}"></td>
  </tr>
   <tr>
  	<td>编码</td>
  	<td><INPUT TYPE="text" NAME="no" value="${product.no}"></td>
  </tr>
   <tr>
  	<td>价格</td>
  	<td><INPUT TYPE="text" NAME="price" value="${product.price}"></td>
  </tr>
  </table>
<table id="uploadTable" border="1" width="500">
	<tr>
		<td><input style="display:none;" type="file" name="files">商品图片</td>
		<td><input type="hidden" name="imgList" value=""/>
		<input type="button" id="addFile" value="添加"></td>
	</tr>
</table>
  <p>
	<INPUT id="update" TYPE="submit" value="更新">
	</p>
 <br>
  <input type="hidden" name="shopId" value="${product.shopId}"/>
  <input type="hidden" name="id" value="${product.id}"/>
  <input type="hidden" name="cid" value="${product.cid}"/>
 </FORM>
 </div>
</center>
</body>
</html>