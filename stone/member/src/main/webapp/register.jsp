<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" />
<link href="resource/css/register.css" rel="stylesheet" type="text/css" />
<script src="resource/js/register.js" type="text/javascript"></script>
<script>
$().ready(function(){

	$("#phone_btn").click(function(){
		if(registerByPhoneSubmit()){
			$('#phoneForm').submit();
		}
	});
	
	$("#phone").blur(function(){
		var phone = $(this).val();
		var d = /^(13|15|18|14|17)[0-9]{9}$/;
		if (!d.test(phone)) {
			showPhoneError("格式错误，请输入正确的手机号码");
			return ;
		}
		$.get("register_check_phone.do", {"phone":phone}, function (m){
			if(m.status==0){
				$("#phone_tip").attr('style','color:green;');
			}else{
				$("#phone_tip").attr('style','color:red;');
			}
			$("#phone_tip").html(m.msg);
			$("#phone_tip").show();
			
		});
	});
		
		$("#phone").focus(function(){
			$("#phone_tip").html('');
			$("#phone_tip").hide();
				
		});
	
	
});

</script>
</head>

<body>
	<div class="wrap">
		<a href="http://jinlh.com" class="logo"><img
			src="resource/images/logo.png" alt="金老虎" height="55" /></a>
		<div class="regist_header_right clearfix">
			<div class="help_wrap">
				<a class="hd_menu"
					href="http://www.yhd.com/cms/view.do?topicId=18942"><s
					class="help_ico"></s>帮助中心</a>
				<div class="hd_menu_list">
					<ul>
						<li><a href="http://my.yhd.com/order/myOrder.do">包裹跟踪</a></li>
						<li><a href="http://www.yhd.com/cms/view.do?topicId=18991">常见问题</a></li>
						<li><a href="http://my.yhd.com/return/returnApplyList.do">在线退换货</a></li>
						<li><a href="http://my.yhd.com/opinion/opinionList.do">在线投诉</a></li>
						<li><a href="http://www.yhd.com/deliveryinfo/deliveryInfo.do">配送范围</a></li>
					</ul>
				</div>
			</div>
			<span class="fr">您好，欢迎光临金老虎！ <a href="login.jsp"
				class="blue_link">请登录</a></span>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		var no3wUrl="yhd.com";
		var currSiteId = 1;
		var URLPrefix = {"mymall":"http://my.1mall.com","passport_statics":"https://passport.yhd.com/front-passport/passport","yiwangauth":"http://mall.yiwang.cn","yaowang":"http://www.111.com.cn","tracker":"tracker.yhd.com","passport":"https://passport.yhd.com","my":"http://my.yhd.com","central":"http://www.yhd.com","validCodeShowUrl":"https://captcha.yhd.com/public/validcode.do","mall":"http://www.1mall.com","passportother":"https://passport.1mall.com"};
		var yhdUrl="http://www.yhd.com";
        var yhdPassportUrl="https://passport.yhd.com";
        var ywPassportUrl="https://passport.111.com.cn";
        var loli = window['loli'] || {};
        var valid_code_service_flag="1"; 
	</script>

	<div class="regist_wrap">
		<div class="mod_regist_wrap">
			<div class="regist_border clearfix">
				<div class="regist_left">
					<input name="activities" value="0" id="activities" type="hidden" />
					<input id="lockEmail" name="lockEmail" value="0" type="hidden" /> <input
						value="DmOBlwHFdJGYKJ1aMmqPL4qrhDTvasbmKcjMNLGRGuSh0zQ5"
						id="emailValidateSig" type="hidden"> <input
						id="validateSig" type="hidden"> <input name="returnUrl"
							value="" id="returnUrl" type="hidden" /> <input id="p" value=""
							type="hidden" />


							<div class="regist_tab">
								<ul class="clearfix">
									<li class="cur"><i class="r_mobile"></i><span>手机注册</span></li>
									<li><i class="r_mail"></i><span>邮箱注册</span></li>
								</ul>
								<p class="cur_tab">
									<em></em>
								</p>
							</div>
					<div class="regist_form mobile_register_form">

						<form id="phoneForm" method='post' action="register.do">
							<ul class="clearfix">
								<li class="">
									<div class="form_item">
										<label>手机号：</label> <input name='phone' class="ipt ipt_phone gay_text"
											value="请输入手机号码" id="phone" onkeyup="showPhoneTipWhenKeyUp();"
											onfocus="hideOtherTips('phone')" type="text">
									</div>
									<div class="tips_box regist_tips" id="phone_tip">
										<u></u> 请填写正确的手机号码，以便 接收订单通知，找回密码等。
									</div>
									<div class="tips_box regist_tips_error" id="phone_error"></div>
									<div class="tips_box username_ok" id="phone_desc"></div>
								</li>
								<li class="clearfix recv_mobile_code">
									<div class="code_wrap">
										<div class="mb_code_box">
											<div class="form_item">
												<label>验证码：</label> <input
													class="ipt ipt_phonecode gay_text" value="6位验证码"
													id="validPhoneCode"
													onkeydown="showoff('validPhoneCode_wrong');" maxlength="6"
													type="text"> <span class="code_right"
													id="validPhoneCode_right"></span> <span class="code_wrong"
													id="validPhoneCode_wrong" style="display: none"></span>
											</div>
											<a href="javascript:" tabindex="-1"
												class="receive_code reacquire_code">获取验证码</a>
											<div class="form_item form_item2">
												<input tabindex="-1" id="validCodeMobile"
													class="ipt gay_text ipt_code" value="验证码" maxlength="4"
													onblur="javascript: checkValidCodeOnBlurForMobileRegister()"
													onkeyup="javascript: checkRegisterParamForMobile();"
													onfocus="javascript: checkValidCodeOnFocusForMobileRegister()"
													type="text"> <span class="code_right"
													id="m_code_right" style="display: none"></span> <span
													class="code_wrong" id="m_code_wrong"></span>
											</div>
											<span class="check_code"> <img name="valid_code_pic">
													<i class="btn_change" tabindex="-1"
													onclick="refresh_valid_code();return false;">换一张</i></span>
										</div>
									</div>
									<div id="mobile_validcode_error" class="tips_box">
										<u></u>
										<p></p>
									</div>
									<div class="tips_box regist_tips">
										<u></u>如无法接收验证码，请重启手机并确认短信未被拦截！4G用户请关闭4G网络进行接收！
									</div>
								</li>

								<li>
									<div class="form_item">
										<label>设置密码：</label> <input class="ipt gay_text" name="pwd"
											value="6-20个大小写英文字母、符号或数字" type="text"> <input
											class="ipt password none" id="password_mobile"
											name="password" oncopy="return false;"
											oncut="return false;" onpaste="return false;"
											onblur="checkPasswordOnBlur('password_mobile');"
											onfocus="passwordOnFocus('password_mobile');"
											onkeyup="changePassStrong('password_mobile');"
											type="password">
									</div>
									<div class="tips_box regist_tips_error"
										id="password_mobile_error"></div>
									<div class="tips_box paswd_strength" id="password_mobile_Level">
										<i style="transform: rotate(0deg);" id="arrow_mobile"></i>
									</div>
								</li>
								<li>
									<div class="form_item">
										<label>确认密码：</label> <input class="ipt gay_text" name="pwd"
											value="请再次输入密码" type="text"> <input
											style="background-color: rgb(192, 193, 196);"
											readonly="readonly" class="ipt password none"
											id="password_mobile2" name="password2"
											onblur="checkPassword2OnBlur('password_mobile');"
											oncopy="return false;" oncut="return false;"
											onpaste="return false;"
											onfocus="hideOtherTips('password_mobile2')"
											onkeyup="showoff('password_mobile2_desc');showoff('password_mobile2_error')"
											type="password">
												<div class="tips_box regist_tips_error"
													id="password_mobile2_error"></div>
												<div class="tips_box username_ok" id="password_mobile2_desc"></div>
									</div>
								</li>
                        <li>
                        	<div class="form_item">
                            <INPUT TYPE="radio" NAME="type" value="1" checked="checked"/> 个人 
							<INPUT TYPE="radio" NAME="type" value="2" /> 店铺
							</div>
                        </li>

								<li class="service_agreement">点击注册，表示您同意金老虎 <a
									href="http://cms.yhd.com/cms/view.do?topicId=24110"
									class="blue_link" target="_blank">《服务协议》</a>
								</li>

								<li class="regist_btn">
									<button id="phone_btn" type="button">注册</button>
								</li>
							</ul>
						</form>
					</div>

					<div class="regist_form email_register_form none">
						<ul class="clearfix">
							<li>
								<div class="form_item">
									<label>邮箱：</label> <input class="ipt gay_text ipt_username"
										value="请输入邮箱地址" id="email" name="user.email"
										autocomplete="off" maxlength="100"
										onkeyup="showoff('email_desc');" onblur="checkEmailOnBlur();"
										onfocus="hideOtherTips('email')" ;="" type="text">
								</div>
								<div class="tips_box regist_tips" id="email_tip">
									<u></u> 请填写正确的常用邮箱地址，以便 接收订单通知，找回密码等。
								</div>
								<div class="tips_box regist_tips_error" id="email_error"></div>
								<div class="tips_box username_ok" id="email_desc"></div>
							</li>
							<li>
								<div class="form_item">
									<label>设置密码：</label> <input class="ipt gay_text" name="pwd"
										value="6-20个大小写英文字母、符号或数字" type="text"> <input
										class="ipt password none" id="password_email"
										name="user.password" oncopy="return false;"
										oncut="return false;" onpaste="return false;"
										onkeyup="changePassStrong('password_email');" type="password">
								</div>
								<div class="tips_box regist_tips_error"
									id="password_email_error"></div>
								<div class="tips_box paswd_strength" id="password_email_Level">
									<i style="transform: rotate(0deg);" id="arrow_email"></i>
								</div>
							</li>
							<li>
								<div class="form_item">
									<label>确认密码：</label> <input class="ipt gay_text" name="pwd"
										value="请再次输入密码" type="text"> <input
										style="background-color: rgb(192, 193, 196);"
										readonly="readonly" class="ipt password none"
										id="password_email2" name="password2"
										onblur="checkPassword2OnBlur('password_email');"
										oncopy="return false;" oncut="return false;"
										onpaste="return false;"
										onfocus="hideOtherTips('password_email2')"
										onkeyup="showoff('password_email2_desc');showoff('password_email2_error')"
										type="password">
											<div class="tips_box regist_tips_error"
												id="password_email2_error"></div>
											<div class="tips_box username_ok" id="password_email2_desc"></div>
								</div>
							</li>


							<li class="phone_num_wrap">
								<div class="form_item">
									<label>手机号：</label> <input class="ipt gay_text phone_num"
										value="请输入手机号" type="text">
								</div>
								<div class="tips_box regist_tips_error" id="ephoneDesc">
									<u></u>该手机号已存在，<a href="#" class="blue_link">登录</a>
								</div>
							</li>
							<li style="display: none;" class="verify_code cur_right img_code">
								<div class="form_item">
									<label>验证码：</label> <input id="validCodeEmail"
										class="ipt ipt_code gay_text" tabindex="1" type="text">
										<!--验证码正确--> <span class="code_right" tabindex="-1"
										style="display: none;"></span> <!--验证码错误--> <span
										class="code_wrong" tabindex="-1"></span>
								</div> <span class="verify_code_box" tabindex="-1"><img
									src="%E6%B3%A8%E5%86%8C1%E5%8F%B7%E5%BA%97_files/getjpg.jpg"
									name="valid_code_pic" tabindex="-1"></span> <i
								class="change_code" tabindex="-1">换一张</i>
							</li>
							<!--手机验证码 begin -->
							<li style="display: list-item;"
								class="verify_code phone_code clearfix">
								<div class="form_item">
									<label>验证码：</label> <input class="ipt ipt_code gay_text"
										tabindex="1" type="text"> <!--验证码正确--> <span
										class="code_right" tabindex="-1"></span> <!--验证码错误--> <span
										class="code_wrong" id="validPhoneCodewrong" tabindex="-1"></span>
								</div> <a href="javascript:%20void(0);"
								class="receive_code reacquire_code">获取验证码</a>
								<div id="emial_validcode_error" class="tips_box">
									<u></u>
									<p></p>
								</div>
								<div class="tips_box regist_tips">
									<u></u>如无法接收验证码，请重启手机并确认短信未被拦截！4G用户请关闭4G网络进行接收！
								</div>
							</li>

							<!--
	                    <li class="service_agreement">
	                        <a href="#" class="check_agreement">我已阅读并同意 《<a href="http://cms.yhd.com/cms/view.do?topicId=24110" class="blue_link" target="_blank">1号店服务协议</a>》</a>
	                        <div class="tips_box agreement_tips">
	                            <u></u><p></p>
	                        </div>
	                    </li>
	                    -->
							<li class="service_agreement">点击注册，表示您同意金老虎 <a
								href="http://cms.yhd.com/cms/view.do?topicId=24110"
								class="blue_link" target="_blank">《服务协议》</a>
							</li>
							<li class="regist_btn">
								<button id="email_btn" type="button"
									onclick="javascript:registerSubmit();return false;">注册</button>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script id="regist_popWin" type="text/viewscript">
<!--注册成功begin -->
<div class="regist_success regist_popWin" style="display: none;">
    <div class="regist_popWin_con">
        <!--title-->
        <div class="regist_popWin_title">
            <a href="javascript:void(0)" class="regist_popWin_closeBtn"></a>
        </div>
        <!--/title-->
        <!--con-->
        <div class="regist_popWin_Info clearfix">
            <div class="regist_popWin_main">
                <div class="regist_popWin_mainCon">
                    <p class="tit"><i></i>注册成功</p>
                </div>
            </div>
        </div>
        <!--/con-->
        <div class="popWin_tips">
            <span>3</span>s后跳转至首页
        </div>
    </div>
</div>
<!--注册成功end -->
</script>
	<div class="tips">
		错误信息<br />文字文字
	</div>


	<div id="simplefooter">
		<a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备13044278号</a>|<a>合字B1.B2-20130004</a>|<a
			href="http://d7.yihaodianimg.com/N01/M04/14/0D/CgQCr1KgLjGAM5w3AAQiJTyDkdw48000.jpg"
			data-ref="YHD_Footer_Licence" target="_blank">营业执照</a>
		<p>Copyright © 金老虎商城 2007-2014，All Rights Reserved</p>
	</div>
	<div>
		<span style="color: #FFFFFF"> 9!$ 32%&amp; 17#@ 10!$ , </span> <span
			style="color: #FFFFFF">1527500</span>
	</div>
	<script type="text/javascript">
var _path = "https://passport.yhd.com/front-passport/passport/css/";
var _imgPath = "https://passport.yhd.com/front-passport/passport/images/";
</script>

	<script type="text/javascript">
	var showValidCodeWhenRegistByMobile = 0; 
	var registerValidateUserBehaviorSwitcher = 1;
	var showValidCodeWhenRegistByEmail = 0; 	$(".email_register_form .img_code").hide();
	$(".phone_code").show();
	jsRegistFed.loadFunRegist();
	$(document).ready(function(){
		onload();
		loadImageUrl("2","Passport_Register_Ad_Click");
		bindEvent();
		refresh_valid_code(window, email_captcha_callback);
	});
</script>
	<div style="display: none; visibility: hidden;" id="__yct_container__">
		<script src="%E6%B3%A8%E5%86%8C1%E5%8F%B7%E5%BA%97_files/getenv.txt"></script>
	</div>
	<input
		value="dyBtQjlIECjswPKpdE3oVUOwFllQaVk%2FHkDhw7UEupxuX3J24Krye%2FbkB%2F5pjOCulu3JozDvUiShPkQGz0V2VlnC3X%2B3HIjCaeNMGz5Ey3rww0d%2BSSQh26j0YdE5ImxnPbvWTMI%2FcjzlPkupxG3Bccyad9zsdCdpxIh5MIrcOspJgsnA9N%2FNRdBClLx1%2F8W9UsuF63N6%2BcpDET%2Fz6CjYP8MVBsWNI3htRI%2BRC0vLW3c%3D"
		name="__yct_str__" id="__yct_str__" type="hidden">
</body>
</html>
