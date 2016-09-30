<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
		<div id="right">
<p>
新增广告
</p>

<FORM METHOD=POST ACTION="admin/ad_add.do" enctype="multipart/form-data">
  <table border="1">
  <tr>
  	<td>名称</td>
  	<td><INPUT TYPE="text" NAME="adName" value=""></td>
  </tr>
   <tr>
  	<td>描述</td>
  	<td><INPUT TYPE="text" NAME="adDescription" value=""></td>
  </tr>
  <tr>
  	<td>显示类型</td>
  	<td>
  	<INPUT TYPE="radio" checked="checked"  NAME="adType" value="1">图片&nbsp;&nbsp;<INPUT TYPE="radio" NAME="adType" value="2">文字
  	</td>
  </tr>
  <tr>
  	<td>广告文字</td>
  	<td><INPUT TYPE="text" NAME="adWords" value=""></td>
  </tr>
  <tr>
  	<td>广告图片</td>
  	<td>
  		<input type="file" name="img">
  	</td>
  </tr>
  <tr>
  	<td>是否显示</td>
  	<td>
  	<INPUT TYPE="radio" checked="checked"  NAME="adStatus" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" NAME="adStatus" value="2">隐藏
  	</td>
  </tr>
   <tr>
  	<td>广告链接</td>
  	<td><INPUT TYPE="text" NAME="adUrl" value=""></td>
  </tr>
   <tr>
  	<td>投放者</td>
  	<td><INPUT TYPE="text" NAME="ownerId" value=""></td>
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