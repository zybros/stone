<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <link rel="shortcut icon" href="resource/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${portalDomain}/resource/css/top.css">
<div id="top">

		<div id="top_main">

			<ul class="topu">

				<li>

					<div class="xing"></div>

					<a href="">收藏金老虎</a>

				</li>



				<li class="xuan">

					<div class="erwei"></div>

					<a href="" class="aa">关注金老虎

						<!-- 将二维图添加进a标签里 -->

						<div class="erweitu"></div>

					</a>					

				</li>



				<li>

				<div class="didian"></div>

				<strong style="padding-left: 20px">北京</strong><a href="" style="padding-left: 0px">[更换]</a>

				</li>



			</ul>

			<div id="hello">
				<c:import url="current_user.jsp"/>
			</div>



			<div class="topright">

				<ul>

					<li>

					<div class="cun">

						<a href="${memberDomain}/user/index.jsp">我的订单</a>

					</div>

						</li>

					<li>

						<div class="cun">

							<div class="vip"></div>

							<a href="">会员俱乐部</a>

						</div>		

					</li>

					<li>

						<div class="cun">

							<div class="bjd"></div>

							<a href="">企业频道</a>

						</div>

					</li>

					<li class="hidetu">

						<div class="cun">

							<a href="" class="dong">手机端</a>

							<div class="phonetu"></div>

							<div class="downjian11"></div>

						</div>

						<div class="erwei">

							<div class="shoudan"></div>

							<div class="jd"></div>

							<div class="span1">

								<span>金老虎客户端</span>

							</div>

							<div class="apple"></div>

							<div class="andr"></div>

							<div class="ewtu"></div>

							<div class="span1">

								<span>网银钱包客户端</span>

							</div>

							<div class="apple"></div>

							<div class="andr"></div>

						</div>

					</li>

					<li class="kefu">

						<div class="cun">

							<div class="a1">

								<div class="kefuhide">

									<span>客户服务</span>

									<div class="downjian1"></div>

									<ul>

										<li><a href="">帮助中心</a></li>

										<li><a href="">售后服务</a></li>

										<li><a href="">在线客服</a></li>

										<li><a href="">投诉中心</a></li>

										<li><a href="">客服邮箱</a></li>

									</ul>

								</div>

							</div>	

						</div>

					</li>

					<li class="wangzhan">

						<div class="cun">

							<span>网站导航</span>

							<div class="downjian1"></div>

						</div>

						<div class="wangzhanhide">

							<div class="tese"><span>特色栏目</span></div>

							<div class="tesemain">

								<a href="">金老虎通信</a>

								<a href="">校园之星</a>

								<a href="">视频购物</a>

								<a href="">金老虎社区</a>

								<a href="">在线读书</a>

								<a href="">装机大师</a>

								<a href="">金老虎E卡　</a>

								<a href="">家装城</a>

								<a href="">搭配购　</a>

								<a href="">我喜欢　</a>

								<a href="">游戏社区</a>

							</div>

							<div class="tese"><span>企业服务</span></div>

							<div class="tesemain1">

								<a href="">企业采购</a>

								<a href="">办公直通车</a>

							</div>

							<div class="tese"><span>旗下网站</span></div>

							<div class="tesemain2">

								<a href="">English Site</a>

							</div>

							

						</div>

					</li>

				</ul>

			</div>

		

		</div>

	</div>

