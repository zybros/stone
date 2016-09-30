<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready( function() {
	var isSelectedAll = false;
	var globalSkuId = 0;
	var global_tpl_size = ${vals.size()};
	var global_skus = ${skus};
	$("li[class^='sku']").click(function(){
		var spanCls = $(this).find("span").attr('class');
		if(spanCls=='can-not-buy')return;
		var txt = $(this).find("span").text();
		var cls = $(this).attr("class");
		var index = cls.indexOf(' cur');
		if(index==-1){
			$(this).siblings().attr('class','sku');
			$(this).attr('class','sku cur');
// 			$(this).parent().siblings().attr('class','zs-options clearfix');
// 			$(this).parent().attr('class','zs-options clearfix selected');
			
		}else{
			$(this).attr('class','sku');
// 			$(this).parent().attr('class','zs-options clearfix');
		}
		var arr = new Array();
		$("li[class='sku cur']").each(function(){
			var obj = new Object();
			obj.templateId = $(this).find("span").attr("data-value");
			obj.val = $(this).find("span").text();
			arr.push(obj);
		});
		refreshSkus(arr);
	});  
	
	
	
	var refreshSkus = function(selectedArr){
		var skuArr = new Array();
		for(i in global_skus){
			var vals = global_skus[i].vals;
			var valArr = vals.split(',');
			var flag = true;
			for(j in selectedArr){
				var selectVal = selectedArr[j];
				var flag2 = false;
				for(k in valArr){
					var arr = valArr[k].split(':');
					if(selectVal.templateId==arr[0]){
						if(selectVal.val==arr[1]){
							flag2 = true;
						}
						break;
					}
				}
				if(!flag2){
					flag = false;
					break;
				}
			}
			if(flag){
				skuArr.push(global_skus[i]);
			}
		}
		refreshCanBuy(skuArr);
		
		if(selectedArr.length==global_tpl_size&&skuArr.length==1){
			globalSkuId = skuArr[0].skuId;
			$.get("getStockPrice.do?id="+globalSkuId, null, function (sku){
				$("#stock").val(sku.stock);
				$("#price").text(sku.price);
			});
			isSelectedAll = true;
		}else{
			isSelectedAll = false;
		}
	}
	
	var refreshCanBuy = function(skuArr){
		if(skuArr.length==0){
			$("ul[class='zs-options clearfix'] > li[class='sku']").each(function(){
				$(this).children("span").attr('class','can-buy');
			});
			return;
		}
		$("ul[class='zs-options clearfix']").each(function(){
			$(this).children("li[class='sku']").each(function(){
				var span = $(this).children("span");
				span.attr('class','can-not-buy');
				var tplId = span.attr("data-value");
				var txt = span.text();
				for(i in skuArr){
					var vals = skuArr[i].vals;
					var skuValArr = vals.split(',');
					for(j in skuValArr){
						var arr = skuValArr[j].split(":");
						if(arr[0]==tplId && arr[1]==txt){
							span.attr('class','can-buy');
							break;
						}
					}
				}
			
			});
		});
	}
	
	$("#addcart").click(function(){
		if(!isSelectedAll){
			$("#tip").attr('class','zs-skin-inner zs-attention');
			return;
		}
// 		window.location.href="${memberDomain}/user/cart_add.do?sku.id="+globalSkuId+"&sku.count=1";
		
		$.get("http://localhost/member/user/cart_add4ajax.do", {'sku.id':globalSkuId,'sku.count':1}, function (status){
			if(status ==1 ){
				$("#cart_pop_mask").show();
				$("#cart_pop").show();
			}else{
				window.location.href="${memberDomain}/login.jsp";
			}
		});
		
		
		
		
		
	});
	
	$("#buynow").click(function(){
		if(!isSelectedAll){
			$("#tip").attr('class','zs-skin-inner zs-attention');
			return;
		}
		window.location.href="${memberDomain}/user/buy.do?sku.id="+globalSkuId+"&count=1";
	});
	
	$("#tip-close").click(function(){
		$("#tip").attr('class','zs-skin-inner');
	});
	
	$("#tip-ok").click(function(){
		$("#tip").attr('class','zs-skin-inner');
	});

});
</script>


<div id="tip" class="zs-skin-inner">
	<div class="zs-hd">
		选择您要的商品信息<i id="tip-close" class="zs-close"></i>
	</div>

<c:forEach var="val" varStatus="s" items="${vals}">
<!-- 颜色类别 -->
<dl class="zs-colour-type">
	<dt>${val.templateName}：</dt>
	<dd>
		<ul class="zs-options clearfix">
			<c:forEach var="v" varStatus="s" items="${val.valueList}">
				<li class="sku" title="${v}"><span data-value="${val.templateId}" class="can-buy">${v}<i></i></span></li>
			</c:forEach>
		</ul>
<!-- 		<div class="zs-suit-infor" id="zp-suit-desc">此号码偏大，建议选【小一号】</div> -->
	</dd>
</dl>

</c:forEach>

	<form action="http://order.zol.com/index.php?c=ConfirmOrder&amp;a=BuyNow" method="post" name="confirmOrderSubmit" id="confirmOrderSubmit">
		<input name="buyType" value="1" type="hidden"> <input name="goodsId" value="22909400" type="hidden"> <input name="merchantId" value="188530" type="hidden"> <input name="fromMerchantId" value="188530" type="hidden"> <input name="promoId" value="29410" type="hidden"> <input name="cartFrom" value="1" type="hidden"> <input name="shareId" value="0" type="hidden"> <input name="zp-choose-goods-number" value="2" id="zp-choose-goods-number" type="hidden"> <input name="zp-choose-goods-price" value="4099.00" id="zp-choose-goods-price" type="hidden"> <input name="zp-is-suit" value="1" id="zp-is-suit" type="hidden">
		<input name="zp-choose-suit-color-id" value="21-5882-0" id="zp-choose-suit-color-id" type="hidden"> <input name="zp-choose-suit-set-id" value="1" id="zp-choose-suit-set-id" type="hidden"> <input name="zp-choose-suit-id" value="0" id="zp-choose-suit-id" type="hidden"> <input name="zp-full-edit-time" value="" type="hidden"> <input name="isContract" value="" type="hidden"> <input name="contractTypeId" value="0" type="hidden"> <input name="contractClassId" value="0" type="hidden"> <input name="contractItemId" value="0" type="hidden"> <input name="phoneNumberPrice" value="0" type="hidden"> <input name="contractPhoneprice" value="0" type="hidden"> <input name="contractPhoneId" value="0" type="hidden"> <input name="contractClassName" value="" type="hidden"> <input name="contractItemPrice" value="0" type="hidden"> <input name="viewTime" value="1451286477" type="hidden">
		<!--提交订单的时间-->


		<!-- 购买数量 -->
		<dl class="zs-quantity">
			<dt>购买数量：</dt>
			<dd class="clearfix">
				<div class="amount-widget">
					<span class="zs-decrease zs-no-decrease"></span> <input id="stock" name="zp-goods-number" title="请输入购买量" value="0" class="zs-goods-number" id="zp-goods-number" fn="zp-goods-number" type="text"> <span class="zs-increase"></span>
				</div>
				<span class="zs-part">件<em class="zs-goods-number-show">（限购2件）</em></span>
				<span class="zs-goods-number-tips" id="zs-goods-number-tips" style="display: none;"></span>
			</dd>
		</dl>
		<!-- 购买数量end -->
		<!-- 立即购买 -->
		<div class="zs-deal-btn clearfix">
			<a style="cursor: pointer;" title="立即购买" class="zs-buy-now" id="buynow">立即购买</a> <a href="javascript:void(0)" class="zs-store-buy" id="addcart" title="加入购物车">加入购物车</a> <a id="tip-ok" href="javascript:void(0)" class="zs-confirm-btn">确认</a>
		</div>
		<!-- 立即购买end -->
	</form>
</div>
							
						
