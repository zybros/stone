<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/template.js"></script>
<script>
$(document).ready( function() {
	
	var init = function(){
		var isDefault = "${addr.isDefault}";
		if(isDefault==1){
			$("#defaultY").attr("checked","checked");
		}else{
			$("#defaultN").attr("checked","checked");
		}
	}
	
	init();
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
修改广告商家
</p>

<FORM METHOD=POST ACTION="admin/ad_owner_update.do">
   <table border="1">
  <tr>
  	<td>联系人</td>
  	<td><INPUT TYPE="text" NAME="linkMan" value="${ao.linkMan}"></td>
  </tr>
   <tr>
  	<td>联系人电话</td>
  	<td><INPUT TYPE="text" NAME="phone" value="${ao.phone}"></td>
  </tr>
  <tr>
  	<td>联系邮箱</td>
  	<td><INPUT TYPE="text" NAME="email" value="${ao.email}"></td>
  </tr>
  <tr>
  	<td>机构、个人</td>
  	<td>
  <c:choose> 
  <c:when test="${ao.type==1}">   
   <INPUT TYPE="radio" checked="checked"  NAME="type" value="1">机构&nbsp;&nbsp;<INPUT TYPE="radio" NAME="type" value="2">个人
  </c:when> 
  <c:otherwise>   
    <INPUT TYPE="radio" NAME="type" value="1">机构&nbsp;&nbsp;<INPUT TYPE="radio" checked="checked"  NAME="type" value="2">个人
  </c:otherwise> 
</c:choose> 
  	</td>
  </tr>
  <tr>
  	<td>地址</td>
  	<td><INPUT TYPE="text" NAME="address" value="${ao.address}"></td>
  </tr>
  <tr>
  	<td>公司名称</td>
  	<td><INPUT TYPE="text" NAME="companyName" value="${ao.companyName}"></td>
  </tr>
   <tr>
  	<td>公司站点</td>
  	<td><INPUT TYPE="text" NAME="companySite" value="${ao.companySite}"></td>
  </tr>
   <tr>
  	<td>公司电话</td>
  	<td><INPUT TYPE="text" NAME="officePhone" value="${ao.officePhone}"></td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="id" value="${ao.id}" />
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>