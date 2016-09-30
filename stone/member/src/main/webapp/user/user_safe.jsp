 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <base href="<%=basePath%>">

    <link href="resource/css/global_site_base.css" rel="stylesheet" type="text/css">
<link href="resource/css/usercenter.css" rel="stylesheet" type="text/css"><!--css end-->

</head>

<body id="comParamId" data-param="{&quot;globalPageCode&quot;:&quot;-1&quot;,&quot;currPageId&quot;:&quot;0&quot;}">

	<div id="container" class="clearfix">
		<div class="columnright">
			<div class="mod_personal_head">
		        <font class="tit">安全中心</font>
		        <div class="recpt_bor"></div>
		    </div>
		    
			
			<div class="safeCenter">
            <div class="userinfo safeuserinfo mt">
                <dl>
                    <dt>
                        <div class="clearfix">
                            <p>
                                <span id="endUserName">e8c9a953d37c8ecccce8f2d44b664ca5@tencent</span>
                            </p>
                            <ul class="list-h">
                                <li class="fl">您的安全评分为：<span class="safe_grade_bar grade_bars1"><s style="width:50%;"></s></span><span><strong>50</strong>分</span></li>
                            </ul>
                        </div>
                    </dt>
    
                </dl>
            <div class="advice">建议您启动全部安全设置，以保障账户及资金安全。</div>
            <div class="user_pic portrait"><input value="63560557" name="userId" type="hidden"><img src="resource/images/peopleicon_01.gif" height="80" width="80"></div>
            </div>
        </div>
        <ul class="safeCenterMody">
        	<li>
        		<span class="hookIcon"></span>
        		<span class="tit">密码修改</span>
        		<span>经常的更换您的账号密码，并且不要和其他账号共用同一个密码</span>
        		<span class="safeBtn"><a data-tpa="MYYHD_PC_SAFE_CHANGEPW" href="login.jsp" target="_self">修改密码</a></span>
        	</li>
        	<li>
        			<span class="warnIcon"></span>
        			<span class="tit">绑定邮箱</span>
        			<span>邮箱将是您的有效身份证，在保证安全的同时还可以提供更便捷的订单提醒服务</span>
        			<span class="safeBtn"><a data-tpa="MYYHD_PC_SAFE_BINDINGEMAIL" href="login.jsp" target="_self">立即绑定</a></span>
        			  <div style="display:block;position:absolute;top:55px;right:449px;line-height:normal;color:#FF8D00;font-size:12px;font-weight:bold;">绑定邮箱可获100积分</div>
        	</li>
            <li>
	            	<span class="hookIcon"></span>
		            <span class="tit">绑定手机</span>
		            <span>您绑定的手机：1302*****66</span>
		            <span class="safeBtn"><a data-tpa="MYYHD_PC_SAFE_CHANGEMOBILE" href="http://my.yhd.com/member/bind/changeBindMobile.do" target="_parent">修改手机</a></span>
            </li>
        </ul> 
		</div>
	</div>

</body>
 
 