<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<div id="right">
<p>
区域编辑
</p>


<FORM METHOD=POST ACTION="adm/region/update.do">
  <table border="1">
  <tr>
  	<td>ID</td>
  	<td>${region.id}</td>
  </tr>
  <tr>
  	<td>名称</td>
  	<td><INPUT TYPE="text" NAME="prename" value="${region.prename}"></td>
  </tr>
  <tr>
  	<td>字母编码</td>
  	<td><INPUT TYPE="text" NAME="cname" value="${region.cname}"></td>
  </tr>
  <tr>
  	<td>区域编码</td>
  	<td><INPUT TYPE="text" NAME="areacode" value="${region.areacode}"></td>
  </tr>
  </table>
  <p>
	<INPUT TYPE="submit" value="确定">
	</p>
 <br>
  <input type="hidden" name="grade" value="${region.grade}"/>
  <input type="hidden" name="id" value="${region.id}"/>
 </FORM>
 </div>
</center>
</body>
</html>