<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.stone.base.system.*"%>
<style>
<!--
ul li{  
list-style-type:none;  
}  
li{
	margin-top:10;
}
-->
</style>
<div
	style="position: absolute; left: 100; width: 200; height: 650px; border: 1px solid red; background: white; padding-top: 20; text-align: left;">
	<ul>
		<li><a href="<%=Domain.item%>/use/cart_list.do">购物车</a></li>
		<li>订单中心
			<ul>
				<li><a href="use/order/list.do">全部订单</a></li>
				<li><a href="use/order/list.do?status=1">待支付订单</a></li>
				<li><a href="use/order/list.do?status=4">已完成订单</a></li>
				<li><a href="use/order/list.do?status=5">已取消订单</a></li>
				<li>退换货订单</li>
			</ul>
		</li>
		<li>用户信息
			<ul>
				<li><a href="use/user/find.do"> 基本信息</a></li>
				<li>密码修改</li>
				<li>安全设置</li>
			</ul>
		</li>
		<li>我发布的信息
			<ul>
				<li>待审核</li>
				<li>已删除</li>
				<li>显示中</li>
			</ul>
		</li>
		<li>收货地址
			<ul>
				<li><a href="user/user_addr_add.jsp">新增收货地址</a></li>
				<li><a href="use/user_addr_list.do">收货地址列表</a></li>
			</ul>
		</li>
	</ul>

</div>