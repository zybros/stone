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
新增品牌
</p>

<FORM METHOD=POST ACTION="admin/brand_add.do" enctype="multipart/form-data">
  <table border="1">
  <tr>
  	<td>名称</td>
  	<td><INPUT TYPE="text" NAME="name" value=""></td>
  </tr>
   <tr>
  	<td>描述</td>
  	<td><INPUT TYPE="text" NAME="desc" value=""></td>
  </tr>
  <tr>
  	<td>图片</td>
  	<td>
  		<input type="file" name="imgObj">
  	</td>
  </tr>
  <tr>
  	<td>是否显示</td>
  	<td>
  	<INPUT TYPE="radio" checked="checked"  NAME="status" value="1">显示&nbsp;&nbsp;<INPUT TYPE="radio" NAME="status" value="2">隐藏
  	</td>
  </tr>
   <tr>
  	<td>品牌網址</td>
  	<td><INPUT TYPE="text" NAME="website" value=""></td>
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