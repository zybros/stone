<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready( function() {
	
	$("#all").click(function(){
		
		var ck = $(this).attr("checked");
		if(ck=="checked"){
			$(".box").attr("checked",true);
		}else{
			$(".box").attr("checked",false);
		}
	});
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
广告位下的广告
</p>

<p>
<a href="admin/ad_list4link.do?locationId=${locationId}">添加</a>
</p>
<FORM METHOD=POST ACTION="admin/adLocaLink_del.do">
<table border=1; width="900">
<tr><td>id</td><td>名称</td><td>描述</td><td>显示类型</td><td>广告文字</td><td>广告图片</td><td>是否显示</td><td>广告链接</td><td>广告商家</td><td><input type="checkbox" id="all"/></td></tr>
<c:forEach var="o" varStatus="s" items="${list}">
<tr>
<td>
<a href="admin/ad_get.do?id=${o.adId}">${o.adId}</a>
</td>
<td>
${o.adName}
</td>
<td>
${o.adDescription}
</td>
<td>
<c:choose> 
<c:when test="${o.adType==1}">   
图片
  </c:when> 
  <c:otherwise>   
文字
  </c:otherwise> 
</c:choose> 
</td>
<td>
${o.adWords}
</td>
<td>
${o.adImg}
</td>
<td>
<c:choose> 
<c:when test="${o.adStatus==1}">   
  显示
  </c:when> 
  <c:otherwise>   
    隐藏
  </c:otherwise> 
</c:choose> 
</td>
<td>
${o.adUrl}
</td>
<td>
${o.ownerId}
</td>
<td>
<input name="adIds" class="box" type="checkbox" value="${o.adId}"/>
</td>
</tr>
</c:forEach>
</table>
<input type="hidden" value="${locationId}" name="locationId"/>
<p>
	<INPUT TYPE="submit" value="删除">
	</p>
	 </FORM>
</div>
</center>
</body>
</html>