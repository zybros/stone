<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.stone.base.system.Domain"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <link type="text/css" rel="stylesheet" href="resource/css/cart_002.css">
   <link type="text/css" rel="stylesheet" href="resource/css/cart_003.css">
   <script>
   $(function(){
	   var window_height = $(window).height();
	   var top = $('#cart-floatbar2').offset().top;
	   
	   $(window).scroll(function(){ 
			var scroll_top = $(document).scrollTop();
	      	if(top-scroll_top>window_height){ 
	      		$("#cart-floatbar2").attr('class','cart-toolbar fixed-bottom') 
		    	$("#cart-floatbar2").attr('style','width: 1349px; height: 50px;') ;
			}else{ 
				$("#cart-floatbar2").attr('class','cart-toolbar') ;
				$("#cart-floatbar2").attr('style','width: 988px; height: 50px;') ;
	       } 
	    }); 
	   
	   var initPosition = function(){
		    var scroll_top = $(document).scrollTop();
	      	if(top-scroll_top>window_height){ 
	      		$("#cart-floatbar2").attr('class','cart-toolbar fixed-bottom') 
		    	$("#cart-floatbar2").attr('style','width: 1349px; height: 50px;') ;
			}else{ 
				$("#cart-floatbar2").attr('class','cart-toolbar') ;
				$("#cart-floatbar2").attr('style','width: 988px; height: 50px;') ;
	       } 
	   }
	   
	   initPosition();
	   
	   
	   
	   var syscToCart = function(obj){
	   		var skuId = $(obj).val();
	   		var checked = $(obj).attr("checked");
	   		if(checked=='checked'){
	   			checked = true;
	   		}else{
	   			checked = false;
	   		}
		  	$.post("${memberDomain}/user/cart_changeChecked4ajax.do", {'skuId':skuId,'checked':checked}, function (status){
				if(status !=1 ){
					alert('error');
				}
			});
			
	   }
	   
	   var refreshTotalPrice = function(){
		   var totalPrice = 0;
		   var checkedCount = 0;
		   $("input[name='checkItem']:checked").each(function(){
			   var price = $(this).attr("price");
			   price = parseFloat(price);
			   totalPrice += price;
			   
			   var checkboxCell = $(this).parent().parent();
			   var quantityCell = checkboxCell.nextAll("[class='cell p-quantity']");
			   var input = quantityCell.find("input[class='itxt']");
			   checkedCount += parseInt(input.val());
		   });
		   $("#totalPrice").text("￥"+totalPrice.toFixed(2));
		   $("#checkedCount").text(checkedCount);
	   }
	   
	   refreshTotalPrice();
	   
	   $("input[name='checkItem']").click(function(){
		   syscToCart(this);
		   refreshTotalPrice();
	   });
	   
	   $("#go_order_pre_confirm").click(function(){
		   var skuIds = new Array();
		   $("input[name='checkItem']:checked").each(function(){
			   var skuId = $(this).val();
			   skuIds.push(skuId);
		   });
// 		   window.location.href="${memberDomain}/use/order_pre_confirm.do?skuIds="+skuIds;
		   window.location.href="${memberDomain}/user/order_pre_confirm.do";
	   });
   
   }); 
   
   </script>
<div id="o-header-2013"><div id="header-2013" style="display:none;"></div></div>


<!-- main -->
<div id="container" class="cart">
			<div class="w">
			<div class="cart-filter-bar">
	<ul class="switch-cart">
		<li class="switch-cart-item curr">
			<a href="#none">
				<em>全部商品</em>
				<span class="number">${totalCount}</span>
			</a>
		</li>
			</ul>
	<div class="cart-store">
		<input id="hiddenLocationId" type="hidden">
		<input id="hiddenLocation" type="hidden">
		
		<div id="jdarea" class="ui-area-wrap">
			
			<div class="ui-area-content-wrap">
				
				
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<div class="w-line">
		<div style="width: 82px;" class="floater"></div>
	</div>
	<div class="tab-con"></div>
	<div class="tab-con hide"></div>
</div>		</div>
			<div class="cart-warp">
			<div class="w">	
				<div id="jd-cart">
	<div class="cart-main cart-main-new">
		<div class="cart-thead">
			<div class="column t-checkbox">
				<div class="cart-checkbox">
					<input checked="checked" id="toggle-checkboxes_up" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart|keycount|xincart|cart_allCheck" type="checkbox">
					<label class="checked" for="">勾选全部商品</label>
				</div>
				全选
			</div>
			<div class="column t-goods">商品</div>
			<div class="column t-props"></div>
			<div class="column t-price">单价(元)</div>
			<div class="column t-quantity">数量</div>
			<div class="column t-sum">小计(元)</div>
			<div class="column t-action">操作</div>
		</div>
		<div id="cart-list">
				<input id="allSkuIds" value="1793569741,1793517444,10075814674" type="hidden">
	<input id="outSkus" value="" type="hidden">
	<input id="isLogin" value="1" type="hidden">
	<input id="isNoSearchStockState" value="0" type="hidden">
	<input id="isNoDD" value="0" type="hidden">
	<input id="isNoCoupon" value="0" type="hidden">
	<input id="isFavoriteDowngrade" value="0" type="hidden">
	<input id="isPriceNoticeDowngrade" value="0" type="hidden">
	<input id="hiddenLocationId" type="hidden">
	<input id="hiddenLocation" type="hidden">
	<input id="ids" value="1793569741,1793517444,10075814674" type="hidden">
	<!-- 修改数量之前的值 -->
	<input id="changeBeforeValue" value="" type="hidden">
	<input id="changeBeforeId" value="" type="hidden">
	<input value="1" id="checkedCartState" type="hidden">
	<input value="178687,86412" id="venderIds" type="hidden">
	
	<c:forEach var="shop" varStatus="s" items="${shopList}">
	
	<div class="cart-item-list" id="cart-item-list-01">
				<div class="cart-tbody" id="vender_178687">
	<div class="shop">
		<div class="cart-checkbox">
			<input checked="checked" name="checkShop" class="jdcheckbox" clstag="clickcart|keycount|xincart|cart_checkOn_shop" type="checkbox">
			<label for="">勾选店铺内全部商品</label>
		</div>
		<span class="shop-txt">
												<a class="shop-name" href="http://mall.jd.com/index-172400.html" target="_blank" id="venderId_178687" clstag="clickcart|keycount|xincart|cart_shopName">${shop.name}</a><a class="btn-im" _vid="178687" href="javascript:;" clstag="pageclick|keycount|cart__201503041|4">联系客服</a>
									</span>
	</div>
	<div class="item-list">
				<!--单品-->
			<!-- 单品-->
			
			<c:forEach var="product" items="${shop.productList}">
		<div id="product_1793569741">
		<c:forEach var="sku" items="${product.skuList}">
			<div class="item-single  item-item item-selected  " id="sku_1793569741">
			<div class="item-form">
				<div class="cell p-checkbox">
					<div class="cart-checkbox">
						<!--单品-->
							<c:choose>
								<c:when test="${sku.checked}">
									<input name="checkItem" value="${sku.id}" price="${sku.price * sku.count}" checked="checked" data-bind="cbid" class="jdcheckbox" clstag="clickcart|keycount|xincart|cart_checkOn_sku" type="checkbox">
								</c:when>
								<c:otherwise>
									<input name="checkItem" value="${sku.id}" price="${sku.price * sku.count}" data-bind="cbid" class="jdcheckbox" clstag="clickcart|keycount|xincart|cart_checkOn_sku" type="checkbox">
								</c:otherwise>
							</c:choose>
							<label for="" class="checked">勾选商品</label>
						<span class="line-circle"></span>
					</div>
				</div>
				<div class="cell p-goods">
					<div class="goods-item">
						<div class="p-img">
							<a href="${portalDomain}/item.jsp?id=${product.id}" target="_blank"><img width='80px' alt="${product.title}" clstag="clickcart|keycount|xincart|cart_sku_pic" src="${itemImgServer}${product.imgList[0]}"></a>
						</div>
						<div class="item-msg">
							<div class="p-name">
								<a clstag="clickcart|keycount|xincart|cart_sku_name" href="${portalDomain}/item.jsp?id=${product.id}" target="_blank">${product.title}-${sku.skuNo}</a>
							</div>
							<div class="p-extend">
								<span class="promise" _giftcard="giftcard_1793569741">
								</span>
															<span class="promise" _yanbao="yanbao_1793569741_">
									<!--<i class="jd-service-icon"></i>
									<a href="#none" class="ftx-03 jd-service" clstag="clickcart|keycount|xincart|cart_fuWu" data-tips="购买京东服务">购买京东服务</a>-->
								</span>
														</div>
						</div>
					</div>
				</div>
				<div class="cell p-props p-props-new">
										<div class="props-txt" title="0.3mm-R7 (5英寸)-弧边前膜">
										
										<c:forEach var="val" items="${sku.valList}">
										${val.templateName}:${val.value}<br/>
									</c:forEach>
										
										</div>
												</div>
				<div class="cell p-price">
										<strong>${sku.price}</strong>
																										                	            										                            				</div>
				<div class="cell p-quantity">
					<!--单品-->
						<div class="quantity-form">
							<a href="javascript:void(0);" class="decrement disabled" id="decrement_178687_1793569741_1_1">-</a>
							
							<input class="itxt" value="${sku.count}" type="text"/>
							
							<a href="javascript:void(0);" class="increment" id="increment_178687_1793569741_1_1_0">+</a>
						</div>
									<div class="ac ftx-03 quantity-txt" _stock="stock_1793569741">有货</div>
				</div>
				<div class="cell p-sum">
										<strong>${sku.price * sku.count}</strong>
												</div>
				<div class="cell p-ops">
					<!--单品-->
						<a id="remove_178687_1793569741_1" clstag="clickcart|keycount|xincart|cart_sku_del" data-name="瑞歌 防刮手机保护钢化玻璃膜 适用于oppo r..." data-more="removed_38.00_1" class="cart-remove" href="user/cart_delete.do?sku.id=${sku.id}">删除</a>
												<a href="javascript:void(0);" class="cart-follow" id="follow_178687_1793569741_1" clstag="clickcart|keycount|xincart|cart_sku_guanzhu">移到我的关注</a>
																		</div>
			</div>
			<div class="item-extra">
										<div class="gift-items">
																<div class="gift-item ">
								【赠品】
								<a href="http://item.jd.com/1792416092.html" target="_blank">
									瑞歌 硅胶手机壳保护套透明TPU软 适用于OPPO R7/R7 Plus oppo r7透明套
								</a>
								<span class="num">
																																X1
																							</span>
								<span class="ftx-01 ml20"></span>
														</div>
																	</div>
						</div>
			<div class="item-line"></div>
			</div>
		</c:forEach>
	</div>					<!--单品-->
			<!-- 单品-->
		</c:forEach>
		
</div>
			</div>
								
								
								</c:forEach>
					</div>
	</div>
</div>

<div id="cart-floatbar">
	<div style="width: 990px; height: 52px;" class="ui-ceilinglamp-1"><div id='cart-floatbar2' style="width: 988px; height: 50px;" class="cart-toolbar">
		<div class="toolbar-wrap">
			<div class="selected-item-list hide">
			</div>
			<div class="options-box">
				<div class="select-all">
					<div class="cart-checkbox">
						<input checked="checked" id="toggle-checkboxes_down" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart|keycount|xincart|cart_allCheckDown" type="checkbox">
						<label class="checked" for="">勾选全部商品</label>
					</div>
					全选
				</div>
				<div class="operation">
					<a href="#none" clstag="clickcart|keycount|xincart|cart_somesku_del" class="remove-batch">删除选中的商品</a>
											<a href="#none" class="follow-batch" clstag="clickcart|keycount|xincart|cart_somesku_guanzhu">移到我的关注</a>
									</div>
				<div class="clr"></div>
				<div class="toolbar-right">
					<div class="normal">
						<div class="comm-right">
							<div class="btn-area">
								<a id="go_order_pre_confirm" data-bind="1" href="javascript:void(0);" onclick="return false;" clstag="clickcart|keycount|xincart|cart_gotoOrder" class="submit-btn">
								去结算<b></b></a>
								<!-- <a href="javascript:void(0);" class="submit-btn submit-btn-disabled">
								去结算<b></b></a> -->
							</div>
							<div class="price-sum">
								<div>
									<span class="txt">总价（不含运费）：</span>
									<span class="price sumPrice"><em id="totalPrice">￥0.00</em></span>
									<br>
									<span class="txt">已节省：</span>
									<span class="price totalRePrice">-￥0.00</span>
								</div>
							</div>
							<div class="amount-sum">
								已选择<em id="checkedCount">0</em>件商品<b class="up" clstag="clickcart|keycount|xincart|cart_thumbnailOpen"></b>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div style="display: none;" class="combine">
						<div class="comm-right">
							<div class="btn-area">
								<a href="javascript:void(0);" onclick="return false;" clstag="clickcart|keycount|xincart|cart_gotoOrderOut" class="jdInt-submit-btn">
								去全球购结算<b></b></a>
								<a href="javascript:void(0);" onclick="return false;" clstag="clickcart|keycount|xincart|cart_gotoOrder" class="common-submit-btn">
								去京东结算<b></b></a>
							</div>
							<div class="price-sum">
								<div>
									<span class="txt">总价（不含运费）：</span>
									<span class="price sumPrice"><em>￥${totalPrice}</em></span>
									<br>
									<span class="txt">已节省：</span>
									<span class="price totalRePrice">-￥0.00</span>
								</div>
							</div>
							<div class="amount-sum">
								已选择<em>${totalCount}</em>件商品<b class="up"></b>
							</div>
							<div class="clr"></div>
						</div>
						<div class="clr"></div>
					</div>
				</div>
				
			</div>
		</div>
	</div></div>
</div>
<div class="cart-removed">
	<div class="r-tit">已删除商品，您可以重新购买或加关注：</div>
</div>			
</div>
		
		</div>
			<div class="w">
		<div id="c-tabs" data-widget="tabs">
		<div class="tab-nav">
			<ul>
				<li class="c-tabs-item curr" data-widget="tab-item"><h3>猜你喜欢</h3></li>
									<li class="c-tabs-item" data-widget="tab-item"><h3>我的关注</h3></li>
								<li class="c-tabs-item" data-widget="tab-item"><h3>我的足迹</h3></li>
			</ul>
		</div>
		<div style="display: block;" class="tab-con ui-switchable-panel-selected" id="guess-products"><div class="p-list" data-widget="tab-content"><a class="prev arrow-btns disabled" href="#none"></a><a class="next arrow-btns" href="#none"></a><div style="position: relative;" class="p-list-cont ui-switchable-body"><ul class="ui-switchable-panel-main" style="width: 3520px; left: 0px; position: absolute;"><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10042085527$index=0$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=6fb196ddb4a7d07f0f55fc33206f4c0e17521d94" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10042085527$index=0$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=6fb196ddb4a7d07f0f55fc33206f4c0e17521d94')" class="ui-switchable-panel ui-switchable-panel-selected" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/10042085527.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="瑞歌 手机钢化玻璃保护贴膜 适用于vivo x6/Plus x6-0.3mm - 钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/10042085527.html" target="_blank">瑞歌 手机钢化玻璃保护贴膜 适用于vivo x6/Plus x6-0.3mm - 钢化膜</a></div><div class="p-price"><strong>￥28.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="10042085527" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792410370$index=1$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=cf6f637d6af86c73c527a7121ddf0484fd53bec5" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792410370$index=1$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=cf6f637d6af86c73c527a7121ddf0484fd53bec5')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1792410370.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="瑞歌 硅胶手机壳保护套透明TPU软 适用于OPPO R7/R7 Plus oppo r7透明套-送防蓝光钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1792410370.html" target="_blank">瑞歌 硅胶手机壳保护套透明TPU软 适用于OPPO R7/R7 Plus oppo r7透明套-送防蓝光钢化膜</a></div><div class="p-price"><strong>￥48.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1792410370" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792619444$index=2$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=9ce64816acf98833f3dcc7fa837849de874ad53b" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792619444$index=2$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=9ce64816acf98833f3dcc7fa837849de874ad53b')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1792619444.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="瑞歌 手机套保护壳金属边框后盖 适用于华为荣耀畅玩5x 土豪金-送钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1792619444.html" target="_blank">瑞歌 手机套保护壳金属边框后盖 适用于华为荣耀畅玩5x 土豪金-送钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1792619444" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792206970$index=3$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=ee32f0fe208331299a1984a49df9abe6d3b84cca" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792206970$index=3$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=ee32f0fe208331299a1984a49df9abe6d3b84cca')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1792206970.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="瑞歌 苹果6S手机壳/套外壳保护后盖硅胶 适用于 iPhone6/6S 4.7 5.5英寸 - 透明壳 -赠抗蓝光钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1792206970.html" target="_blank">瑞歌 苹果6S手机壳/套外壳保护后盖硅胶 适用于 iPhone6/6S 4.7 5.5英寸 - 透明壳 -赠抗蓝光钢化膜</a></div><div class="p-price"><strong>￥48.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1792206970" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793739694$index=4$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=d43deaddf564f7ab78aed1d8824437c3fa310ed6" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793739694$index=4$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=d43deaddf564f7ab78aed1d8824437c3fa310ed6')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1793739694.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="瑞歌  钢化膜手机贴膜玻璃保护膜 适用于步步高VIVO Y33/Y33t/Y33L 0.3mm - 钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1793739694.html" target="_blank">瑞歌  钢化膜手机贴膜玻璃保护膜 适用于步步高VIVO Y33/Y33t/Y33L 0.3mm - 钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1793739694" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805289079$index=5$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=ac261c5b8fe6d2ad4b04ca8947c2b600d8651092" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805289079$index=5$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=ac261c5b8fe6d2ad4b04ca8947c2b600d8651092')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1805289079.html" target="_blank"><img src="images/562c7d5eN34df9e35.jpg" alt="瑞歌  金属边框手机壳保护套后盖 适用于华为P8青春版 土豪金" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1805289079.html" target="_blank">瑞歌  金属边框手机壳保护套后盖 适用于华为P8青春版 土豪金</a></div><div class="p-price"><strong>￥58.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1805289079" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1791890723$index=6$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=6675568dacce2503b8af54efdff1475275caaf3b" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1791890723$index=6$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=6675568dacce2503b8af54efdff1475275caaf3b')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1791890723.html" target="_blank"><img src="images/561f0c19Na89c7db2.jpg" alt="瑞歌手机壳手机套透明硅胶壳保护套 适用于魅族MX5 透明白色-送钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1791890723.html" target="_blank">瑞歌手机壳手机套透明硅胶壳保护套 适用于魅族MX5 透明白色-送钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1791890723" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805306755$index=7$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=803fafc4ab7d4c54d2005d0cbfab6c526eb5c41b" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805306755$index=7$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=803fafc4ab7d4c54d2005d0cbfab6c526eb5c41b')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1805306755.html" target="_blank"><img src="images/561e788fNff020496.jpg" alt="瑞歌 金属边框手机壳保护套后盖 适用于华为P8/P8标准版 气质银" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1805306755.html" target="_blank">瑞歌 金属边框手机壳保护套后盖 适用于华为P8/P8标准版 气质银</a></div><div class="p-price"><strong>￥58.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1805306755" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792336724$index=8$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=53ea5764eef684f6f4dc62978cccc6254f9fa153" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792336724$index=8$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=53ea5764eef684f6f4dc62978cccc6254f9fa153')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1792336724.html" target="_blank"><img src="images/561f12dcN242da72d.jpg" alt="瑞歌  手机壳保护套透明硅胶外壳 适用于魅族魅蓝note2/魅蓝note 魅蓝note2 - 透明白色 - 赠钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1792336724.html" target="_blank">瑞歌  手机壳保护套透明硅胶外壳 适用于魅族魅蓝note2/魅蓝note 魅蓝note2 - 透明白色 - 赠钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1792336724" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794461600$index=9$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=b62fd886a2cc64c83b254ca1cf838f80fc2cbec8" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794461600$index=9$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=b62fd886a2cc64c83b254ca1cf838f80fc2cbec8')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1794461600.html" target="_blank"><img src="images/5620c17fN1a98c38f.jpg" alt="瑞歌 手机钢化玻璃保护贴膜 适用于魅族Pro 5 0.3mm - 钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1794461600.html" target="_blank">瑞歌 手机钢化玻璃保护贴膜 适用于魅族Pro 5 0.3mm - 钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1794461600" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1809420164$index=10$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=85d48b5fb6a72c0180e4f2fc3fcf11ed4f9eb8e9" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1809420164$index=10$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=85d48b5fb6a72c0180e4f2fc3fcf11ed4f9eb8e9')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1809420164.html" target="_blank"><img src="images/561e3a71N37498daf.jpg" alt="瑞歌  金属边框手机壳保护套后盖 适用于三星 Galaxy On7（G6000） 土豪金" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1809420164.html" target="_blank">瑞歌  金属边框手机壳保护套后盖 适用于三星 Galaxy On7（G6000） 土豪金</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1809420164" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794530688$index=11$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=74a916fdb55ce129c627ee2a522099a90da287d8" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794530688$index=11$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=74a916fdb55ce129c627ee2a522099a90da287d8')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1794530688.html" target="_blank"><img src="images/5620c98dN8e875cb6.jpg" alt="瑞歌 苹果手机钢化玻璃保护贴膜 适用于iPhone 6/6S 5.5英寸 - 抗蓝光钢化膜(非全屏)" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1794530688.html" target="_blank">瑞歌 苹果手机钢化玻璃保护贴膜 适用于iPhone 6/6S 5.5英寸 - 抗蓝光钢化膜(非全屏)</a></div><div class="p-price"><strong>￥48.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1794530688" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792343061$index=12$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=fda4b0731327e1eadb385260124deca1199d80db" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1792343061$index=12$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=fda4b0731327e1eadb385260124deca1199d80db')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1792343061.html" target="_blank"><img src="images/561f17b8N249142d5.jpg" alt="瑞哥  硅胶透明手机壳保护套 适用于步步高vivo Y37 白色" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1792343061.html" target="_blank">瑞哥  硅胶透明手机壳保护套 适用于步步高vivo Y37 白色</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1792343061" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805040083$index=13$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=100484cdbeb936cb95cad5f315073d5064d046cb" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1805040083$index=13$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=100484cdbeb936cb95cad5f315073d5064d046cb')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1805040083.html" target="_blank"><img src="images/561ded20N7417d0ba.jpg" alt="瑞歌  金属边框手机壳保护套后盖 适用于华为P8max 6.8英寸 土豪金-当天发货" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1805040083.html" target="_blank">瑞歌  金属边框手机壳保护套后盖 适用于华为P8max 6.8英寸 土豪金-当天发货</a></div><div class="p-price"><strong>￥58.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1805040083" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1722456443$index=14$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=947b2905703483250277ec766fb272249d1114c8" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1722456443$index=14$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=947b2905703483250277ec766fb272249d1114c8')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1722456443.html" target="_blank"><img src="images/561a194bN1b0b4b98.jpg" alt="caibeike 手机套壳 适用于魅族Mx5 升级金属边框+PC防爆后盖-土豪金" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1722456443.html" target="_blank">caibeike 手机套壳 适用于魅族Mx5 升级金属边框+PC防爆后盖-土豪金</a></div><div class="p-price"><strong>￥33.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1722456443" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1789743929$index=15$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=b60d8e5cc2f9384a53c9c363276b4e52a279c9" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1789743929$index=15$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=b60d8e5cc2f9384a53c9c363276b4e52a279c9')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1789743929.html" target="_blank"><img src="images/561def18N88bad92d.jpg" alt="瑞歌 金属边框手机壳保护套后盖 适用于华为P8/P8青春版 P8青春版(5.0英寸)-土豪金" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1789743929.html" target="_blank">瑞歌 金属边框手机壳保护套后盖 适用于华为P8/P8青春版 P8青春版(5.0英寸)-土豪金</a></div><div class="p-price"><strong>￥48.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1789743929" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1807277399$index=16$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=551ec319944b4c6b1532531ac913c0bb2a7b692a" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1807277399$index=16$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=551ec319944b4c6b1532531ac913c0bb2a7b692a')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1807277399.html" target="_blank"><img src="images/56270749N9d29dff0.jpg" alt="瑞歌 手机钢化玻璃膜保护贴膜全屏 适用于华为麦芒4 麦芒四-高清贴膜-非全屏" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1807277399.html" target="_blank">瑞歌 手机钢化玻璃膜保护贴膜全屏 适用于华为麦芒4 麦芒四-高清贴膜-非全屏</a></div><div class="p-price"><strong>￥15.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1807277399" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794765706$index=17$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=f55827570dacdf5932f733f547594e0c07f79a3f" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1794765706$index=17$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=f55827570dacdf5932f733f547594e0c07f79a3f')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1794765706.html" target="_blank"><img src="images/5620e6ebN5fc4ef08.jpg" alt="瑞歌 玻璃钢化膜手机贴膜 适用于小米note 0.3mm - 钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1794765706.html" target="_blank">瑞歌 玻璃钢化膜手机贴膜 适用于小米note 0.3mm - 钢化膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1794765706" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1719695915$index=18$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=1a2958a362984b91f7618a962dad8e85e61fa13b" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1719695915$index=18$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=1a2958a362984b91f7618a962dad8e85e61fa13b')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1719695915.html" target="_blank"><img src="images/56176dceNc92f943e.jpg" alt="瑞歌 手机壳/套透明保护套 适用于魅族pro5 透明软套- 赠钢化膜 - 不拼价格 只比质量" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1719695915.html" target="_blank">瑞歌 手机壳/套透明保护套 适用于魅族pro5 透明软套- 赠钢化膜 - 不拼价格 只比质量</a></div><div class="p-price"><strong>￥28.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1719695915" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2029543$index=19$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=d455e94b897236c6d78916728c9aac8935928fd6" onclick="log('//mercury.jd.com/log.gif?t=rec.205000&amp;v=src=rec$action=1$reqsig=6cf67ec62767e498a01dd23f8e1aa0452e922ca1$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2029543$index=19$st=0$adcli=$expid=0&amp;rid=4710192395582573005&amp;ver=1&amp;sig=d455e94b897236c6d78916728c9aac8935928fd6')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/2029543.html" target="_blank"><img src="images/568cc023N9cce9554.jpg" alt="忆捷（EAGET）i50 32G USB3.0苹果官方MFI认证苹果IPHONE双接口手机U盘 金色" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/2029543.html" target="_blank">忆捷（EAGET）i50 32G USB3.0苹果官方MFI认证苹果IPHONE双接口手机U盘 金色</a></div><div class="p-price"><strong>￥199.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="2029543" clstag="pageclick|keycount|cart__201503041|1"><span class="btn-text">加入购物车</span></a></div></div></li></ul></div></div></div>
		    		<div style="display: none;" class="tab-con hide" id="favorite-products"><div class="p-list" data-widget="tab-content"><a class="prev arrow-btns disabled" href="#none"></a><a class="next arrow-btns disabled" href="#none"></a><div style="position: relative;" class="p-list-cont ui-switchable-body"><ul class="ui-switchable-panel-main" style="width: 176px; left: 0px; position: absolute;"><li class="ui-switchable-panel ui-switchable-panel-selected" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1018854818.html" target="_blank"><img src="images/551cb761Nbdc2d397.jpg" alt="e路航 行车记录仪 高清单双镜头倒车可视一体机 T86 广角夜视后视镜停车监控款 双摄像头可倒车后视(无卡)" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1018854818.html" target="_blank">e路航 行车记录仪 高清单双镜头倒车可视一体机 T86 广角夜视后视镜停车监控款 双摄像头可倒车后视(无卡)</a></div><div class="p-price"><strong> 暂无报价</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1018854818" clstag="pageclick|keycount|cart__201503041|2"><span class="btn-text">加入购物车</span></a></div></div></li></ul></div></div></div>
				<div style="display: none;" class="tab-con hide" id="history-products"><div class="p-list" data-widget="tab-content"><a class="prev arrow-btns disabled" href="#none"></a><a class="next arrow-btns" href="#none"></a><div style="position: relative;" class="p-list-cont ui-switchable-body"><ul class="ui-switchable-panel-main" style="width: 2816px; left: 0px; position: absolute;"><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1329973098$index=0$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=7c27cf9ee918cbf043c143e5239e6a91c0147157" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1329973098$index=0$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=7c27cf9ee918cbf043c143e5239e6a91c0147157')" class="ui-switchable-panel ui-switchable-panel-selected" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1329973098.html" target="_blank"><img src="resource/images/565ebf96N534137a0.jpg" alt="卫甲 车载充电器 双USB车充电源 智能测电压LED显示 一拖二车充通用所有手机 宝石蓝-SC-D31-送安卓数据线" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1329973098.html" target="_blank">卫甲 车载充电器 双USB车充电源 智能测电压LED显示 一拖二车充通用所有手机 宝石蓝-SC-D31-送安卓数据线</a></div><div class="p-price"><strong>￥49.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1329973098" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1467265694$index=1$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=f31690e8ce6a27dd0cc8d5c7d2eae13c98a22e32" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1467265694$index=1$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=f31690e8ce6a27dd0cc8d5c7d2eae13c98a22e32')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1467265694.html" target="_blank"><img src="images/5530ccadN6af920dc.jpg" alt="卫甲 手机保护套 适用于中兴努比亚Z9max/大牛4手机壳炫彩壳 神秘黑-炫彩壳" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1467265694.html" target="_blank">卫甲 手机保护套 适用于中兴努比亚Z9max/大牛4手机壳炫彩壳 神秘黑-炫彩壳</a></div><div class="p-price"><strong>￥19.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1467265694" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793569741$index=2$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=eacf4221276e73f826e978e166223832f82dabf4" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793569741$index=2$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=eacf4221276e73f826e978e166223832f82dabf4')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1793569741.html" target="_blank"><img src="images/562068edNeb76a4a9.jpg" alt="瑞歌 防刮手机保护钢化玻璃膜 适用于oppo r7/R7C/R7/R7 Plus 0.3mm-R7 (5英寸)-弧边前膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1793569741.html" target="_blank">瑞歌 防刮手机保护钢化玻璃膜 适用于oppo r7/R7C/R7/R7 Plus 0.3mm-R7 (5英寸)-弧边前膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1793569741" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793517444$index=3$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=dc6ee5ebf6ddca82947d671872030b9d787c4634" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1793517444$index=3$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=dc6ee5ebf6ddca82947d671872030b9d787c4634')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1793517444.html" target="_blank"><img src="images/561fa37fN543e59d6_002.jpg" alt="瑞歌 手机钢化膜玻璃保护贴膜 适用于魅族MX5 2.5D弧边-钢化膜玻璃膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1793517444.html" target="_blank">瑞歌 手机钢化膜玻璃保护贴膜 适用于魅族MX5 2.5D弧边-钢化膜玻璃膜</a></div><div class="p-price"><strong>￥38.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1793517444" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10042085527$index=4$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=27530e515a4b05e0042e70a3d559fcfcf222e288" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10042085527$index=4$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=27530e515a4b05e0042e70a3d559fcfcf222e288')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/10042085527.html" target="_blank"><img src="images/565ebf96N534137a0.jpg" alt="瑞歌 手机钢化玻璃保护贴膜 适用于vivo x6/Plus x6-0.3mm - 钢化膜" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/10042085527.html" target="_blank">瑞歌 手机钢化玻璃保护贴膜 适用于vivo x6/Plus x6-0.3mm - 钢化膜</a></div><div class="p-price"><strong>￥28.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="10042085527" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=284953$index=5$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=332dfc993c009a52df32494693befd6e57db40c8" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=284953$index=5$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=332dfc993c009a52df32494693befd6e57db40c8')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/284953.html" target="_blank"><img src="images/5525f355N880400d7.jpg" alt="茅台王子酒 53度 500ml" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/284953.html" target="_blank">茅台王子酒 53度 500ml</a></div><div class="p-price"><strong>￥89.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="284953" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1278197569$index=6$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=724426e323417ee0cd9b9899eedb07f2297285c6" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1278197569$index=6$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=724426e323417ee0cd9b9899eedb07f2297285c6')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1278197569.html" target="_blank"><img src="images/54052320N5e36e6af.jpg" alt="卫甲  补邮 补差价  手机套补邮差" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1278197569.html" target="_blank">卫甲  补邮 补差价  手机套补邮差</a></div><div class="p-price"><strong>￥1.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1278197569" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1747378123$index=7$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=897cb5510d77c5607dfd35427b67730f62f80c78" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1747378123$index=7$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=897cb5510d77c5607dfd35427b67730f62f80c78')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1747378123.html" target="_blank"><img src="images/55fad06cN38473bd6.jpg" alt="普纳斯对讲机 手机 天翼插卡手台  电信全国对讲 不限制距离 车友会 官方标配+(包年卡)" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1747378123.html" target="_blank">普纳斯对讲机 手机 天翼插卡手台  电信全国对讲 不限制距离 车友会 官方标配+(包年卡)</a></div><div class="p-price"><strong>￥449.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1747378123" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2108870$index=8$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=6e49fc56a2f05b699a796a9607ec94a6fedea347" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2108870$index=8$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=6e49fc56a2f05b699a796a9607ec94a6fedea347')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/2108870.html" target="_blank"><img src="images/563032a8N0bf91c0b.jpg" alt="魅族 MX5 32GB 银白色 移动联通双4G手机 双卡双待" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/2108870.html" target="_blank">魅族 MX5 32GB 银白色 移动联通双4G手机 双卡双待</a></div><div class="p-price"><strong>￥1899.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="2108870" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10075814674$index=9$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=30f9924c4218b9a6e2dd22b71127c7360a9cf843" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=10075814674$index=9$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=30f9924c4218b9a6e2dd22b71127c7360a9cf843')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/10075814674.html" target="_blank"><img src="images/566a967aN2fdc8d40_002.jpg" alt="vivo X6A 全网通高配版4G手机 4GB+64GB 双卡双待 金色" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/10075814674.html" target="_blank">vivo X6A 全网通高配版4G手机 4GB+64GB 双卡双待 金色</a></div><div class="p-price"><strong>￥2688.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="10075814674" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1773549$index=10$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=87ddbb6c642c715e8cd22e84e58fed4a7cb2e7a5" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1773549$index=10$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=87ddbb6c642c715e8cd22e84e58fed4a7cb2e7a5')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1773549.html" target="_blank"><img src="images/55ff9dd9Nc692fa6d.jpg" alt="乐视（Letv）乐1pro（X800）32GB 银色 移动联通4G手机 双卡双待" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1773549.html" target="_blank">乐视（Letv）乐1pro（X800）32GB 银色 移动联通4G手机 双卡双待</a></div><div class="p-price"><strong>￥1599.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1773549" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1685775$index=11$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=d6087ef5dc24845426a738b90e3c8da4b31bb6e5" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1685775$index=11$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=d6087ef5dc24845426a738b90e3c8da4b31bb6e5')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1685775.html" target="_blank"><img src="images/55ff9e01Nea90cfdb.jpg" alt="乐视（Letv）乐1（X600）32GB 银白 移动联通4G手机 双卡双待" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1685775.html" target="_blank">乐视（Letv）乐1（X600）32GB 银白 移动联通4G手机 双卡双待</a></div><div class="p-price"><strong>￥1099.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1685775" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2028973$index=12$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=476714924ff86fc050ee98c75c45da532eb90950" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=2028973$index=12$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=476714924ff86fc050ee98c75c45da532eb90950')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/2028973.html" target="_blank"><img src="images/56612a3cNc021ccfa.jpg" alt="乐视（Letv）乐1S（X500）32GB 金色 移动联通4G手机 双卡双待" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/2028973.html" target="_blank">乐视（Letv）乐1S（X500）32GB 金色 移动联通4G手机 双卡双待</a></div><div class="p-price"><strong>￥1099.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="2028973" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1307114589$index=13$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=8de89e493efbb1fc1e69e915aa86b623c2a2a121" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1307114589$index=13$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=8de89e493efbb1fc1e69e915aa86b623c2a2a121')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1307114589.html" target="_blank"><img src="images/5418e6fcNa8405741.jpg" alt="朗客 苹果6透彩手机壳保护套iPhone6手机壳 适用iPhone6s（4.7英寸） 玫瑰红色" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1307114589.html" target="_blank">朗客 苹果6透彩手机壳保护套iPhone6手机壳 适用iPhone6s（4.7英寸） 玫瑰红色</a></div><div class="p-price"><strong>￥1.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1307114589" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1730052$index=14$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=64762e02187488fd0e58d91c15de6fd8e898063c" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1730052$index=14$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=64762e02187488fd0e58d91c15de6fd8e898063c')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1730052.html" target="_blank"><img src="images/55ac5bc9N7dc9657c.jpg" alt="华为（HUAWEI）P8max 移动联通双4G 双卡双待 星光银" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1730052.html" target="_blank">华为（HUAWEI）P8max 移动联通双4G 双卡双待 星光银</a></div><div class="p-price"><strong>￥3388.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1730052" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li><li data-clk="//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1856584$index=15$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=19fe2e6c0500342774f6bdd831a61ff86b932fba" onclick="log('//mercury.jd.com/log.gif?t=rec.906005&amp;v=src=rec$action=1$reqsig=aca93c287a6bcb26a9bdb89828613cd979fe5095$enb=1$sku=0$skus=1793569741,1793517444,10075814674$csku=1856584$index=15$st=0$adcli=$expid=90600500115030913&amp;rid=8905478533426620665&amp;ver=1&amp;sig=19fe2e6c0500342774f6bdd831a61ff86b932fba')" class="ui-switchable-panel" style="float: left; display: list-item;"><div class="p-item"><div class="p-img"><a href="http://item.jd.com/1856584.html" target="_blank"><img src="images/55f0e80aN532efcae.jpg" alt="Apple iPhone 6s (A1700) 16G 玫瑰金色 移动联通电信4G手机" height="130" width="130"></a></div><div class="p-name"><a href="http://item.jd.com/1856584.html" target="_blank">Apple iPhone 6s (A1700) 16G 玫瑰金色 移动联通电信4G手机</a></div><div class="p-price"><strong>￥4888.00</strong></div><div class="p-btn"><a class="btn-9" href="javascript:void(0);" _pid="1856584" clstag="pageclick|keycount|cart__201503041|3"><span class="btn-text">加入购物车</span></a></div></div></li></ul></div></div></div>
</div>		</div>
		<div class="w">
		<div class="backpanel-inner">
			<div id="bp-follow" class="bp-item ">
			<a clstag="pageclick|keycount|cart__201503041|10" target="_blank" class="survey" href="http://t.jd.com/follow/product">我的关注</a>
		</div>
		<div class="bp-item " id="bp-faq">
		<a href="http://help.jd.com/user/issue/34-1098.html" class="survey" target="_blank" clstag="pageclick|keycount|cart__201503041|6">常见问题</a>
	</div>
	<div class="bp-item " id="bp-survery">
		<a href="http://surveys.jd.com/index.php?r=survey/index/sid/487227/newtest/Y/lang/zh-Hans" class="survey" target="_blank" clstag="clickcart|keycount|xincart|cart_gotoFeedback">我要反馈</a>
	</div>
	<div style="display: block;" class="bp-item " id="bp-backtop">
		<a href="#none" class="backtop" target="_self" clstag="clickcart|keycount|xincart|cart_backTop">返回顶部</a>
	</div>
</div>	</div>
	
</div>
<!-- /main -->

<object id="ddplugin-msie" classid="CLSID:B35D742C-5983-40C1-A8C0-A7DBFA2EF05E" height="0" width="0"></object>
<embed id="ddplugin" type="application/dd-plugin" height="0" width="0">
