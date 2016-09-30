<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/tuan.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"src="resource/js/template.js"></script>

 <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
 <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
 
<script>
$(document).ready( function() {
	var fileCount = 0;
	
	$("#proBtn").click(function(){
		$("#proDiv").show();
		loadCtgItems(0);
	});
	
	var loadCtgItems = function(pid){
		$.get("sho/product_list_ajax.do", null, function (items){
			renderCtgItems(items);
		});
	}
	
	var renderCtgItems = function(items){
// 		 	var html = '<table border=1><td><input type="checkbox" id="checked_all"/></td><td>标题</td><td>价格</td><td>分类</td>';
			var html = '<table border=1><td></td><td>标题</td><td>价格</td><td>分类</td>';
			for(i in items){
// 				html += '<tr><td><input name="id" type="checkbox" id="'+items[i].id+'"/></td><td>'+items[i].title+'</td><td>'+items[i].price+'</td><td>'+items[i].cid+'</td></tr>';
				html += '<tr><td><input name="id" type="radio" id="'+items[i].id+'" title="'+items[i].title+'"/></td><td>'+items[i].title+'</td><td>'+items[i].price+'</td><td>'+items[i].cid+'</td></tr>';
			
			}
			$("#proDivItems").html(html);
	}
	
	var renderTmps = function(items){
	 	var html = "<table border='1' width='500'>";
		for(i in items){
			html += "<tr><td width=30%>"+items[i].name + "</td><td>"+$().createTypeElement(items[i].id,items[i].type,items[i].options)+"</td></tr>";
		}
		html += "</table>";
		$("#tmps").html(html);
	}
	
	$("#proDivSubmit").live('click', function(){
		$("input[name=id]:checked").each(function(){
			var id = $(this).attr("id");
			var title = $(this).attr("title");
			$("#proName").text(title);
			$("#productId").val(id);
			$("#proDiv").hide();
		});
	});
	
	$("#proDivCancel").click(function(){
		$("#proDiv").hide();
	});
	
	$("#checked_all").live('click', function(){
		var checked = $(this).attr("checked");
		if(checked){
			$("input[name=id]").each(function(){
				$(this).attr("checked",true);
			});
		}else{
			$("input[name=id]").each(function(){
				$(this).attr("checked",false);
			});
		}
		
	});
	
	$("#add").click(function(){
		$("#myform").submit();
	});
	
	$(".delFile").live('click', function() {
		var id = $(this).attr("id");
		$("#tr" + id).remove();
	});

	$("#addFile").click(function() {
		var s = '<tr id="tr'+fileCount+'"><td><input  name="files" type="file"/></td><td><input id="'+fileCount+'" type="button" value="删除"  class="delFile"/></td></tr>';
		$("#uploadTable").append(s);
		fileCount++;
	});
	
	
	var initOptions = function(ctgArr,line){
		var html = '';
		for(i in ctgArr){
    		var ctg = ctgArr[i];
    		html += '<option value="'+ctg.id+'">'+line+ctg.name+'</option>';
    		if(ctg.sublist.length>0){
    			html += initOptions(ctg.sublist,line+"--");
    		}
    	}
		return html;
	}
	
	
	var initRegionSelected =  function(navArr) {
    	
    	var html = '';
    	
    	html+=initOptions(navArr,"");
    	
        $("#ctg").html(html);
    }
    
    var ctgArr = ${ctgArr};
    initRegionSelected(ctgArr);

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
团购添加
</p>

<div id="proDiv">
	<h2>选择参与团购的商品</h2>
	<div id="proDivItems"></div>
	<div id="proBtnDiv">
	<input id='proDivSubmit' type="button" value="确定"/>
	<input id='proDivCancel' type="button" value="取消"/>
	</div>
</div>

<FORM id="myform" METHOD="POST" enctype="multipart/form-data" ACTION="shop/tuan_add.do">
  <table border="1" width="500">
   <tr>
  	<td>所属栏目</td>
  	<td>
  		<select id=ctg name="categoryId"></select>
  	</td>
  </tr>
   <tr>
  	<td width=30%>商品</td>
  	<td>
  		<span id="proName"></span>
  	   <INPUT id="proBtn" TYPE="button" value="选择">
  	
  	</td>
  </tr>
  <tr>
  	<td>标题</td>
  	<td><INPUT TYPE="text" NAME="title" value=""></td>
  </tr>
   <tr>
  	<td>原价格</td>
  	<td><INPUT TYPE="text" NAME="price" value=""></td>
  </tr>
  <tr>
  	<td>折扣</td>
  	<td><INPUT TYPE="text" NAME="discount" value=""><span>(0-100直接的整数)</span></td>
  </tr>
  <tr>
  	<td>团购价格</td>
  	<td><INPUT TYPE="text" NAME="discountPrice" value=""></td>
  </tr>
   <tr>
  	<td>开始时间</td>
  	<td><INPUT TYPE="text" NAME="startTime" value=""></td>
  </tr><tr>
  	<td>结束时间</td>
  	<td><INPUT TYPE="text" NAME="endTime" value=""></td>
  </tr>
  <tr>
  	<td>是否推荐</td>
  	<td><INPUT TYPE="radio" NAME="recommend" checked="checked" value="0">否 &nbsp;&nbsp;<INPUT TYPE="radio" NAME="recommend" value="1">是</td>
  </tr>
   <tr>
  	<td>团购描述</td>
  	<td><INPUT TYPE="text" NAME="text.description" value=""></td>
  </tr><tr>
  	<td>团购详情</td>
  	<td>
  		<textarea name="text.detail" id="editor" style="width:800px;height:290px;"></textarea>
  	</td>
  </tr>
  </table>
  <table id="uploadTable" border="1" width="500">
	<tr>
		<td><input type="file" name="files"></td>
		<td><input type="button" id="addFile" value="添加"></td>
	</tr>
</table>
  <div id="tmps">
  </div>
  <p>
	<INPUT id="add" TYPE="button" value="提交">
	</p>
 <br>
 <input type="hidden" name="status" value="0"/>
 <input type="hidden" name="saleNum" value="0"/>
 <input id="productId" type="hidden" name="productId"/>
 </FORM>
 </div>
</center>
</body>
</html>