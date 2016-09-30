<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common_data.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
$(document).ready( function() {
	
	
	var initRegion = function(pid,elementId){
		
		$.post("region_sublist.do?pid="+pid, null, function (list){
			var html = '<option value="0">请选择</option>';
			for(i in list){
				var region = list[i];
				html += '<option value='+region.id+'>'+region.prename+'</option>';
			}
			
			$("#"+elementId).html(html);
		
		});
	}
	
	initRegion(0,"country");
	
	var initRegionNull = function(elementId){
		var html = '<option value="0">请选择</option>';
		$("#"+elementId).html(html);
	}
	
	
	$("#country").change(function(){
		var id = $(this).val();
		initRegion(id,"province");
		initRegionNull("city");
		initRegionNull("district");
		initRegionNull("street");
		
	});
	$("#province").change(function(){
		var id = $(this).val();
		initRegion(id,"city");
		initRegionNull("district");
		initRegionNull("street");
	});
	$("#city").change(function(){
		var id = $(this).val();
		initRegion(id,"district");
		initRegionNull("street");
	});
	$("#district").change(function(){
		var id = $(this).val();
		initRegion(id,"street");
	});
	
	
	
	$("#sub").click(function(){
		var flag = true;
		$(".reg").each(function(){
			if($(this).val()==0){
				alert("请选择具体的区域");
				flag = false;
			}
		});
		
		if(flag){
			var wholeAddr =$("#country").find("option:selected").text()+$("#province").find("option:selected").text()+$("#city").find("option:selected").text()+$("#district").find("option:selected").text();
			
			if($("#street").val()!=0){
				wholeAddr += $("#street").find("option:selected").text();
			}
			
			wholeAddr += $("#address").val();
	
			$("#wholeAddr").val(wholeAddr);
			
			$("#myForm").submit();
		}
		
	});
	
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
新增收货地址
</p>

<FORM id="myForm" METHOD=POST ACTION="use/user_addr_add.do">
  <table border="1" width="80%">
  <tr>
  	<td>国家</td>
  	<td><select class="reg" style="width:100;" id="country" name="country"></select></td>
  </tr>
   <tr>
  	<td>省份</td>
  	<td><select class="reg" style="width:100;" id="province" name="province"></select></td>
  </tr>
   <tr>
  	<td>城市</td>
  	<td><select class="reg" style="width:100;" id="city" name="city"></select></td>
  </tr>
   <tr>
  	<td>区/县</td>
  	<td><select class="reg" style="width:100;" id="district" name="district"></select></td>
  </tr>
  <tr>
  	<td>街道/乡镇</td>
  	<td><select style="width:100;" id="street" name="street"></select></td>
  </tr>
  <tr>
  	<td>村、小区、楼 单元 门牌号</td>
  	<td><INPUT id="address" TYPE="text" NAME="address" value=""></td>
  </tr>
  <tr>
  	<td>邮编</td>
  	<td><INPUT TYPE="text" NAME="postCode" value=""></td>
  </tr>
  <tr>
  	<td>收件人</td>
  	<td><INPUT TYPE="text" NAME="receiver" value=""></td>
  </tr>
   <tr>
  	<td>电话</td>
  	<td><INPUT TYPE="text" NAME="phone" value=""></td>
  </tr>
   <tr>
  	<td>固定电话</td>
  	<td><INPUT TYPE="text" NAME="fixedPhone" value=""></td>
  </tr>
   <tr>
  	<td>是否默认</td>
  	<td>
	  	<INPUT TYPE="radio" NAME="isDefault" value="1" checked="checked">是
	  	<INPUT TYPE="radio" NAME="isDefault" value="0">否
  	</td>
  </tr>
  </table>
  <p>
  <input id="wholeAddr" type="hidden" name="wholeAddr" value=""/>
	<INPUT id="sub" TYPE="button" value="添 加">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>