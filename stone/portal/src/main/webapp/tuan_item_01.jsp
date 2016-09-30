<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>${item.title}</title>
<link rel="stylesheet" href="resource/css/tuan-global.css">
<link rel="stylesheet" href="resource/css/tuan-detail.css">

<script>
$(function(){
	var window_height = $(window).height();
	var top = $('#detail-head').offset().top;
	
	$(window).scroll(function(){ 
		var scroll_top = $(document).scrollTop();
	   	if(scroll_top-top>10){ 
	   		$("#detail-head").attr('class','dd-header J_DetailTab avil fixToTop') 
	   		$("#shopTitle").css("display","block");
	   		$("#recommend").attr('class','recommend J_RightRecommend hidden clearfix fixToTop');
		}else{ 
			$("#detail-head").attr('class','dd-header J_DetailTab avil') ;
			$("#shopTitle").css("display","none");
			$("#recommend").attr('class','recommend J_RightRecommend hidden clearfix') ;
	    } 
	 }); 
	
	var initPosition = function(){
		var scroll_top = $(document).scrollTop();
	   	if(scroll_top-top>10){ 
	   		$("#detail-head").attr('class','dd-header J_DetailTab avil fixToTop') 
	   		$("#shopTitle").css("display","block");
	   		$("#recommend").attr('class','recommend J_RightRecommend hidden clearfix fixToTop');
		}else{ 
			$("#detail-head").attr('class','dd-header J_DetailTab avil') ;
			$("#shopTitle").css("display","none");
			$("#recommend").attr('class','recommend J_RightRecommend hidden clearfix') ;
	    } 
	}
	
	initPosition();
	
	$(".small_img").bind("mouseover",function(){
		$(".small_img").parent().attr("class","");
		$(this).parent().attr("class","current");
		var src = $(this).attr("src");
		$("#big_img").attr("src",src);
	});
}); 
</script>

<div id="page">

	<!-- 普通商品详情 -->
	<div class="ju-wrapper">
		<div class="detail-main  clearfix">
			<!-- header -->

			<div class="header clearfix">
				<ul class="crumbs">
					<li><a href="https://ju.taobao.com/tg/today_items.htm">今日团购</a></li>
					<span class="arrow"><small></small></span>
					<li><a
						href="https://ju.taobao.com/tg/today_items.htm?stype=default&amp;page=1&amp;type=0">商品团</a></li>
					<span class="arrow"><small></small></span>
					<li><a
						href="https://ju.taobao.com/tg/today_items.htm?stype=default&amp;page=1&amp;type=0&amp;frontCatId=6000">母婴</a></li>
				</ul>

				<a data-spm-anchor-id="608.7065813.0.dr" data-spm="dr"
					class="bookMark"
					href="https://ju.taobao.com/tg/today_items.htm?spm=608.7065813.0.dr.Duet5t&amp;stype=default&amp;page=1&amp;type=0&amp;frontCatId=6000#lifeNavBar">查看更多同类商品<span></span></a>
			</div>

			<div class="clearfix">
				<div class="main-pic">
					<div class="normal-pic-wrapper clearfix" data-spm="ne">
						<div class="normal-pic ">
							<a
								href="item.jsp?id=${item.productId}"
								target="_blank" class="piclink">
									<img src="${tuanImgServer}${item.imgList.get(0)}" id="big_img" />
							</a>
						</div>
						<ul class="thumbnails">
							<c:forEach var="img" varStatus="s" items="${item.imgList}">
								<c:choose> 
								<c:when test="${s.index==0}">  
									<li class="current"><span class="triangle"></span> <img class="small_img"
										src="${tuanImgServer}/${item.imgList.get(0)}">
									</li>
								  </c:when> 
								  <c:otherwise>   
									   <li><span class="triangle"></span> <img class="small_img"
											src="${tuanImgServer}/${item.imgList.get(s.index)}">
										</li>
								  </c:otherwise> 
								</c:choose> 
							</c:forEach>
						</ul>
					</div>
				</div>


				<div class="main-box J_mainBox shuang avil">


					<h2 class="title">${item.title}</h2>

					<div class="biztag ">
						<label>包邮</label> <label>退货赔运费</label> <label>新年新装备</label>
					</div>

					<div class="description">
						${item.text.description}
					</div>
					<div class="infobar clearfix">
						<div class="time-banner">
							<div class="icon-time"></div>
							<div data-targettime="1455757199000"
								data-servertime="1455606933060" data-type="avil"
								class="ju-clock J_juItemTimer">
								还剩: <span class="day">1</span>天<span class="hour">17</span>小时<span
									class="min">13</span>分<span class="sec">32.5</span>秒
							</div>
						</div>

						<div class="numOfPeople J_ItemSold">
							<span class="num">${item.saleNum}</span>件已付款
						</div>
					</div>



					<div class="status-banner J_statusBanner   " data-miaosha="1"
						data-miaoshaurl="//detail.tmall.com/item.htm?id=45559515366&amp;root_refer=https%3A%2F%2Fju.taobao.com%2Ftg%2Ftoday_items.htm&amp;tracelog=jubuyitnow">

						<div class="currentPrice">
							<small>&#165;</small>${item.discountPrice}
						</div>

						<div class="oprice ">
							<div class="zgjicon">
								<small>专柜价</small>
							</div>
							<del class="originPrice">&#165;${item.price}</del>
						</div>

						<form class="J_BuySubForm" data-ccb="0" data-ques="0"
							action="item.jsp?id=${item.productId}"
							method="post">
							<input name="id2" value="1" type="hidden"> 
							<button type="submit" class="buyaction J_BuySubmit">
								<span>马上抢</span>
							</button>
						</form>

					</div>
					<div class="botbar">
						<input name="J_MbClientQrCode" id="J_MbClientQrCode"
							value="http://tb.cn/TpaWJdx" type="hidden">
						<div class="qrcode J_qrcode">
							<div title="" class="qrcode_sm J_JuMbQrCode">
								<canvas style="display: none;" height="28" width="28"></canvas>
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAA/0lEQVRIiZ1UWw7DIAzL/S+9/WyoGL8oUgWkedip0/mQNTPb+X/Hs7OpvPMMcsnUnQHF+O3eFKSBJdOrgqwobZNgLguyJE1iZObiH75n25QIbnb5UCgEbWptu1ZkEoUCgqCY3+brgm6UqWKPz6SSO7tSoWSFDJ3kE1M3EhR8Qs4SOlbu/W/3M5SGvt2Pgk2r3Eg48UAOnyQpEX2VfWPo5MxapM6pI4uhcmDI1YO+COBhy0WYHf1NAQTE0aml2GIBAzr/rpJwrlresmlWM8OTEL1lgvs6v0GaxGFtLmGSfMv4umA5XzFHLKgKqG/FQByAkqNbiTkdi7r3QYXMh+X7Atq5ypiQVqC1AAAAAElFTkSuQmCC"
									style="display: block;">
							</div>
							<s class="triangle"></s>
							<div title="" class="qrcode_big J_qrcode_big">
								<canvas style="display: none;" height="100" width="100"></canvas>
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC8UlEQVR4nO2VwZLkMAhD+/9/evYytZckWMginel+VPlkQILnSl6v1+tn8lSh1uz2m/YbPgABCEA0IImYBlLldu4SPRIBEIC0zADEGWB6KYLpdp27oMRszTqAuP5VjwA5qVMDIAB5JhBHa9Uz4QsgAAHI1wLpLFMFokaiP0AAkhdILAkgQYHEkgCyEYkFTgCa6JEIgAAkYvI7gUwcdaBq0DvvOv6HDkAAAhCA/BkgB6c3RnrwTwiAPCwA8rCQp3D/E+433okOIOcfsuNF9pUWAMh5H4AApG8EICd1jkDnzjGZguosxYXqnkPPUtEY3B3Ayev4AkhzACev4+ujgXSW6fSs8tw7B467g1VdmZs2A5B1XZmbNgOQdV2ZmxZ3jbnAp4FMPJTSo5wIkNhd6VFOBEjsrvQoJwIkdld6VBPdO+e0Bgg8nGnPld7hTjXp3gGk1jvcqSbdO4DUeoc7NdEVUOtSw6q+Eo/NvQMIQPp1APnNVQdwB1frAPI/V06UmqpLrhad6NEJtV9H2+0JkB+AAKToeQlkenBX66alSI9tYlaALHwltAFykuv6SmgD5CTX9ZXQvh2I2kMdturf8aHmJnoEdweQRA+ACD7U3ESPcSAT4mpPVzv9MHYW6wZAALLu6WoDBCCXdW5cAnEFOj3cYUODS0AS/ZsPACCVVqI/QJo+K61E/wgQV2A6msNtP7ZEz6YeQDp6AFn4UD1+NJCO6cSwag9Xy/G0cxZ6AHE8AUTo4Wo5ngAi9HC1HE9jQMopwqEae2d0HkNVZz+w3QE6ARCAtOPtQN75vXSG21nEpP/O3WKeZwwEEIAABCBNIIlQl76qc4CkPKf9N70ABCBCHUAa373O99Ix7Q7ngpw4bgAEIABZzAAQgASHCy3B8pEAflIHEIAA5BlA1KV0IrGwRLiP6OQAJBEAEeoA0jR2VdeJrwFyh7HpUB9RVZPQ6jxggCxqEloAufDy54BMnOlFpu9c7dROAAKQdQAEINvaqZ38A/7YISXmr1QtAAAAAElFTkSuQmCC"
									style="display: block;">
							</div>
							<div class="desc">
								<!--TMS:1711676-->
								<span>扫码下载手机客户端</span> 享受手机专属优惠机会
								<!-- end -->
								<style>
.main-box .botbar .qrcode .desc {
	width: 124px;
}

.main-box .botbar .qrcode .desc span {
	display: block;
}

.detail-main .main-box .infobar {
	font-size: 14px !important;
	line-height: 24px !important;
}
</style>
							</div>
						</div>



						<div class="operation">
							<a target="_blank" style="display: inline-block;"
								href="https://item.taobao.com/item.html?id=45559515366"
								class="ju-detail-cart J_CartPluginTrigger"><span></span>加入购物车</a><input
								id="J_TokenField" value="zyPyVoSUEp" type="hidden"> <a
								href="#" class="add-jucollect J_AddToJuCollect"
								data-id="10000017094672"><span></span>加入聚收藏</a> <a
								class="J_ItemShare share" data-itemid="45559515366"
								data-juid="10000017094672" data-itemprice="18.60"
								data-polldiscount="3.1" data-originalprice="60.00"
								data-itemname="幼儿园书包儿童宝宝包包1-3岁男女童小孩卡通可爱双肩背包"
								data-namecode="%D3%D7%B6%F9%D4%B0%CA%E9%B0%FC%B6%F9%CD%AF%B1%A6%B1%A6%B0%FC%B0%FC1-3%CB%EA%C4%D0%C5%AE%CD%AF%D0%A1%BA%A2%BF%A8%CD%A8%BF%C9%B0%AE%CB%AB%BC%E7%B1%B3%B0%FC"
								data-itempic="//gju3.alicdn.com/bao/uploaded/i2/104640167072804804/TB2zXcfkXXXXXXzXFXXXXXXXXXX_!!0-juitemmedia.jpg"
								data-domain="" href="#"><span></span>分享</a> <a class="jubao"
								target="_blank"
								href="https://form.taobao.com/script/fullview.htm?id=562"><span></span>举报</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="ju-wrapper">
		<div class="J_detail-coupon-wrap"></div>
	</div>
	<div class="ju-wrapper">
		<!-- left -->
		<div id="detail-left">
			<div class="widget-box seller-info" data-spm="nf">
				<div class="tit  J_sellerInfoTit">
					<a class="sellername"
						href="https://store.taobao.com/shop/view_shop.htm?user_number_id=1984990464"
						target="_blank">咔米嗒旗舰店</a> 
				</div>
				<div class="con">
					<h4>店铺动态评分</h4>
					<table>
						<tbody>
							<tr>
								<th>描述</th>
								<th>服务</th>
								<th>物流</th>
							</tr>
							<tr>
								<td class="lt">4.8 ↓</td>
								<td class="lt">4.7 ↓</td>
								<td class="lt">4.6 ↓</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="widget-box promise" data-spm="ns">
				<div class="tit">服务承诺</div>
				<div class="con">
					<ul class="clearfix J_PromiseCon" style="">
						<li class="floatleft"><a
							href="https://act.ju.taobao.com/market/ju/baozhang.php"
							target="_blank" class="blue">
								<div class="icon xxpf"></div> <span class="text">先行赔付</span>
						</a></li>
						<li class="floatleft"><a
							href="https://act.ju.taobao.com/market/ju/baozhang.php"
							target="_blank" class="green">
								<div class="icon qtth"></div> <span class="text">七天退换</span>
						</a></li>
					</ul>
				</div>
			</div>

			<!--TMS:731015-->


			<!-- end -->
			<div id="ks-lazyload183" class="J_RecommendWrap">
				<div style="top: 60px; display: block;" id="recommend"
					class="recommend J_RightRecommend hidden clearfix" data-spm="nb"
					data-domain="//ju.taobao.com/" data-platformid="34009"
					data-sellerid="1984990464">
					<div class="widget-box">
						<div class="tit none">相关推荐</div>
					</div>
					<div class="recom-list J_RememList">
						<div style="height: 152px; overflow: hidden; width: 212px;"
							class="tab-content">
							<div
								style="position: absolute; height: 912px; overflow: hidden; top: 0px;">
								<ul>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=18948397537&amp;id=10000017477055&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB20nmWkXXXXXbMXpXXXXXXXXXX_0-juitemmedia.jpg"
											alt="优质毛绒面料 幼儿包采用毛绒材质书包背起来更柔软更顺滑 小身体大容量 别看书包体积小，但是也能放下一些小物品水壶等 精美卡通图案 精美可爱的米奇米妮图案深受小孩子的喜爱"
											title="优质毛绒面料 幼儿包采用毛绒材质书包背起来更柔软更顺滑 小身体大容量 别看书包体积小，但是也能放下一些小物品水壶等 精美卡通图案 精美可爱的米奇米妮图案深受小孩子的喜爱">
										<div class="look-price">
												<span>&#165;39.90</span>
												<h5>【开学季 秒杀 秒杀 秒杀 秒杀 秒杀
													秒杀】幼儿园小书包婴儿宝宝背包包可爱1-3周岁卡通迪士尼米奇男童女童</h5>
											</div></a></li>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=524828520856&amp;id=10000017396204&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB2eIV6kXXXXXaQXXXXXXXXXXXX_0-juitemmedia.jpg"
											alt="时尚版型 韩版时尚设计年轻人的潮流范 贴心设计 赠送防走失带，再也不担心宝宝们跌倒受伤 品质保障 牛津大学授权，正规官方出品"
											title="时尚版型 韩版时尚设计年轻人的潮流范 贴心设计 赠送防走失带，再也不担心宝宝们跌倒受伤 品质保障 牛津大学授权，正规官方出品">
										<div class="look-price">
												<span>&#165;58.00</span>
												<h5>牛津大学幼儿包1-3周岁男女儿童防走失幼儿包宝宝小熊双肩包1</h5>
											</div></a></li>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=42520461058&amp;id=10000017430570&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB2s_fOkXXXXXanXXXXXXXXXXXX_0-juitemmedia.jpg"
											alt="贴心技术 时尚款式，多色可选，宝宝很爱 专业设计 超大容量 多层口袋/隔袋 方便实用！！！！ 大牌品质 精美图案 深受孩子的喜爱"
											title="贴心技术 时尚款式，多色可选，宝宝很爱 专业设计 超大容量 多层口袋/隔袋 方便实用！！！！ 大牌品质 精美图案 深受孩子的喜爱">
										<div class="look-price">
												<span>&#165;43.00</span>
												<h5>米奇儿童书包小学生男童一二三1-3年级女童迪士尼公主汽车双肩包2</h5>
											</div></a></li>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=520282208976&amp;id=10000017464750&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB2x1UskXXXXXbqXpXXXXXXXXXX_0-juitemmedia.jpg"
											alt="买一送一 前600名买书包，送同款文具收纳袋 精致设计 六种呆萌动物形象，精致电绣工艺 贴心简欧家族 背带可加长，可循环调节，防止滑落，更贴心"
											title="买一送一 前600名买书包，送同款文具收纳袋 精致设计 六种呆萌动物形象，精致电绣工艺 贴心简欧家族 背带可加长，可循环调节，防止滑落，更贴心">
										<div class="look-price">
												<span>&#165;49.00</span>
												<h5>【送文具收纳袋 买2再减3元】metoo 简欧可爱动物双肩包 毛绒玩具 小学生萌系书包 新年礼物</h5>
											</div></a></li>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=520154764927&amp;id=10000017430196&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB2lymZkXXXXXXfXpXXXXXXXXXX_0-juitemmedia.jpg"
											alt="贴心技术 新颖韩版外形，让孩子与众不同 专业设计 超大容量 多层口袋/隔袋 方便实用！！！！ 大牌品质 精美图案 深受孩子的喜爱"
											title="贴心技术 新颖韩版外形，让孩子与众不同 专业设计 超大容量 多层口袋/隔袋 方便实用！！！！ 大牌品质 精美图案 深受孩子的喜爱">
										<div class="look-price">
												<span>&#165;78.00</span>
												<h5>迪士尼儿童书包小学生1-3年级男童米奇护脊减负双肩背包27</h5>
											</div></a></li>
									<li
										style="float: none; overflow: hidden; height: 152px; display: block;"
										class="tab-pannel"><a target="_blank"
										href="https://detail.ju.taobao.com/home.htm?scm=1007.11420.6625.u0&amp;item_id=522558482303&amp;id=10000017463978&amp;pvid=210b142b-4f9e-45b1-b525-1ff9b2e3e680&amp;impid=9cBhNDF2e15"><img
											src="${tuanImgServer}TB2h97MkXXXXXa7XXXXXXXXXXXX_0-juitemmedia.jpg"
											alt="买一送一 前400名买书包，送同款文具收纳袋 超柔面料 亲肤水晶绒 给宝宝柔软呵护 出游必备 小书包 大容量 出游零食饮料一起放"
											title="买一送一 前400名买书包，送同款文具收纳袋 超柔面料 亲肤水晶绒 给宝宝柔软呵护 出游必备 小书包 大容量 出游零食饮料一起放">
										<div class="look-price">
												<span>&#165;45.00</span>
												<h5>【Metoo/咪兔】 丛林流线书包 毛绒背包 时尚双肩包 儿童书包 便携出游包</h5>
											</div></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="trigger-wrap">
						<a class="trigger prev"></a> <a class="trigger next"></a>
					</div>
					<ul class="tab-nav" style="display: none">
						<li class="selected"><a href="javascript:void(0);">1</a></li>
						<li class=""><a href="javascript:void(0);">2</a></li>
						<li class=""><a href="javascript:void(0);">3</a></li>
						<li class=""><a href="javascript:void(0);">4</a></li>
						<li class=""><a href="javascript:void(0);">5</a></li>
						<li class=""><a href="javascript:void(0);">6</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="detail-right">
			<div class="sub-box"></div>
			<div class="detail-detail">
				<div id="detail-head" class="dd-header J_DetailTab avil">
					<ul>
						<li class="current">宝贝详情<span class="triangle"></span></li>
						<li class="J_TabEval">历史评价<strong>4945</strong><span
							class="triangle"></span></li>
					</ul>
					<div class="subbuy">
						<span class="extra currentPrice"> &#165;${item.discountPrice} </span> <a href="#"
							class="extra  notice J_BuyButtonSub"> 马上抢 </a>
					</div>
					<div id="shopTitle" style="display: none;" class="J_Fixseller fixseller">
						<a class="sellername"
							href="https://store.taobao.com/shop/view_shop.htm?user_number_id=1984990464"
							target="_blank">咔米嗒旗舰店</a> 
					</div>
				</div>

				<div class="fix-holder J_TabFixHolder"></div>

				<div class="detail-con J_detailCon dd-content">
					<!-- 大促广告回流 -->

					<!-- 商家信息, 地图 -->
					<div class="infodetail ks-editor-post J_JuDetailBox">
						${item.text.detail}
					</div>

					<p class="detail-link-more" data-spm="g">
						<a target="_blank"
							href="https://detail.tmall.com/item.htm?id=45559515366&amp;tracelog=jubuybigpic">查看更多详情</a>
					</p>
					<!--TMS:1070165-->
					<!-- //gtms01.alicdn.com/tps/i1/TB11ReDHFXXXXavXFXXEsplOVXX-687-247.png -->

					<!-- end -->
				</div>

				<div class="detail-con J_detailCon" style="display: none">
					<div class="detail-eval J_DetailEval" data-item-id="45559515366"
						data-seller-id="1984990464" data-eval-type="3">
						<!-- 评价头部 -->
						<div class="eval-hd">
							<span class="item-grade J_GradeAvg">宝贝与描述相符<em>4.8</em>分
							</span> <span class="total-grade J_RateTotal">共<em>4945</em>次打分
							</span>
						</div>
						<!-- 大家印象 -->
						<div id="J_evalKeyword"></div>
						<!-- 评价筛选 -->
						<div class="eval-filter J_EvalFilter">
							<div class="fl">
								<label> <input checked="checked" name="ratetype"
									value="0" class="J_rateTypeFilter" type="radio"> 全部
								</label> <label> <input value="1" name="ratetype"
									class="J_rateTypeFilter" type="radio"> 追评
								</label> <label> <input value="2" name="ratetype"
									class="J_rateTypeFilter" type="radio"> 图片
								</label>
							</div>
							<div class="fr">
								<label> <input checked="checked" name="showcontent"
									id="J_showCntFilter" type="checkbox"> 有内容
								</label>
								<div class="rate-sort J_rateSort">
									<div class="tm-selectbtn tm-rate-sort">
										<span z-index="0" class="tm-current">按默认</span>
										<ul>
											<li data-val="3" class="tm-r-default"><a>按默认</a></li>
											<li data-val="1" class="tm-r-time"><a>按时间</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- 评价内容 -->
						<div class="eval-detail J_EvalInf"></div>
					</div>
				</div>

				<div class="detail-con J_detailCon J_DealRecord"
					style="display: none" data-itemid="45559515366"
					data-juid="10000017094672" data-tgtype="0"
					data-shortname="幼儿园书包儿童宝宝包包1-3岁男女童小孩卡通可爱双肩背包" data-frontprice=""
					data-currentprice="" data-activityprice="1860"></div>


			</div>
		</div>
	</div>

</div>

