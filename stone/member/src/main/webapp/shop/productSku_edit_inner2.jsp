<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="resource/js/template.js"></script>

<script>
$(document).ready(function(){
	$(".add").live('click',function(){
		var optionDivs = $(this).prevAll(".optionDivs");
		var arr = $(this).attr("data-value").split(";");
		var categoryId = arr[0];
		var templateId = arr[1];
		var optionsObj =  $(this).prevAll(".optionsVal");
		var options =  optionsObj.val();
		var option = $(this).prevAll(".optionVal").val();
		if(options.length>0){
			options = options+","+option;
		}else{
			options = option;
		}
		
		$.post("shop/templateShop_add4ajax.do", {"categoryId":categoryId,"templateId":templateId,"options":options}, function (status){
			if(status=="1"){
				var opt = '<div class="optionDiv"><input name="std'+templateId+'" type="radio" value="'+option+'"/>'+option+' <a class="del" data-value="'+templateId+'"  href="javascript:void();"> del </a></div>';
				optionDivs.append(opt);
				optionsObj.val(options);
			}
		});
	});
	
	
	$(".del").live('click',function(){
		
		var templateId = $(this).attr("data-value");
		var optionDiv = $(this).parent();
		var optionDivs = optionDiv.parent();
		var optionsVal  = optionDivs.nextAll(".optionsVal");
		optionDiv.remove();
		var optionInputs  = optionDivs.find("input");
		
		var optionArr = new Array();
		optionInputs.each(function(){
			optionArr.push($(this).val());
		});
		var options = optionArr.join(",");
		optionsVal.val(options);
		$.post("shop/templateShop_delete4ajax.do", {"templateId":templateId,"options":options}, function (status){
			if(status!="1"){
				alert("删除出现异常！");
			}
		});
	});
});
</script>


<table border='1'>
<c:forEach var="tpl" varStatus="s" items="${list[1]}">
	<tr>
		<td width=30%>${tpl.name}</td>
		<td>
		<div class="optionDivs">
			<c:forEach var="option" items="${tpl.optionList}">
				<c:set var="isChecked" value="false"/>
				<c:forEach var="val" items="${list[2][0].valList}">
					<c:if test="${tpl.id==val.templateId&&option==val.value}">
						<c:set var="isChecked" value="true"/>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${isChecked}">
						<div class="optionDiv"><input name="std${tpl.id}" type="radio" checked="checked" value="${option}"/>${option} <a class="del" data-value="${tpl.id}"  href="javascript:void();"> del </a></div>
					</c:when>
					<c:otherwise>
						<div class="optionDiv"><input name="std${tpl.id}" type="radio" value="${option}"/>${option} <a class="del" data-value="${tpl.id}"  href="javascript:void();"> del </a></div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<input class="optionVal" type="text" name="option" value=""/>
		<input class="optionsVal" type="hidden" name="options" value="${tpl.options}"/>
		<input class="add" type="button" data-value="${tpl.categoryId};${tpl.id}"  value="添加"/>
		
		
		</td>
	</tr>
</c:forEach>



</table>
