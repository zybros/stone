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
	
	var initOptions = function(navArr,line){
		var html = '';
		for(i in navArr){
    		var nav = navArr[i];
    		html += '<option value="'+nav.id+'">'+line+nav.name+'</option>';
    		if(nav.sublist.length>0){
    			html += initOptions(nav.sublist,line+"--");
    		}
    	}
		return html;
	}
	
	
	
	
    var initRegionSelected =  function(navArr) {
    	
    	var html = '<option value="0">根级导航</option>';
    	
    	html+=initOptions(navArr,"");
    	
        $("#pNavi").html(html);
    }
    
    var navArr = ${navArr};
    initRegionSelected(navArr);
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
新增广告商家
</p>

<FORM METHOD=POST ACTION="admin/ad_owner_add.do">
  <table border="1">
  <tr>
  	<td>联系人</td>
  	<td><INPUT TYPE="text" NAME="linkMan" value=""></td>
  </tr>
   <tr>
  	<td>联系人电话</td>
  	<td><INPUT TYPE="text" NAME="phone" value=""></td>
  </tr>
  <tr>
  	<td>联系邮箱</td>
  	<td><INPUT TYPE="text" NAME="email" value=""></td>
  </tr>
  <tr>
  	<td>机构、个人</td>
  	<td>
  	<INPUT TYPE="radio" checked="checked"  NAME="type" value="1">机构&nbsp;&nbsp;<INPUT TYPE="radio" NAME="type" value="2">个人
  	</td>
  </tr>
  <tr>
  	<td>地址</td>
  	<td><INPUT TYPE="text" NAME="address" value=""></td>
  </tr>
  <tr>
  	<td>公司名称</td>
  	<td><INPUT TYPE="text" NAME="companyName" value=""></td>
  </tr>
   <tr>
  	<td>公司站点</td>
  	<td><INPUT TYPE="text" NAME="companySite" value=""></td>
  </tr>
   <tr>
  	<td>公司电话</td>
  	<td><INPUT TYPE="text" NAME="officePhone" value=""></td>
  </tr>
  </table>
  <p>
	<INPUT TYPE="submit" value="添 加">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>