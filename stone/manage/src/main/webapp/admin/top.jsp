<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>"/>
<link href="resource/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
ul li{
	cursor:pointer;
}
ul li a span{
	color:white; font-size:130%;
}
</style>

<script type="text/javascript"src="resource/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var init = function(){
		var leftDoc = $(window.parent.frames["leftFrame"].document);
		leftDoc.find("dd").hide();;
		leftDoc.find("dd.region_category").show();
	}
	
// 	init();
	
	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
		var id = $(this).attr("id");
		var leftDoc = $(window.parent.frames["leftFrame"].document);
		leftDoc.find("dd").hide();;
		leftDoc.find("dd."+id).show();
		
		
	})	
	
	$("#logout").click(function(){
		window.parent.parent.location.href="admin/logout.do";
	});
	
	
})	
</script>


</head>

<body style="background:url(resource/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img height="80" src="resource/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a id="region_category" target="rightFrame" class="selected"><img src="resource/images/icon01.png" /><span>区域品类</span></a></li>
    <li><a id="user_group" target="rightFrame"><img src="resource/images/icon06.png" /><span>会员管理</span></a></li>
    <li><a id="navigation_ad" target="rightFrame"><img src="resource/images/icon02.png" /><span>导航广告 </span></a></li>
    <li><a id="product_shop" target="rightFrame"><img src="resource/images/icon03.png" /><span>商品店铺</span></a></li>
    <li><a id="order" target="rightFrame"><img src="resource/images/icon05.png" /><span>订单管理</span></a></li>
    <li><a id="cms" target="rightFrame"><img src="resource/images/icon04.png" /><span>内容管理</span></a></li>
    <li><a id="navigation_ad" target="rightFrame"><img src="resource/images/icon02.png" /><span>促销专题</span></a></li>
    <li><a id="message" target="rightFrame"><img src="resource/images/icon05.png" /><span>分类信息</span></a></li>
    <li><a id="system" target="rightFrame"><img src="resource/images/icon06.png" /><span>系统设置</span></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="resource/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="admin/logout.do" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${sessionScope.admin.username}</span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>

</body>
</html>
