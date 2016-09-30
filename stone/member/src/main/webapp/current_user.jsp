<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common_data.jsp" %>

        <script type="text/javascript">
	$(document).ready(function() {
		$.get("${memberDomain}/getCurrentUser.do?"+Math.random(), null, function (user){
			if(user.username==undefined){
				$('#login').show();
			}else{
				$('#username').text(user.username);
				$('#logined').show();
			}
		});
		
	});
</script> 


<b><span id='username'></span></b>
<span id="login" style="display:none;">
		您好，欢迎来到金老虎！
		<a href="${memberDomain}/login.jsp">[登陆]</a> &nbsp;<a href="${memberDomain}/register.jsp">[免费注册]</a>
</span>	
<span id="logined" style="display:none;">	
		您好，欢迎来到金老虎！
		<a href="${memberDomain}/user/logout.do">[登出]</a>
</span>
