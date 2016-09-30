<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="common_data.jsp" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      
<script>
$(document).ready( function() {
		//初始f1的头部标题
		var initHeadf1 = function(){
			$.get("ad_loca_listByPid4ajax.do?parentId=1057", null, function (items){
				var headf1Html ="";
				for(var i=0;i<items.length;i++){
					var loca = items[i];
					if(i==0){
						headf1Html += '<li><h3 style="color:#E4393C">'+loca.locationName+'</h3></li>';
					}else{
						headf1Html += '<li><h3>'+loca.locationName+'</h3></li>';
					}
				}
				headf1Html += '<div class="huakuai"></div>';
				$("#headf1").html(headf1Html);
			});
		}
		initHeadf1();
		
		//初始f1特价中的商品（除推荐轮播图）
		var initTJotherOfF1 = function(){
			$.get("ad_listByLocation4ajax.do?locationId=1059", null, function (items){
				var html ="";
				for(var i=0;i<items.length;i++){
					var loca = items[i];
					html += '<div class="centu" style="border-bottom:1px solid #eee"><div class="tu"><img src="${adImgServer}'+loca.adImg+'" alt="" /></div><div class="p_name"><a href="">32“智能电视限量预约121 2, 48“智能电视预约2499</a></div><div class="price"><span style="color:#E4393C">提前预约就是任性</span></div></div>';
				}
				$("#f1_tejia_other").html(html);
			});
		}
		initTJotherOfF1();
		
		//初始f1特价中推荐轮播图
		var initTJlunboOfF1 = function(){
			$.get("ad_listByLocation4ajax.do?locationId=1058", null, function (items){
				var html ="";
				var htmlHot="";
				for(var i=0;i<items.length;i++){
					var loca = items[i];
					html+='<img src="${adImgServer}'+loca.adImg+'" alt="" />';
					if(i==0){
						htmlHot+='<li style="background:#7ABD54"></li>';
					}else{
						htmlHot+='<li></li>';
					}
				}
				$("#f1_lunbo_img").html(html);
				$("#f1_lunbo_hot").html(htmlHot);
			});
		}
		initTJlunboOfF1();
		
		
		//初始f1品牌男装
		var initTitle1OfF1 = function(){
			$.get("ad_listByLocation4ajax.do?locationId=1051", null, function (items){
				var html ="";
				for(var i=0;i<items.length;i++){
					var loca = items[i];
					html += '<div class="centu"><div class="tu"><img src="${adImgServer}'+loca.adImg+'" alt="" /></div><div class="p_name"><a href="">'+loca.adName+'</a></div><div class="price"><span style="color:#E4393C">￥<b style="font-size:16px">3599</b>.00</span></div></div>';
				}
				$("#f1_title1").html(html);
			});
		}
		initTitle1OfF1();
		
	})
</script>
      
<!-- 1楼开始 -->

<div id="onefloor">

<!-- 1楼顶部开始 -->

	<div class="one_top">

		<div class="louceng">

			<h2>家电通讯</h2>

			<div class="lou"><span>1F</span></div>

		</div>

		<ul id="headf1">

			<li><h3 style="color:#E4393C">特价商品</h3></li>

			<li><h3>大家电</h3></li>

			<li><h3>小家电</h3></li>

			<li><h3>手机通讯</h3></li>

			<li><h3>汽车五金</h3></li>

			<div class="huakuai"></div>

		</ul>

<!-- 		<div class="peisong"> -->

<!-- 			<a href="">大家电配送<b></b></a> -->

<!-- 			<a href="">合约计划说明<b></b></a> -->

<!-- 		</div> -->

	</div>

<!-- 1楼顶部结束 -->

	<div class="onemain">

	<!-- 1楼左边开始 -->
	
		<c:url value="ad_listByLocation.do?locationId=1053&page=/page/floor/index_floor_left" var="txtUrl"/>
		<jsp:include page="${txtUrl}"/>
		
	<!-- 1楼左边结束 -->



		<!-- 1楼中间开始 -->

		<div class="maincenter">

		<!-- 1楼特价商品开始 -->

			<div id="f1_tejia" class="cent1" style="display:block">


					<div class="cenlunbo">

					<div id="f1_lunbo_img" class="luntu">

						<img data-url='${adImgServer}nn1.jpg' src="${adImgServer}pix.png" alt="" />

						<img data-url='${adImgServer}nn2.jpg' src="${adImgServer}pix.png" alt="" />

						<img data-url='${adImgServer}nn3.jpg' src="${adImgServer}pix.png" alt="" />

						<img data-url='${adImgServer}nn4.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<ul id="f1_lunbo_hot">

						<li style="background:#7ABD54"></li>

						<li></li>

						<li></li>

						<li></li>

					</ul>

				</div>

				<div id="f1_tejia_other">
				<div class="centu" style="border-bottom:1px solid #eee">

					<div class="tu">

						<img data-url='${adImgServer}n1.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">32“智能电视限量预约121 2, 48“智能电视预约2499</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">提前预约就是任性</span>

					</div>

				</div>

				<div class="centu" style="border-bottom:1px solid #eee">

					<div class="tu">

						<img data-url='${adImgServer}n2.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">广东电信QQ特权卡，免流量再送QQ会员！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">100</b>.00</span>

					</div>

				</div>

				<div class="centu" style="border-right:1px solid #eee">

					<div class="tu">

						<img data-url='${adImgServer}n3.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">小家电·Double12裸价备战！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">爆款低价抢先看！</span>

					</div>

				</div>

				<div class="centu" style="border-right:1px solid #eee">

					<div class="tu">

						<img data-url='${adImgServer}n4.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">诺基亚 Lumia 930 提前放价！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2799</b>.00</span>

					</div>

				</div>

				<div class="centu" style="border-right:1px solid #eee">

					<div class="tu">

							<img data-url='${adImgServer}n5.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">严寒冬日，奥克斯温暖多一度!</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">1699</span>

					</div>

				</div>

				<div class="centu" style="border-right:1px solid #eee">

					<div class="tu">

							<img data-url='${adImgServer}n6.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">12.12爆款热卖电视提前抢</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">42英寸4K电视2499元</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n7.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">1212抢钱啦</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">低至4折</span>

					</div>

				</div>
			</div>
			</div>

			<!-- 1楼特价商品结束 -->



			<!-- 1楼大家电开始 -->

			<div id="f1_title1" class="cent1">

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n8.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【索尼品牌日】索尼（SONY） KDL-42W700B</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">3599</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n9.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【索尼品牌日】索尼（SONY）KDL-50W700B</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">5099</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n10.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【索尼品牌日】索尼（SONY） KDL-60WM15B</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">6999</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n11.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【有钱！任性！0元购！】荣事达 8公斤 滚筒 洗衣机</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2098</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n12.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【畅销型号，不买不爽快】格兰仕6公斤云系列节</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1212</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n13.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">索尼（Sony）KDL-50W800B 50英寸 液晶 电视</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">6169</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n14.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">飞利浦（PHILIPS）AJ7260D/93 迷你音响 iphone</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">799</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n15.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">三菱电机 MFZ-XEJ60VA 2.5匹 立柜式冷暖变频空调</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">11800</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n16.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">TCL6公斤 1200转惊艳超薄滚筒洗衣机（芭蕾白）</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1499</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n17.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">海尔80升双管遥控电热水器！特价仅此一天！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1398</b>.00</span>

					</div>

				</div>

			</div>

			<!-- 1楼大家电结束 -->



			<!-- 1楼小家电开始 -->

			<div class="cent1">

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n18.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">疯抢开始，大金经典爆款，给你清新空气！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1999</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

						<img data-url='${adImgServer}n19.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【限时抢，1:1废水，UV抑菌】A.O.史密斯（A.O.Smith）SR50-H3 家用反渗透净水器 厨下式净水机

						【限时抢，1:1废水，UV抑菌】A.O.史密斯（A.O.S</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">4688</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}20.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">极致爆款！志高 13片劲暖电热油汀13I</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">279</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n21.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【1212爆款免单促销中】贝尔斯顿 三档转速电控原</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">698</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n22.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【惊爆价！】科沃斯魔镜S扫地机器人</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">999</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n23.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">爆款提前抢！九阳倍浓植物奶牛豆浆机 给你浓浓的</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">399</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n24.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【12.12惊喜狂欢大趴】买就赠49元足浴药包 加1</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">279</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n25.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">澳柯玛（AUCMA）AMB-201 家用全自动馒头面包一</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">299</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n26.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">亚都（YADU）YZ-DS252C 双水箱净化型加湿器</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">599</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n27.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">净美仕(Mfresh)YL-7099H 空气净化器 除甲醛 雾霾 </a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2780</b>.00</span>

					</div>

				</div>

			</div>

			<!-- 1楼小家电结束 -->



			<!-- 1楼手机通讯开始 -->

			<div class="cent1">

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n28.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">酷派 大神F2 移动版 4G手机 双卡双待</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">899</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n29.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">iPhone 6 Plus 16G版 移动版（深空灰）</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">6088</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n30.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">魅族 MX3 32G仅需1499！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1499</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n31.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">酷派大神F1 电信4G 手机（智尚白）FDD-LTE/CD</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">888</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n32.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">中兴V5 Max 现货疯抢！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">999</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n33.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">华为 Ascend P7 移动4G手机（白色）TD-LTE/TD-</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2388</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n34.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">三星 Galaxy S4 I9508V 4G手机（玫瑰金） TD-LTE</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2588</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n35.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">联想 笋尖S90u 联通4G手机（宝石银）TD–LTE/W</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1999</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

						<img data-url='${adImgServer}n36.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">vivo Xplay3S移动联通双4G手机，影音旗舰！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">2998</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

						<img data-url='${adImgServer}n37.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">飞毛腿 双USB 移动电源 20000毫安 金色</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">118</b>.00</span>

					</div>

				</div>

			</div>

			<!-- 1楼手机通讯结束 -->

			<!-- 1楼汽车五金开始 -->

			<div class="cent1">

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n38.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【299疯抢】嘉实多(CASTROL) 动力版极护(EDGE </a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">299</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n39.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">夏普车载净化器！洁净空气！净化体验！</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">799</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n40.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【赠滤网一个】3M菲尔萃车载净化器KJEC05</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1580</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n41.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">华丰巨箭 46件精品套筒组套 6.3MM铬钒钢套筒S2批</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">129</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n42.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【金老虎自营】丰田（TOYOTA）原厂全合成机油 0</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">95</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n43.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【12.12疯抢价赠打蛋器】博世TSR 10.8v充电式</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">325</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n44.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【金老虎自营】亿力 YILI YLQ5660G-140B亿力高压</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">899</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n45.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">12.12 金老虎自营 蓝贝尔 应急启动电源</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">368</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n46.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">12.12 奔跑吧GiGi 裸奔的价格 至尊的品质</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">199</b>.00</span>

					</div>

				</div>

				<div class="centu">

					<div class="tu">

							<img data-url='${adImgServer}n47.jpg' src="${adImgServer}pix.png" alt="" />

					</div>

					<div class="p_name">

						<a href="">【12.12提前开抢！】裕津韩国原装进口 HP-2500</a>

					</div>

					<div class="price">

						<span style="color:#E4393C">￥<b style="font-size:16px">1799</b>.00</span>

					</div>

				</div>

			</div>

			<!-- 1楼汽车五金结束 -->

		</div>

		<!-- 1楼中间结束 -->



		<!-- 1楼右侧开始 -->

		<div class="mainright">

			<ul>

				<li><img data-url='${adImgServer}n48.gif' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n49.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n50.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n51.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n52.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n53.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n54.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n55.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n56.jpg' src="${adImgServer}pix.png" alt="" /></li>

				<li><img data-url='${adImgServer}n57.jpg' src="${adImgServer}pix.png" alt="" /></li>

			</ul>

			<div class="righttu">

				<div class="rightlun">

					<img data-url='${adImgServer}n58.jpg' src="${adImgServer}pix.png" alt="" />

					<img data-url='${adImgServer}n59.jpg' src="${adImgServer}pix.png" alt="" />

				</div>

				<ul>

					<li style="background:#7ABD54"></li>

					<li></li>

				</ul>			

			</div>

		</div>

		<!-- 1楼右侧结束 -->

	</div>

</div>

<!-- 1楼结束 -->

