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
<link href="resource/css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="resource/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	
	// 三级菜单点击
	$('.menuson li').click(function(e) {
        $(".menuson li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>功能菜单</div>
    
    <dl class="leftmenu">
        
    <dd class="region_category">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>区域管理
    </div>
    	<ul class="menuson">
         <li><cite></cite><a href="adm/region/getPrecode.do?grade=0&id=0" target="rightFrame">新增区域</a><i></i></li>
          <li><cite></cite><a href="adm/region/list.do?grade=0&id=0" target="rightFrame">区域列表</a><i></i></li>
        </ul>    
    </dd>
    
    
     <dd class="region_category">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>品牌管理
    </div>
    	<ul class="menuson">
         <li><cite></cite><a href="admin/brand/add.jsp" target="rightFrame">新增品牌</a><i></i></li>
          <li><cite></cite><a href="admin/brand_list.do" target="rightFrame">品牌列表</a><i></i></li>
        </ul>    
    </dd>
    
     <dd class="region_category">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>品类管理
    </div>
    	<ul class="menuson">
         <li><cite></cite><a href="admin/category/categoryAdd.jsp?pid=0" target="rightFrame">新增品类</a><i></i></li>
          <li><cite></cite><a href="adm/category/list.do?pid=0" target="rightFrame">品类列表</a><i></i></li>
        </ul>    
    </dd>
        
    <dd class="region_category">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>品类模板管理
    </div>
    	<ul class="menuson">
         <li><cite></cite><a href="adm/category/list4template.do?pid=0" target="rightFrame">品类模板</a><i></i></li>
        </ul>    
    </dd>
        
     <dd class="region_category">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>品类品牌管理
    </div>
    	<ul class="menuson">
         <li><cite></cite><a href="adm/category/listWithView.do?pid=0&view=/admin/brand/ctg_list" target="rightFrame">品类品牌</a><i></i></li>
        </ul>    
    </dd>
        
     
    <dd class="navigation_ad">
    <div class="title">
    <span><img src="resource/images/leftico02.png" /></span>导航管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="admin/nav/navigation_add.jsp?parentId=0" target="rightFrame">新增导航</a><i></i></li>
        <li><cite></cite><a href="adm/navi_record_list.do?parentId=0" target="rightFrame">导航列表</a><i></i></li>
        </ul>     
    </dd> 
    <dd class="navigation_ad">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>广告管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="admin/ad_list.do" target="rightFrame">广告管理</a><i></i></li>
        <li><cite></cite><a href="admin/ad_loca_list.do?parentId=0" target="rightFrame">广告位管理</a><i></i></li>
        <li><cite></cite><a href="admin/ad_owner_list.do" target="rightFrame">广告商管理</a><i></i></li>
    </ul>
    
    </dd>   
    
     <dd class="navigation_ad">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>团购管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="adm/tuan_ctg_list.do" target="rightFrame">团购栏目</a><i></i></li>
        <li><cite></cite><a href="adm/tuan_list.do" target="rightFrame">团购商品</a><i></i></li>
        <li><cite></cite><a href="adm/tuan_order_list.do" target="rightFrame">团购订单</a><i></i></li>
    </ul>
    
    </dd>   
    
     <dd class="user_group">
    <div class="title">
    <span><img src="resource/images/leftico03.png" /></span>会员管理
    </div>
    <ul class="menuson">
    	<li><cite></cite><a href="admin/user_add.jsp" target="rightFrame">新增会员</a><i></i></li>
        <li><cite></cite><a href="adm/user_list.do" target="rightFrame">会员列表</a><i></i></li>
     </ul>     
    </dd> 
     <dd class="user_group">
    <div class="title">
    <span><img src="resource/images/leftico02.png" /></span>会员等级管理
    </div>
    <ul class="menuson">
    	<li><cite></cite><a href="admin/userGrade_add.jsp" target="rightFrame">新增等级</a><i></i></li>
        <li><cite></cite><a href="adm/userGrade_list.do" target="rightFrame">等级列表</a><i></i></li>
        </ul>     
    </dd> 
    
     <dd class="user_group">
    <div class="title">
    <span><img src="resource/images/leftico01.png" /></span>会员营销
    </div>
    <ul class="menuson">
    	<li>
    	  <div class="header">
            <cite></cite>
            <a href="adm/category/list.do?pid=0" target="rightFrame">模板设置</a>
            <i></i>
            </div>
            <ul class="sub-menus">
            <li><a href="admin/category/categoryAdd.jsp?pid=0" target="rightFrame">短信模板</a></li>
            <li><a href="adm/category/list.do?pid=0" target="rightFrame">邮件模板</a></li>
            <li><a href="adm/category/list.do?pid=0" target="rightFrame">站内信模板</a></li>
            </ul>
            </li>
        <li><cite></cite><a href="adm/user_list.do" target="rightFrame">选择营销</a><i></i></li>
        </ul>     
    </dd> 
    
     <dd class="product_shop">
    <div class="title">
    <span><img src="resource/images/leftico02.png" /></span>店铺管理
    </div>
    <ul class="menuson">
    	<li><cite></cite><a href="admin/shop/shopAdd.jsp" target="rightFrame">新增店铺</a><i></i></li>
        <li><cite></cite><a href="adm/shop/list.do" target="rightFrame">店铺列表</a><i></i></li>
        </ul>     
    </dd> 
    <dd class="product_shop">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>商品管理</div>
    <ul class="menuson">
    <li><cite></cite><a href="adm/category/list4myProduct.do?pid=0" target="rightFrame">自营商品</a><i></i></li>
    <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">店家商品</a><i></i></li>
    </ul>
    
    </dd>  
    
    
      <dd class="cms">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>内容管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="adm/cms_ctg_list.do" target="rightFrame">栏目管理</a><i></i></li>
        <li><cite></cite><a href="adm/cms_content_list.do" target="rightFrame">文章管理</a><i></i></li>
    </ul>
    
    </dd>    
    
    
    <dd class="system">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>静态化</div>
    <ul class="menuson">
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">首页</a><i></i></li>
         <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">专题</a><i></i></li>
         <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">商品详情</a><i></i></li>
         <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">CMS</a><i></i></li>
         <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">分类信息</a><i></i></li>
    </ul>
      </dd> 
    <dd class="system">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>管理员</div>
    <ul class="menuson">
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">添加管理员</a><i></i></li>
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">管理员列表</a><i></i></li>
    </ul>
    </dd>   
    <dd class="system">
    <div class="title"><span><img src="resource/images/leftico04.png" /></span>日志管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">业务操作日志</a><i></i></li>
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">静态化日志</a><i></i></li>
        <li><cite></cite><a href="adm/category/list4product.do?pid=0" target="rightFrame">运行状态日志</a><i></i></li>
    </ul>
    </dd>   
    
    <dd class="system">
    <div class="title">
    <span><img src="resource/images/leftico03.png" /></span>品类模板
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="adm/category/list.do?pid=0" target="rightFrame">品类管理</a>
            <i></i>
            </div>
            <ul class="sub-menus">
            <li><a href="admin/category/categoryAdd.jsp?pid=0" target="rightFrame">新增品类</a></li>
            <li><a href="adm/category/list.do?pid=0" target="rightFrame">品类列表</a></li>
            </ul>
        </li>
          <li>
            <div class="header">
            <cite></cite>
            <a href="adm/category/list4template.do?pid=0" target="rightFrame">模板管理</a>
            <i></i>
            </div>
            <ul class="sub-menus">
            <li><a href="adm/category/list4template.do?pid=0" target="rightFrame">模板列表</a></li>
            </ul>
        </li>
        </ul>    
    </dd>
    
    </dl>
    
</body>
</html>
