<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章详情</title>
<style type="text/css">
.from{
	float:left;width:200; margin:20;border:1px solid red;
	
}
.keywords{
	float:left;width:200;margin:20;border:1px solid green;
}
.status{
	float:left;width:200;margin:20;border:1px solid blue;
}

.msg{
	height:50;text-align:center; width:800;border:1px solid black;
}
.content{
	width:800;border:1px solid yellow;
}
</style>
<script type="text/javascript"src="js/template.js"></script>
<script>
$(document).ready( function() {
	$("#back").click(function(){
		window.history.back();
	});	
});
</script>
</head>
<body>
<center>
		<div id="right">
<h3>${content.title}</h3>
<div class="msg">
<div class="from">来源：${content.from}</div>
<div class="keywords">关键字：${content.keywords}</div>
<div class="status">
是否显示：<c:choose> 
  <c:when test="${content.status==1}">   
  显示
  </c:when> 
  <c:otherwise>   
    隐藏
  </c:otherwise> 
</c:choose>
</div>     
</div> 
<br/>
 <div class="content">${content.content}</div>
  <p>
	<INPUT id="back" TYPE="button" value="返回">
	</p>
 </div>
</center>
</body>
</html>