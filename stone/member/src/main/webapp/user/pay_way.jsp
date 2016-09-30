
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resource/css/pay.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	$(document).ready(
			function() {			
		
		$("#payBtn").click(function(){
			
			var type = 2;
			$("input[name='type']").each(function(){
				if($(this).attr("checked")=='checked'){
					type = $(this).val();
				}
			});
			
			
			if(type==1){
				window.location.href="https://cashier.95516.com/b2c/index.action?transNumber=201512151827476173028";
			}else if(type==2){
				window.location.href="https://excashier.alipay.com/standard/trade20001/templateFlow.htm?orderId=ab660a5fd50349bdaedf914235fabd73&action=init";
			}else{
				window.location.href="http://www.icrail.com/WXZF.html?OrderNumber=PASS_20151215271973&orderid=4703&pay=3330.00";
			}
			
		});
		
				
				
				
				
				
				
			});
	</script>
	
	<div class="payway-title">选择支付方式</div>

	<div class="payway">
		<div class='item'>
		<div class="radio-vertical-middle"><input name="type" type="radio" value="1"/></div>
		<div class="pay-img"><img alt="银联支付" src="resource/images/unionpay.png"></div>
		</div>
		<div class='item'>
		<div class="radio-vertical-middle"><input checked="checked" name="type" type="radio" value="2"/></div>
		<div class="pay-img"><img alt="支付宝支付" src="resource/images/alipay_jishi.png"></div>
		</div>
		<div class='item'>
		<div class="radio-vertical-middle"><input name="type" type="radio" value="3"/></div>
		<div class="pay-img"><img alt="微信支付" src="resource/images/weixinpay.png"></div>
		</div>
	</div>
	
	<div id="payBtn" class="pay-btn"><input type="button" value="去支付" style="background: rgb(229, 67, 70) none repeat scroll 0% 0%; width: 120px; height: 45px; color: white; font-size: large;font-weight: bolder;"/></div>

