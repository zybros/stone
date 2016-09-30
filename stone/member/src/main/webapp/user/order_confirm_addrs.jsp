<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				
				$("div.addr").click(function(){
					var cls = $(this).attr("class");
					if(cls=="addr"){
						$("div.addr-selected").attr("class","addr");
						$(this).attr("class","addr-selected");
						
						 $(this).children().each(function(){
							 
							 if($(this).attr("name")=='receiver'){
								 $(".receiver").val($(this).val());
							 }else if($(this).attr("name")=='phone'){
								 $(".phone").val($(this).val());
							 }else if($(this).attr("name")=='country'){
								 $(".country").val($(this).val());
							 }else if($(this).attr("name")=='province'){
								 $(".province").val($(this).val());
							 }else if($(this).attr("name")=='city'){
								 $(".city").val($(this).val());
							 }else if($(this).attr("name")=='district'){
								 $(".district").val($(this).val());
							 }else if($(this).attr("name")=='street'){
								 $(".street").val($(this).val());
							 }else if($(this).attr("name")=='address'){
								 $(".address").val($(this).val());
							 }else if($(this).attr("name")=='wholeAddr'){
								 $(".wholeAddr").val($(this).val());
							 }
						 });
						
					}else{
						$(this).attr("class","addr");
					}
					
				});
				
				$("#addAddr").click(function(){
					
					window.location.href = 'user/index.jsp';
					
				});
				
			});
</script>
		
			<div class="row">
				<div class="title">选择收货信息：</div>
				<c:forEach var="o" varStatus="s" items="${addrList}">
					<c:choose>
						<c:when test="${o.isDefault==1}">
							<div class="addr-selected">
								收货人：${o.receiver}<br/>
								地址：&nbsp;&nbsp;${o.wholeAddr}<br/>
								电话：&nbsp;&nbsp;${o.phone}
								
								<input name="receiver" type="hidden" value="${o.receiver}"/>
								<input name="phone" type="hidden" value="${o.phone}"/>
								<input name="country" type="hidden" value="${o.country}"/>
								<input name="province" type="hidden" value="${o.province}"/>
								<input name="city" type="hidden" value="${o.city}"/>
								<input name="district" type="hidden" value="${o.district}"/>
								<input name="street" type="hidden" value="${o.street}"/>
								<input name="address" type="hidden" value="${o.address}"/>
								<input name="wholeAddr" type="hidden" value="${o.wholeAddr}"/>
							</div>
						</c:when>
						<c:otherwise>
							<div class="addr">${o.isDefault}
								收货人：${o.receiver}<br/>
								地址：&nbsp;&nbsp;${o.wholeAddr}<br/>
								电话：&nbsp;&nbsp;${o.phone}
								
								<input name="receiver" type="hidden" value="${o.receiver}"/>
								<input name="phone" type="hidden" value="${o.phone}"/>
								<input name="country" type="hidden" value="${o.country}"/>
								<input name="province" type="hidden" value="${o.province}"/>
								<input name="city" type="hidden" value="${o.city}"/>
								<input name="district" type="hidden" value="${o.district}"/>
								<input name="street" type="hidden" value="${o.street}"/>
								<input name="address" type="hidden" value="${o.address}"/>
								<input name="wholeAddr" type="hidden" value="${o.wholeAddr}"/>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<input class="receiver" type="hidden" name="extra.receiver" value=""/> 
				<input class="phone" type="hidden" name="extra.phone" value=""/> 
				<input class="country" type="hidden" name="extra.country" value=""/> 
				<input class="province" type="hidden" name="extra.province" value=""/> 
				<input class="city" type="hidden" name="extra.city" value=""/> 
				<input class="district" type="hidden" name="extra.district" value=""/> 
				<input class="street" type="hidden" name="extra.street" value=""/> 
				<input class="address" type="hidden" name="extra.addr" value=""/> 
				<input class="wholeAddr" type="hidden" name="extra.wholeAddr" value=""/> 
				
				
				
				
				<div class="addr-new">
						<input id='addAddr' type="button" value="新增收货地址" />
					</div>
				<br style="clear: both;" />
			</div>

