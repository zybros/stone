<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				
				$("[name='extra.payable']").click(function(){
					var v = $(this).val();
					if(v==2){
						$("#company").show();
					}else{
						$("#company").hide();
					}
					
				});
				
				$(".shipFee").change(function(){
					var orderSum = 0;
					$(".orderSum").each(function(){
						orderSum += parseFloat($(this).val());
					});
					
					var shipFee = 0;
					$(".shipFee").each(function(){
						shipFee += parseFloat($(this).val());
					});
					
					var price = parseFloat(orderSum) + parseFloat(shipFee);
					$("#tplabel").html(price+" 元");
				});
				
				$(".shipFee").change();
				
			});
</script>
			<div class="row">
				<div class="title">确认订单信息:</div>
				<div class="content">
						<c:forEach var="shop" varStatus="s" items="${shopList}">
						<c:set var="orderSum" value="0"/>
						<div class="shop">
						<table>
						<tr><td colspan="6">
						<b>店铺：${shop.name}</b>
						<input type="hidden" name="orders[${s.index}].shopId" value="${shop.shopId}" /> 
						</td></tr>
						<tr><td width='480px'>商品</td><td width='15%'>单价</td><td width='15%'>数量</td><td width='15%'>小计（元）</td></tr>
						
						<c:set var="detailIndex" value="0"/>
						
						<c:forEach var="product" items="${shop.productList}">
						<c:forEach var="sku" items="${product.skuList}">
						
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].productId" value="${product.id}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].productTile" value="${product.title}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].skuId" value="${sku.id}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].skuNo" value="${sku.skuNo}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].skuImg" value="${product.imgList[0]}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].price" value="${sku.price}" /> 
							<input type="hidden" name="orders[${s.index}].details[${detailIndex}].count" value="${sku.count}" /> 
						
						<tr>
							<td>
								<div style="float:left; margin:10px;left: 10px;position: relative;width:80px;">
								<a href="${portalDomain}/item.jsp?id=${product.id}" target="_blank"><img width='80px' alt="${product.title}" clstag="clickcart|keycount|xincart|cart_sku_pic" src="${itemImgServer}${product.imgList[0]}"></a>
								</div>
								<div style="float:left; margin:10px;left: 10px;position: relative;width:180px;">
								<a href="${portalDomain}/item.jsp?id=${product.id}" target="_blank">${product.title}-${sku.skuNo}</a>
								</div>
								<div style="float:left; margin:10px;left: 10px;position: relative;width:150px;">
								<c:forEach var="val" items="${sku.valList}">
									${val.templateName}:${val.value}<br/>
								</c:forEach>
								</div>
							</td>
							
							<td> ${sku.price}</td><td>${sku.count}</td><td>${sku.price * sku.count}</td>
						</tr>
						<c:set var="orderSum" value="${orderSum + sku.price * sku.count}"></c:set>
						<c:set var="detailIndex" value="${detailIndex+1}"/>
						</c:forEach>
						</c:forEach>
						<tr>
						<td colspan="2">
						备注：<input type="text" name="orders[${s.index}].notes" value="" size='60'/>
						<input class="orderSum" type="hidden" name="orders[${s.index}].orderSum" value="${orderSum}" /> 
						</td>
						<td colspan="2">
								配送方式：
								<select class="shipFee" name="orders[${s.index}].shipFee">
									<option value="0">快递  免邮</option>
									<option value="15">加急  15</option>
								</select>
							</td>
						</tr>
						</table>
						<br/>
						</div>
						</c:forEach>
						<br style="clear: both;" />
					</div>
				</div>
			<div class="row">
				<div class="title">发票信息:</div>
				<div class="content">
					<div style="height:30px;">
						发票抬头：<input name="extra.payable" checked="checked" type="radio" value="1" />个人  <input name="extra.payable" type="radio" value="2" />企业
					</div>
					<div id="company" style="display:none;height:30px;">
						公司名称：<input name="extra.company" type="text" value="" />
					</div>
					<div style="height:30px;">发票内容：
							<input name="extra.contents" checked="checked" type="radio" value="1" />明细<input name="extra.contents" type="radio" value="2" />办公用品
					</div>
				</div>
			</div>
			
			<div class="row">
				<div style="text-align: right; padding-right: 20;padding-top: 10;height:30px;">
					支付金额：<span id="tplabel" style="color:red;"></span>
				</div>
			</div>
			<div class="btn-div">
				<input id="goPay" type="submit" value="提交订单" style="background: rgb(229, 67, 70) none repeat scroll 0% 0%; width: 120px; height: 45px; color: white; font-size: large;font-weight: bolder;"/>
			</div>
