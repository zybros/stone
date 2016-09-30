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
	
	
	//店铺开通申请
	$("#apply").click(function(){
		$("#content_frame").attr("src","shop/shopApply.jsp");
	});
	//店铺信息
	$("#info").click(function(){
		$("#content_frame").attr("src","shop/shop_get.do?shopId=${user.shopId}&view=shop/shop_info");
	});
	//新建商品
	$("#addProduct").click(function(){
		$("#content_frame").attr("src","shop/productAdd.jsp");
	});
	//商品列表
	$("#listProduct").click(function(){
		$("#content_frame").attr("src","sho/product_list.do");
	});
	//团购的商品
	$("#listTuan").click(function(){
		$("#content_frame").attr("src","shop/tuan_list.do");
	});
	//删除的团购
	$("#deletedTuan").click(function(){
		$("#content_frame").attr("src","shop/tuan_del_list.do");
	});
	
	
	//内容页面加载后初始化iframe高度
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


<div class="leftList">
<div class="title" data-tpa="MYYHD_PC_MYYHD_INDEX_A_PERSONAL">
<i class="iconMy"></i>
<strong>卖家中心<a href="${memberDomain}/shop/user_index.do"><font color="#FF8D00">【切换】</font></a></strong>

<a href="#"><span class="email_icon"><i>4</i></span></a>

</div>


<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_TRADING"><h4 class="subtitle"><a onclick="addTrackPositionToCookie('2','Myyhd_New_Left_Menu_Transaction')" href="javascript:void(0);">

<i class="iconDian"></i><span>店铺管理</span><i class="iconArrow"></i></a></h4>

<div class="tradeCenter">
<c:if test="${shopId==0}">
<ul class="liTab clearfix"><li><a id="apply" href="javascript:void();">开通店铺</a></li></ul>
</c:if>
<ul class="liTab clearfix"><li><a id="info" href="javascript:void();">店铺信息</a></li></ul>
<ul class="liTab clearfix"><li><a href="javascript:void();">装饰店铺</a></li></ul>
<ul class="hideLiTab liTab clearfix"><li><a href="javascript:void();">我的赠品</a></li></ul>
<ul class="hideLiTab liTab clearfix"><li><a href="javascript:void();">我的彩票</a></li></ul></div>


</div>

<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_ASSETS"><h4 class="subtitle">

<a href="javascript:void(0);"><i class="iconDian"></i><span>商品管理</span></a></h4>
<div class="tradeCenter"><ul class="liTab clearfix"><li>
<a id="addProduct" href="javascript:void(0);">新建商品</a></li></ul>
<ul class="liTab clearfix"><li>
<a id="listProduct" href="javascript:void(0);">商品清单</a></li></ul>
</div></div>

<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_CONCERNED">
	<h4 class="subtitle">
	<a href="javascript:void(0);">
	<i class="iconDian"></i><span>促销管理</span></a>
	</h4>
	<div class="tradeCenter">
		<ul class="liTab clearfix"><li>
		<a id="listTuan" href="javascript:void(0);">团购</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a id="deletedTuan" href="javascript:void(0);">已删除的团购</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">抢购</a></li></ul>
	</div>
</div>
<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_CONCERNED">
	<h4 class="subtitle">
	<a href="javascript:void(0);">
	<i class="iconDian"></i><span>订单管理</span><i class="iconArrow"></i></a>
	</h4>
	<div class="tradeCenter">
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">订单报表</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">待发货</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a href="http://club.yhd.com/">代付款</a></li></ul>
	</div>
</div>
<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_CONCERNED">
	<h4 class="subtitle">
	<a href="javascript:void(0);">
	<i class="iconDian"></i><span>店铺会员管理</span><i class="iconArrow"></i></a>
	</h4>
	<div class="tradeCenter">
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">店铺会员</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">会员促销</a></li></ul>
	</div>
</div>

<div class="titleContent" data-tpa="MYYHD_PC_MYYHD_INDEX_A_CONCERNED">
	<h4 class="subtitle">
	<a href="javascript:void(0);">
	<i class="iconDian"></i><span>店铺会员管理</span><i class="iconArrow"></i></a>
	</h4>
	<div class="tradeCenter">
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">店铺会员</a></li></ul>
		<ul class="liTab clearfix"><li>
		<a href="javascript:void(0);">会员促销</a></li></ul>
	</div>
</div>


</div>
