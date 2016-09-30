<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章</title>
<script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"> </script>
 <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript"src="js/template.js"></script>
<script>
$(document).ready( function() {
	
	var initOptions = function(ctgArr,line,categoryId){
		var html = '';
		for(i in ctgArr){
    		var ctg = ctgArr[i];
    		if(ctg.id==categoryId){
    			html += '<option selected="selected" value="'+ctg.id+'">'+line+ctg.name+'</option>';
    		}else{
    			html += '<option value="'+ctg.id+'">'+line+ctg.name+'</option>';
    		}
    		if(ctg.sublist.length>0){
    			html += initOptions(ctg.sublist,line+"--",categoryId);
    		}
    	}
		return html;
	}
	
	
	
	
    var initRegionSelected =  function(navArr,categoryId) {
    	
    	var html = '';
    	
    	html+=initOptions(navArr,"",categoryId);
    	
        $("#ctg").html(html);
    }
    
    var ctgArr = ${ctgArr};
    var categoryId = ${content.categoryId};
    initRegionSelected(ctgArr,categoryId);
    
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
修改文章
</p>

<FORM METHOD=POST ACTION="adm/cms_content_update.do">
  <table border="1">
  <tr>
  	<td>所属栏目</td>
  	<td>
  		<select id=ctg name="categoryId"></select>
  	</td>
  </tr>
   <tr>
  	<td>标题</td>
  	<td><INPUT TYPE="text" NAME="title" value="${content.title}"></td>
  </tr>
  <tr>
  	<td>关键字</td>
  	<td><INPUT TYPE="text" NAME="keywords" value="${content.keywords}"></td>
  </tr>
   <tr>
  	<td>来源</td>
  	<td><INPUT TYPE="text" NAME="from" value="${content.from}"></td>
  </tr>
   <tr>
  	<td>是否显示</td>
  	<td>
	<c:choose> 
  <c:when test="${content.status==1}">   
  <INPUT TYPE="radio" checked="checked"  NAME="status" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" NAME="status" value="2">隐藏
  </c:when> 
  <c:otherwise>   
    <INPUT TYPE="radio" NAME="status" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" checked="checked"  NAME="status" value="2">隐藏
  </c:otherwise> 
</c:choose> 
  </tr>
   <tr>
  	<td>正文</td>
  	<td><textarea name="content" id="editor" style="width:900px;height:300px;">${content.content}</textarea></td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="id" value="${content.id}"/>
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>