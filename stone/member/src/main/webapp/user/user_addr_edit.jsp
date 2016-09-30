<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/global.css" rel="stylesheet" type="text/css" />
<link href="resource/css/user-info.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready( function() {
	
	var initRegion = function(pid,elementId,val){
		
		$.post("region_sublist.do?pid="+pid, null, function (list){
			var html = '<option value="0">请选择</option>';
			for(i in list){
				var region = list[i];
				if(region.id==val){
					html += '<option selected="selected"  value='+region.id+'>'+region.prename+'</option>';
				}else{
					html += '<option value='+region.id+'>'+region.prename+'</option>';
				}
			}
			
			$("#"+elementId).html(html);
		
		});
	}
	
	
	
	var init = function(){
		var isDefault = "${addr.isDefault}";
		if(isDefault==1){
			$("#defaultY").attr("checked","checked");
		}else{
			$("#defaultN").attr("checked","checked");
		}
		
		initRegion(0,"country","${addr.country}");
		initRegion("${addr.country}","province","${addr.province}");
		initRegion("${addr.province}","city","${addr.city}");
		initRegion("${addr.city}","district","${addr.district}");
		initRegion("${addr.district}","street","${addr.street}");
	}
	init();
	
	
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
	
	
	

	$("#myForm").submit(function(){
		
		$(".reg").each(function(){
			if($(this).val()==0){
				alert("请选择具体的区域");
				return;
			}
		});

		var wholeAddr =$("#country").find("option:selected").text()+$("#province").find("option:selected").text()+$("#city").find("option:selected").text()+$("#district").find("option:selected").text();
		
		if($("#street").val()!=0){
			wholeAddr += $("#street").find("option:selected").text();
		}
		
		wholeAddr += $("#address").val();

		$("#wholeAddr").val(wholeAddr);
		
		return true;
		
	});
	
});
</script>
</head>
<body>
<center>
		<div id="right">
<p>
修改收货地址
</p>

<FORM id="myForm" METHOD=POST ACTION="use/user_addr_update.do">
  <table border="1">
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
  	<td><INPUT id="address" TYPE="text" NAME="address" value="${addr.address}"></td>
  </tr>
  <tr>
  	<td>邮编</td>
  	<td><INPUT TYPE="text" NAME="postCode" value="${addr.postCode}"></td>
  </tr>
  <tr>
  	<td>收件人</td>
  	<td><INPUT TYPE="text" NAME="receiver" value="${addr.receiver}"></td>
  </tr>
   <tr>
  	<td>电话</td>
  	<td><INPUT TYPE="text" NAME="phone" value="${addr.phone}"></td>
  </tr>
   <tr>
  	<td>固定电话</td>
  	<td><INPUT TYPE="text" NAME="fixedPhone" value="${addr.fixedPhone}"></td>
  </tr>
   <tr>
  	<td>是否默认</td>
  	<td>
	  	<INPUT id="defaultY" TYPE="radio" NAME="isDefault" value="1">是
	  	<INPUT id="defaultN" TYPE="radio" NAME="isDefault" value="0">否
  	</td>
  </tr>
  </table>
  <p>
  <input type="hidden" name="id" value="${addr.id}" />
  <input id="wholeAddr" type="hidden" name="wholeAddr" value="${addr.wholeAddr}"/>
	<INPUT TYPE="submit" value="修改">
	</p>
 </FORM>
 </div>
</center>
</body>
</html>