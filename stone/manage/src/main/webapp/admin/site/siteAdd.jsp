<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="css/global.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<center>
<h3>添加网站</h3>
<FORM METHOD=POST ACTION="adm/site/add.do">
  <table border="1">
  <tr>
  	<td>网站名称</td>
  	<td><INPUT TYPE="text" NAME="name" value="" size="50"></td>
  </tr>
   <tr>
  	<td>网站链接</td>
  	<td><INPUT TYPE="text" NAME="url" value="" size="50"></td>
  </tr>
  </table>
  <p>
  	<INPUT type="hidden" name="cid" value="${param.cid}"/>
	<INPUT TYPE="submit" value="添加">
	</p>
 <br>
 </FORM>
 </center>
</body>
 
 