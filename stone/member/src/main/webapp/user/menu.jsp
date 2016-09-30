<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <base href="<%=basePath%>">
  <link rel="stylesheet" href="resource/css/global-min.css">
<link rel="stylesheet" href="resource/css/order_list.css">
<script type="text/javascript" src="resource/js/iframe.js"></script>
<script type="text/javascript">
$().ready(function(){
	
	
	$("#safe").click(function(){
		$("#content_frame").attr("src","user/user_safe.jsp");
	});
	
	$("#addr").click(function(){
		$("#content_frame").attr("src","use/user_addr_list.do");
	});
	
	
	
	$("#myorder").click(function(){
		$("#content_frame").attr("src","user/order_list.do");
	});

	$("#content_frame").on("load", function() {
		new Iframe().startInit('content_frame',850);
	});
	
});

</script>


<link href="resource/css/global_site_base.css" rel="stylesheet" type="text/css" />

<link href="resource/css/orderList2013.css" rel="stylesheet" type="text/css" />

<style type="text/css">.layout_w980_g33,.layout_w980_g18{width:990px; margin:0 auto; zoom:1; text-align:left; margin-top:10px;}.layout_w1200_g22{width:1210px; margin:0 auto; zoom:1; text-align:left; margin-top:10px;}.layout_w980_g33:after,.layout_w980_g18:after,.layout_w1200_g22:after{ clear:both; display:block; content:''; height:0; visibility:hidden;}.layout_w980_g18 .grid_4{float:left;width:205px; _width:205px; margin:0 5px 10px 5px;}.layout_w980_g18 .grid_14{float:left;width:765px; _width:760px; margin:0 5px 10px 5px; }.layout_w1200_g22 .grid_4{float:left;width:205px; _width:205px; margin:0 5px 10px 5px;}.layout_w1200_g22 .grid_18{float:left;width:985px; _width:980px; margin:0 5px 10px 5px;}</style><link href="resource/css/global_yhdLib.css" type="text/css" rel="stylesheet">

<style type="text/css">


.leftList {background-color:#fcfcff;overflow: hidden;float: left;width: 210px;border: 1px solid #e7e7e7;left: 70px;position: relative;}

.leftList .title { width:100%; height:55px; background:#fff; border-bottom:1px solid #fd6d37; position:relative;}

.leftList .title .iconMy {width: 15px;height: 15px;display: block;position: absolute;left: 22px;top: 22px; _line-height: 0;_font-size: 0;background: url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_24.png) no-repeat 0 0;_background: url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_8.png) no-repeat 0 0;}

.leftList .title strong {position: absolute;left: 47px;top: 19px;font-size: 14px;font-family: 'microsoft yahei';}.leftList .hoverDown strong a {color: #999;}.leftList .email_icon { position:relative; width:15px; height:11px; background:url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_24.png) no-repeat -257px -2px; position:absolute; right:20px; top:26px;}.leftList .title .email_icon i { position:absolute; top:-10px; right:-18px; background:#ff3c3c; border:#f22323 1px solid; width:22px; height:13px; line-height:15px; text-align:center;  border-radius:10px; color:#fff;}.leftList .on { background-color: #fd6d37;}.leftList .on .email_icon { background:url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_24.png) no-repeat -275px -2px; width:15px; height:11px;}.leftList .on .iconMy {background: url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_24.png) no-repeat -20px 0;_background: url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_8.png) no-repeat -20px 0;}.leftList .on strong a {color: #ffffff;}.leftList .titleContent {width: 100%;}.leftList .subtitle {width: 100%;height: 35px;line-height: 35px;position: relative;}.leftList .subtitle:hover .iconArrow {-webkit-transform: rotate(360deg);-moz-transform: rotate(360deg);-o-transform: rotate(360deg);transform: rotate(360deg);}.leftList .subtitle span {position: absolute;left: 46px;}.leftList .subtitle a {color: #666;width: 100%;height: 100%;display: block;}.leftList .subtitle .iconDian {_line-height: 0;_font-size: 0;width: 4px;height: 4px;background-color: #fd6d37;display: block;position: absolute;left: 23px;top: 15px;}.leftList .subtitle .iconArrow {width: 9px;height: 5px;display: block;position: absolute;-webkit-transition: .2s ease;-moz-transition: .2s ease;-o-transition: .2s ease;transition: .2s ease;_line-height: 0;_font-size: 0; background: url(http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_24.png) no-repeat -74px -4px;http://image.yihaodianimg.com/member/member/images/menu/icon_myyhd_index_8.png) no-repeat -74px -4px;right: 35px;top: 15px;-webkit-transition: .5s ease;-moz-transition: .5s ease;-o-transition: .5s ease;transition: .5s ease;}.leftList .subtitle .iconArrowR {-webkit-transform: rotate(180deg);-webkit-transition: .5s ease;-moz-transform: rotate(180deg);-moz-transition: .5s ease;-o-transform: rotate(180deg);-o-transition: .5s ease;transform: rotate(180deg);transition: .5s ease;}.leftList .tradeCenter {width: 100%;}.leftList .tradeCenter .liTab li {width: 100%;height: 28px;line-height: 28px;}.leftList .tradeCenter .liTab li a {overflow: hidden;white-space: nowrap;display: block;width: 147px;padding-left: 47px;height: 28px;line-height: 28px;color: #999;}.leftList .tradeCenter .liTab li a:hover {background-color: #fd6d37;color: white;}.leftList .tradeCenter .hideLiTab {display: none;}.leftList .tradeCenter .liTab li .selected {background-color: #fd6d37;color: white;}.leftList .tradeCenter .liTab li a span {display:inline-block; width:29px; height:12px; background:url(http://image.yihaodianimg.com/member/member/images/myyhdIndexNew/icon_progress.png) no-repeat 0 -67px; _ background:url(http://image.yihaodianimg.com/member/member/images/myyhdIndexNew/icon_progress_24.png) no-repeat 0 -67px; margin-left:5px; margin-top:5px;}</style>


<div class="leftList"><div class="title" data-tpa="MYYHD_PC_MYYHD_INDEX_A_PERSONAL">
<i class="iconMy"></i>
<c:choose>
	<c:when test="${user.type==2}">
		<strong>买家中心<a href="${memberDomain}/user/index.do"><font color="#FF8D00">【切换】</font></a></strong>
	</c:when>
	<c:otherwise>
		<strong>买家中心</strong>
	</c:otherwise>
</c:choose>
<a href="#"><span class="email_icon"><i>4</i></span></a></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_TRADING"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction')" href="javascript:void(0);"><i class="iconDian"></i><span>我的交易(6)</span><i class="iconArrow"></i></a></h4><div class="tradeCenter"><ul class="liTab clearfix"><li><a id="myorder" href="javascript:void();">我的订单</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Transaction_Common" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction_Common')" href="http://e.yhd.com/front-pe/pelist/view.do">评论商品</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Transaction_OldForNew" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction_OldForNew')" href="http://my.yhd.com/oldfornew/recoveryBill.do">以旧换新</a></li></ul><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Transaction_Try" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction_Try')" href="http://try.yhd.com/member/trialCenter/myTrail.do">我的试用品</a></li></ul><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Transaction_Present" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction_Present')" href="http://my.yhd.com/member/presents.do">我的赠品</a></li></ul><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Transaction_CaiPiao" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction_CaiPiao')" href="http://life.yhd.com/lottery/displayMyLottery.do">我的彩票</a></li></ul></div></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_ASSETS"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount')" href="javascript:void(0);"><i class="iconDian"></i><span>我的资产(5)</span></a></h4><div class="tradeCenter"><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_TotalAccount_Point" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount_Point')" href="http://my.yhd.com/points/displayPointAccount.do">我的积分</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_TotalAccount_Coupon" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount_Coupon')" href="http://coupon.yhd.com/myCoupon/">我的抵用券</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_TotalAccount_Card" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount_Card')" href="http://b2beam.yhd.com/gift-cards/displayGiftCardAddMoney.do">我的礼品卡</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_TotalAccount_Jr" target="_blank" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount_Jr')" href="https://8.yhd.com/cfweb/home.action">1金融</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_TotalAccount_Zhye" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_TotalAccount_Zhye')" href="http://my.yhd.com/account/displayAccount.do">账户余额</a></li></ul></div></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_CONCERNED"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Attention')" href="javascript:void(0);"><i class="iconDian"></i><span>我的关注(3)</span></a></h4><div class="tradeCenter"><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Attention_Product" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Attention_Product')" href="http://my.yhd.com/member/myNewCollection/myFavorite.do?operType=0">商品收藏</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Attention_Store" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Attention_Store')" href="http://my.yhd.com/member/myNewCollection/myFavorite.do?operType=1">店铺收藏</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Attention_Shequ" target="_blank" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Attention_Shequ')" href="http://club.yhd.com/">1号社区</a></li></ul></div></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_MEMBER"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Member')" href="javascript:void(0);"><i class="iconDian"></i><span>会员资料(7)</span><i class="iconArrow"></i></a></h4><div class="tradeCenter"><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Member_Ziliao" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Member_Ziliao')" href="http://my.yhd.com/member/userinfo/editinfo.do">个人资料</a></li></ul>
<ul class="liTab clearfix">
<li><a id='addr' href="javascript:void();">地址管理</a></li>
</ul>
<ul class="liTab clearfix">
<li>
<a id='safe' href="javascript:void();">安全设置</a>
</li>
</ul>
<ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_VipLottery" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_VipLottery')" href="http://vip.yhd.com/myLottery/myLottery.do?">我的活动</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Member_Badge" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Member_Badge')" href="http://vip.yhd.com/badge.html">店铺会员卡<span></span></a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Member_Vip" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Member_Vip')" href="http://vip.yhd.com/card/myVip.do">我的联名卡</a></li></ul><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_Member_FastPay" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Member_FastPay')" href="http://my.yhd.com/member/convenient/convenientPay.do">快捷支付管理</a></li></ul></div></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_ONLINE"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_OnLineHelp')" href="javascript:void(0);"><i class="iconDian"></i><span>在线客服(4)</span><i class="iconArrow"></i></a></h4><div class="tradeCenter"><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_OnLineHelp_Opinion" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_OnLineHelp_Opinion')" href="http://help.yhd.com/opinion/opinionList.do">在线投诉</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_OnLineHelp_Return" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_OnLineHelp_Return')" href="http://yas.yhd.com/return/returnApplyList.do">在线退换货</a></li></ul><ul class="liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_OnLineHelp_Invoice" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_OnLineHelp_Invoice')" href="http://my.yhd.com/invoice/invoiceApply.do">发票中心</a></li></ul><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_Menu_OnLineHelp_Message" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_OnLineHelp_Message')" href="http://edm.yhd.com/pcMsg/myMessage.action?tp=2046.0.0.0.0.KhmOTkU-11-Cxpcd">我的消息</a></li></ul></div></div><div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_COMPANY"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_B2B')" href="javascript:void(0);"><i class="iconDian"></i><span>企业用户(1)</span><i class="iconArrow"></i></a></h4><div class="tradeCenter"><ul class="hideLiTab liTab clearfix"><li><a selectid="Myyhd_New_Left_B2B_UpdateToB2BUser" onclick="addTrackPositionToCookie('2','Myyhd_New_Left_B2B_UpdateToB2BUser')" href="http://b2beam.yhd.com/b2b/upGradeToB2b.do">升级为企业账户</a></li></ul></div></div></div>
