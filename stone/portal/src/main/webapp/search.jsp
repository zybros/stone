<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common_data.jsp" %>
    <link rel="stylesheet" type="text/css" href="${portalDomain}/resource/css/search.css">
    
   <script type="text/javascript">
		$().ready(function(){
			
			var initCartCount = function(){
				var url = "${memberDomain}/user/getCartCount4ajax.do";
				$.post(url,null, function (count){
					if(count>0){
						$("#cart_count").text(count);
					}
				});
			}
			initCartCount();
			
			
			$("#searchButton").click(function(){
				var keywords = $("#keywords").val();
				window.location.href = "search_all.html?keywords="+keywords;
			});
		});
    
    </script>
<div id="serach">

		<div class="logo">

			<a href="${portalDomain}"><img src="${portalDomain}/resource/images/logo.png" alt="" /></a>

		</div>

		<div class="sou">

			<div class="sousuo">
			<form id="myForm" action="search_all.html" method="post">
			<input id="keywords" name="keywords" type="text" class="kuang" value="手机" style="color:#999;font-size:14px" />

				<div id="searchButton" class="souzi"><a href="javascript:void();">搜索</a></div>
			</form>
			</div>

			<div class="reci">

				<span>热门搜索:</span>	

				<a href="" style="color:red">校园之星</a>

				<a href="">影院到家</a>


				<a href="">腕表领券</a>

				<a href="">自营满减</a>

				<a href="">N3抢购</a>

				<a href="">图书换购</a>

				<a href="">12.12</a>

			</div>

		</div>

		<div class="myjd">

			<div class="mytu"></div>

			<a href="${memberDomain}/user/index.do">我的金老虎</a>

			<div class="jiantou"></div>



			<div class="myjdhide">

				<div class="hello">

					<span>您好，请</span>

					<a href="">登录</a>

				</div>

				<div class="hey">

					<div class="heyleft">

						<ul>

							<li><a href="">待处理订单</a></li>

							<li><a href="">咨询回复</a></li>

							<li><a href="">降价商品</a></li>

							<li><a href="">返修退换货</a></li>

							<li><a href="">优惠券</a></li>

						</ul>

					</div>

					<div class="heyright">

						<ul>

							<li><a href="">我的关注></a></li>

							<li><a href="">我的京豆></a></li>

							<li><a href="">我的理财></a></li>

							<li><a href="">我的白条></a></li>

						</ul>

					</div>

				</div>

				<div class="hidebot">

					<div class="bottop">

						<span>最近浏览的商品:</span>

						<a href="">查看浏览历史></a>

					</div>

					<div class="botdown">

						<span>「暂无数据」</span>

					</div>

				</div>

			</div>

		</div>

		<div class="gouwuche">

			<div class="chetu"></div>

			<a href="${memberDomain}/user/cart_list.do">去购物车结算</a>

			<div class="jianleft"></div>

			<div class="num">

				<div class="numright"></div>

				<div class="numzi"><span id="cart_count">0</span></div>

			</div>

			<div class="hideche">

				<div class="kongche"></div>

				<span>购物车中还没有商品，赶紧选购吧！</span>

			</div>

		</div>


	</div>