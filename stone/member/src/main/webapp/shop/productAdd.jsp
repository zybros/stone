<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/template.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var maxValueOrder = 0;
						var fileCount = 0;

						$("#ctgBtn").click(function() {
							$("#ctgDiv").show();
							loadCtgItems(0);
						});

						var loadCtgItems = function(pid) {
							$.get("category/list.do?pid=" + pid, null,
									function(items) {
										renderCtgItems(items);
									});
						}

						var renderCtgItems = function(items) {
							var html = "";
							for (i in items) {
								// 				if(i%4==0){
								// 					html += "<br/>";
								// 				}
								html += "<div class='ctgItem' id='"+items[i].id+"' pid='"+items[i].pid+"'>"
										+ items[i].name + "</div>";
							}
							$("#ctgDivItems").html(html);
						}

						var renderTmps = function(items) {
							var html = "<table border='1' width='500'>";
							for (i in items) {
								html += "<tr><td width=30%>" + items[i].name
										+ "</td><td>"
										+ $().createFormatElement(items[i])
										+ "</td></tr>";
							}
							html += "</table>";
							$("#tmps").html(html);
						}

						$(".ctgItem").live('click',function() {
							var o = $(this);
							var pid = o.attr("id");
							$.get("category/list.do?pid="+ pid,null,function(items) {
								if (items.length > 0) {
									renderCtgItems(items);
								} else {
									$("#ctgName").text(o.text());
									$("#ctgId").val(pid);
									initBrand(pid);
								}
							});

						});

						$("#ctgDivBack").live('click',function() {$(".ctgItem").each(
															function() {
																var pid = $(
																		this)
																		.attr(
																				"pid");
																$
																		.get(
																				"category/listSibling.do?id="
																						+ pid,
																				null,
																				function(
																						items) {
																					if (items.length > 0) {
																						renderCtgItems(items);
																					}
																				});
																return false;
															});
										});


						$("#ctgDivCancel").click(function() {
							$("#ctgDiv").hide();
						});

						$(".delFile").live('click', function() {
							var id = $(this).attr("id");
							$("#tr" + id).remove();
						});

						$("#addFile")
								.click(
										function() {
											var s = '<tr id="tr'+fileCount+'"><td><input  name="files" type="file"/></td><td><input id="'+fileCount+'" type="button" value="删除"  class="delFile"/></td></tr>';
											$("#uploadTable").append(s);
											fileCount++;
										});

					});
	
				
					var initBrand = function(categoryId){
						$.get("brand_listByCtgId4ajax.do?ctgId="+ categoryId,null,function(items) {
							var html = "<option>--请选择--</option>";
							for(var i in items){
								html += '<option value="'+items[i].id+'">'+items[i].name+'</option>';
							}
							$("#brandId").html(html);
						});
					}
</script>
</head>
<body>
	<center>

		<div id="right">
			<p><b>商品基本属性</b>->商品扩展属性->商品规格属性</p>

			<div id="ctgDiv">
				<h2>选择商品分类</h2>
				<div id="ctgDivItems"></div>
				<div id="proBtnDiv">
					<input id='ctgDivBack' type="button" value="返回" /> <input
						id='ctgDivCancel' type="button" value="关闭" />
				</div>
			</div>

			<FORM id="myform" METHOD="POST" enctype="multipart/form-data"
				ACTION="sho/product/add.do">
				<table border="1" width="500">
					<tr>
						<td width=30%>类别</td>
						<td><span id="ctgName"></span> <INPUT id="ctgBtn"
							TYPE="button" value="选择"></td>
					</tr>
					
					<tr>
						<td>品牌</td>
						<td>
							<select id="brandId" NAME="brandId">
								<option>--请选择--</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>名称</td>
						<td><INPUT TYPE="text" NAME="title" value=""></td>
					</tr>
					<tr>
						<td>编号</td>
						<td><INPUT TYPE="text" NAME="no" value=""></td>
					</tr>
					<tr>
						<td>价格</td>
						<td><INPUT TYPE="text" NAME="price" value=""></td>
					</tr>
				</table>
				<table id="uploadTable" border="1" width="500">
					<tr>
						<td><input type="file" name="files"></td>
						<td><input type="button" id="addFile" value="添加"></td>
					</tr>
				</table>
				<p>
					<INPUT TYPE="submit" value="提交">
				</p>
				<br> <input type="hidden" name="status" value="0" /> <input
					type="hidden" name="shopId" value="0" /> <input id="ctgId"
					type="hidden" name="cid" value="0" />
			</FORM>
		</div>
	</center>
</body>
</html>