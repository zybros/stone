<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#content{
	left:75px; position: relative;
	width:1000px;text-align: center;
	border:1px solid #ccc;
	
 	padding-left: 200; 
}

#content div{
	position: relative;
	border:1px solid #ccc;
}

.title{
	width:800px;text-align: center;
	border:1px solid #ccc;
	
	margin-top:50px;
	margin-bottom:20px;
}
.from{position: relative;
	float:left;width:200; margin:20;
	
}
.keywords{
	float:left;width:200;margin:20;
}
.status{
	float:left;width:200;margin:20;
}

.msg{
	height:50;text-align:center; width:800;border:1px solid black;
}
.content{
	width:800;border:1px solid yellow;
}

.btn{
	text-align: center;
	border:1px solid #ccc;
	width:800;
	margin-top:50px;
	margin-bottom:50px;
}
</style>
<script>
$(document).ready( function() {
	$("#back").click(function(){
		window.history.back();
	});	
});
</script>
<div id="content">
<div class="title"><h3>${content.title}</h3></div>
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
  <div class="btn">
	<INPUT id="back" TYPE="button" value="返回">
	</div>
	<br style="clear:both;" /> 
 </div>
 
