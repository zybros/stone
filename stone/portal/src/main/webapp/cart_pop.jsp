<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.stone.base.system.Domain"%>
<%@ include file="common_data.jsp" %>

<link href="resource/css/global_site_base.css" rel="stylesheet" type="text/css">
<link href="resource/css/product_detail_c_page.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(function() {
		
		$("#cart_pop_mask").height(document.body.scrollHeight);
		
		var hideCartPopMask = function(){
			$("#cart_pop_mask").hide();
			$("#cart_pop").hide();
		}
		
// 		hideCartPopMask();
		
		var showCartPopMask = function(){
			$("#cart_pop_mask").show();
			$("#cart_pop").show();
		}
		
		$("#cart_pop_go_buy,#hd_colse_btn").click(function(){
			$("#cart_pop_mask").hide();
			$("#cart_pop").hide();
			
		}); 
		
	});
</script>


 <div id="cart_pop_mask" style="display:none; position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 100001; width: 100%; height: 100%; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.4;" class="mask_tcdiv"></div>
 
 
 <div id="cart_pop" style="display:none; left: 425.5px; top: 50%; bottom: auto; margin-top: -187.5px;" class="popGeneral"><div id="addCartPopWin" class="hd_cart_pop">
 
 <div class="hd_pop_content"><span id="hd_colse_btn" class="hd_colse_btn"></span><p class="hd_pop_tips"><i></i>已成功加入购物车</p><div class="hd_pop_btn">
 
 
 
 <a href='javascript:void();' id="cart_pop_go_buy" class="hd_btn_l" data-ref="product_popup_jxgw">继续购物</a><a href="${memberDomain}/user/cart_list.do" class="hd_btn_r" data-ref="product_popup">查看购物车</a></div><div class="hd_recommend_wrap"><p>更多商品推荐</p><div class="hd_recommend_list"><ul class="clearfix"><li><a href="http://item.yhd.com/item/56208293" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_1_null_48365696" class="hd_pop_img">
 
 
 
 <img src="${adImgServer}cart_pop_001_85x85.jpg"></a>
 <a href="http://item.yhd.com/item/56208293" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_1_null_48365696" class="hd_pop_name">口水娃 锅巴四口味妙脆角组合装500G休闲零食礼包香辣粗粮锅巴口水娃锅巴多口味可选</a><b class="hd_pop_price">¥64</b></li><li><a href="http://item.yhd.com/item/56910263" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_2_null_48991943" class="hd_pop_img">
 
 <img src="${adImgServer}cart_pop_001_85x85.jpg"></a>
 
 <a href="http://item.yhd.com/item/56910263" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_2_null_48991943" class="hd_pop_name">张君雅 台湾进口零食 张君雅小妹妹7口味15包超值组合装663g办公室休闲零食</a><b class="hd_pop_price">¥288</b></li><li><a href="http://item.yhd.com/item/56370772" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_3_null_48508609" class="hd_pop_img">
 
 <img src="${adImgServer}cart_pop_001_85x85.jpg"></a><a href="http://item.yhd.com/item/56370772" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_3_null_48508609" class="hd_pop_name">麦维尔 拉面丸子 鸡汁/串烧/香辣蟹/黑椒牛肉约20g*4袋休闲零食 干吃面捏碎面</a><b class="hd_pop_price">¥6</b></li><li><a href="http://item.yhd.com/item/56461554" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_4_null_48589476" class="hd_pop_img">
 
 
 
 
 <img src="${adImgServer}cart_pop_001_85x85.jpg"></a><a href="http://item.yhd.com/item/56461554" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_4_null_48589476" class="hd_pop_name">麦德好 黑糖优果10g*10支 迷你棒棒糖 休闲零食牛奶棒棒糖 果仁棒棒糖</a><b class="hd_pop_price">¥9.8</b></li><li><a href="http://item.yhd.com/item/56194885" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_5_null_48353752" class="hd_pop_img"><img src="1_files/CgQI0lYojoCAcTzxAAMDmvkQp_087400_85x85.jpg"></a><a href="http://item.yhd.com/item/56194885" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_5_null_48353752" class="hd_pop_name">口水娃 锅巴薯片五香味约86G/袋 膨化食品休闲零食品小吃经典炒货 上海特产</a><b class="hd_pop_price">¥2.38</b></li><li><a href="http://item.yhd.com/item/56829939" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_6_null_48919779" class="hd_pop_img"><img src="1_files/ChEi2VY5yD6AKDPgAAVuH6qEJQY25400_85x85.jpg"></a><a href="http://item.yhd.com/item/56829939" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_6_null_48919779" class="hd_pop_name">张君雅 台湾进口食品 特产 烧烤味点心面22g*5 BBQ五连包办公室休闲零食品小吃</a><b class="hd_pop_price">¥12.8</b></li><li><a href="http://item.yhd.com/item/56830311" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_7_null_48920125" class="hd_pop_img"><img src="1_files/ChEi3FY5r9iAY4BTAADqPzjhsyE70900_85x85.jpg"></a><a href="http://item.yhd.com/item/56830311" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_7_null_48920125" class="hd_pop_name">张君雅 台湾进口零食张君雅小妹妹系列巧克力甜甜圈45g 儿童零食小吃办公室休闲零食</a><b class="hd_pop_price">¥6.38</b></li><li><a href="http://item.yhd.com/item/56830402" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_8_null_48920204" class="hd_pop_img"><img src="1_files/ChEi11Y5qDeABFKbAADtuySnoHM92100_85x85.jpg"></a><a href="http://item.yhd.com/item/56830402" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_8_null_48920204" class="hd_pop_name">张君雅 台湾进口零食 张君雅小妹妹日式休闲丸子80g 办公室休闲零食 年货春节礼品</a><b class="hd_pop_price">¥6.5</b></li><li><a href="http://item.yhd.com/item/56830314" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_9_null_48920128" class="hd_pop_img"><img src="1_files/ChEi1VY5suiAHl7dAADMBoMFPfc74600_85x85.jpg"></a><a href="http://item.yhd.com/item/56830314" target="_blank" data-ref="pms_continue_1mallbuyWillBuy_product_ymall_9_null_48920128" class="hd_pop_name">张君雅 台湾特产进口膨化零食 张君雅小妹妹系列草莓味甜甜圈40g 办公室休闲零食</a><b class="hd_pop_price">¥6.38</b></li></ul></div><a href="javascript:void(0);" class="hd_show_pre none"></a><a style="display: inline;" href="javascript:void(0);" class="hd_show_next none"></a></div></div></div></div>

