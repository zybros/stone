<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=utf8">
        <base href="<%=basePath%>">
        <title>登录- 金老虎商城</title>      
        <link href="resource/css/login.css" rel="stylesheet" type="text/css">     
        <script src="resource/js/jquery-1.7.2.min.js" type="text/javascript"></script>    
        <script type="text/javascript">
	$(document).ready(function() {
		$("#reloadVerifyCode").click(function(){
			$("#submitCode").attr("src", "<%=request.getContextPath()%>/getVerifyCodeImage.do?t="+Math.random()); 
		});
		$("#login-toggle").click(function(){
			$("#J_login_mobile").toggle();
			$("#J_login_common").toggle();
		});
		
		
		$("#J_loginBtn").click(function(){
// 			var login_num = $("#J_loginUser").val();
// 			alert(login_num);

// 			var emailRegex = /^\w[\w\$\^\(\)\[\]\{\}\.\-\+,]{0,100}@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,6}$/;
// 			var phoneRegex = /^(13|15|18|14|17)[0-9]{9}$/;
			
// 			if (emailRegex.test(login_num)) {
// 				$("#login_num").attr('name','email');
// 				$("#login_num_type").val(2);
// 			}else if(phoneRegex.test(login_num)){
// 				$("#login_num").attr('name','phone');
// 				$("#login_num_type").val(1);
// 			}else{
// 				$("#login_num").attr('name','username');
// 				$("#login_num_type").val(3);
// 			}
// 			$("#login_num").val(login_num);
			
			$("#J_loginForm").submit();
			
		});
		
		
		
		
		
	});
</script> 
    </head>

    <body class="login-index">
        <div class="wrapper">
            <div class="header clearfix">
            <!-- register-bar add by hanjw 2014-6-24-->
            <div class="register-bar"><a href="register.jsp">立即注册</a>还没有金老虎商城账号？</div>
            <!-- //register-bar add by hanjw 2014-6-24-->
                    <div class="logo"> 
                <!-- modify by hanjw 2014-6-24 -->
                <a title="ZOL商城" href="//jinlh.com/portal"><img title="金老虎商城" alt="金老虎商城" src="resource/images/logo.png"><p>金老虎科技网上商城</p></a>
                <!-- modify by hanjw 2014-6-24 --> </div>
            </div>
            
            <form id="J_loginForm" action="login_redirect4shiro.do" method='post'>
            <div class="login-wrap clearfix">
                <div class="ad-div">
                    <div>                        
                        <a href="http://www.jinlh.com/" target="_blank"><img src="resource/images/ad.jpg" alt="" height="350" width="520"></a>                        
                    </div>
                </div>
                <div class="login-layer">
                    <div class="login-head">                        
                        <a href="javascript:void(0)" class="otherLogin-bar mobileLogin-bar" id="login-toggle">手机动态码登录</a>                                
                        <h3>登录金老虎商城</h3>                        
                    </div>
                    <div class="login-content" id="J_login_common">
                        <div class="login-wrong-tips" id="J_login-wrong-tips" style="display:none;">-</div>
                        <div class="form-item username">
                            <input name='username' autocomplete="off" placeholder="手机号/邮箱/用户名" class="text" id="J_loginUser" maxlength="100" type="text">
                            <i class="remove" style="display:none;"></i>
                            <ul style="display:none;" class="account-list" id="J_accountList">                                
                            </ul>
                        </div>
                        <div class="form-item">                            
                            <input name="password" autocomplete="off" placeholder="密码" class="text" id="J_loginPsw" maxlength="20" type="password">
                            <i class="remove" style="display:none;"></i> <span class="case-tips" id="J_loginCapsLock">大小写锁定已打开<i class="ico"></i></span> </div>
                            
                            <div class="form-item-yzm">                            
                            <input name="submitCode" placeholder="验证码" class="yzm" maxlength="4" type="text">
                            </div>
                             <div style="padding-top: 5px;">                            
                            <img id="submitCode" src="<%=request.getContextPath()%>/getVerifyCodeImage.do" style="float:left;"/>
							<a href="javascript:void();" id="reloadVerifyCode">看不清</a>
                            </div>
                            
                            
                            
                            
                            
                        <div class="form-other"> 
                            <label class="autologon"><!--<input type="checkbox" name="" value="">记住登录状态--></label>
                            <a target="_blank" href="http://my.zol.com.cn/index.php?c=getPassword">忘记密码？</a></div>
                        <input value="1" name="J_login_type" id="J_login_type" type="hidden">
                        <input value="登 录" class="login-layer-btn" id="J_loginBtn" type="button">
                        <font color="red">${msg}</font>
                        <span style="display:none;" class="submit-loading" id="J_loginingBtn">正在登录...</span> 
                        
                        <input type="hidden" name="url" value="${url}"/>
						<input type="hidden" name="type" value="1"/>
						<input type="hidden" name="" value="" id="login_num"/>
						<input type="hidden" name="login_num_type" value="" id="login_num_type"/>
                    </div>

                    <div class="login-content mobileLogin-content" id="J_login_mobile" style="display:none;">                        
                        <div class="login-wrong-tips" id="J_login-mobile-wrong-tips" style="display:none;">-</div>
                        <!-- add by hanjw 2014-6-24 -->
                        <div class="form-item ">                            
                            <input autocomplete="off" placeholder="手机号" class="text" id="J_login_mobile_number" name="J_login_mobile_number" type="text">
                        </div>
                        <div class="form-item phone-number">                            
                            <input autocomplete="off" placeholder="短信验证码" class="text" id="J_login_mobile_code" name="J_login_mobile_code" type="text">
                            <input name="J_login_send_button" value="发送验证码" class="btn" id="J_login_send_button" type="button">
                            <span class="captcha-loading" id="J_login_send_wait" style="display: none">100秒后重新获取</span>                            
                        </div>                        
                        <!-- //add by hanjw 2014-6-24 -->                        
                        <input value="登 录" class="login-layer-btn" id="J_loginBtn_mobile" type="submit">
                        <span style="display:none;" class="submit-loading" id="J_loginingBtn_mobie">正在登录...</span> 
                    </div>             
                    
                    <div class="login-foot clearfix"><span>合作账号登录：</span>
                        <a target="_blank" class="sina" href="http://service.zol.com.cn/user/api/sina/jump.php?comeshop=1&amp;backurl=http%3A%2F%2Fwww.zol.com%2F">用微博账号登录</a>
                        <a target="_blank" class="qq" href="http://service.zol.com.cn/user/api/qq/libs/oauth/redirect_to_login.php?comeshop=1&amp;backurl=http%3A%2F%2Fwww.zol.com%2F">用QQ账号登录</a>
                        <a target="_blank" class="alipay" href="http://tuan.zol.com/userBinding/alipay/alipay.auth.authorize_php_gb/alipay_auth_authorize.php?fromUrl=http%3A%2F%2Fwww.zol.com%2F">用支付宝账号登录</a>
                        <a target="_blank" class="baidu" href="http://service.zol.com.cn/user/api/baidu/jump.php?comeshop=1&amp;backurl=http%3A%2F%2Fwww.zol.com%2F">用百度账号</a>
                    </div>
                </div>
            </div>
            </form>    
            
            
        </div>   
        
        <div class="footer">
    <div class="wrapper clearfix">
        <div class="about"><a href="http://help.zol.com/index.php?c=Detail&amp;id=675" target="_blank">关于金老虎商城</a>|<a href="http://help.zol.com/index.php?c=Detail&amp;id=674" target="_blank">联系我们</a>|<a href="http://help.zol.com/" target="_blank">帮助中心</a></div>
        <div class="copyright">&#169;<script type="text/javascript">var yearStr;
            now = new Date();
            yearStr = now.getFullYear();
            document.write(yearStr);</script>20162016. 金老虎科技 版权所有</div>
    </div>
</div>
</body></html> 