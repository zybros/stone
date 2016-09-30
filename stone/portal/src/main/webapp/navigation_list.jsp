<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common_data.jsp" %>
<link rel="stylesheet" type="text/css" href="${portalDomain}/resource/css/list_hot1.css" media="all">
<link rel="stylesheet" type="text/css" href="${portalDomain}/resource/css/navi-list.css">
<!-- 导航条区域开始 -->

<script type="text/javascript">
	$().ready(function(){
		$("li[class^='row-nav-item']").each(function(index){
			if(index=="${nav}"){
				$(this).children("a").attr("style","background: #A40000");
			}else{
				$(this).children("a").attr("style","");
			}
			
		});
		
		
		$("li[class^='row-nav-item']").click(function(){
			var nav = $(this).attr("class");
			nav = nav.substring(12);
			var url = $(this).children(":first").attr("url");
			url = url+"?nav="+nav;
			window.open(url, "_blank");
		});
	
	});
</script>

<div id="daohang">

	<div class="dhleft">

		<a href="#">全部商品分类</a>
		
		<div id="erjimenu" class="erjimenu">

			<ul>
			
			<c:forEach var="r" varStatus="s" items="${columnList}">

			<li class="li1">
			<div class="mulu">
			<c:forEach var="f" varStatus="s2" items="${r.fieldList}">
				<c:choose> 
				<c:when test="${s2.index==0}">  
					<a href="${f.url}" >${f.name}</a>
				  </c:when> 
				  <c:otherwise>   
				   、 <a href="${f.url}">${f.name}</a>
				  </c:otherwise> 
				</c:choose> 
			</c:forEach>
			<div class="jian"></div>
			<div class="bai"></div>
			</div>
			<div class="hidemenu">

						<div class="hideleft">
						
						<c:forEach var="r2" items="${r.sublist}">
							<dl class="dl1">
								<dt>
									<c:forEach var="f" varStatus="s2" items="${r2.fieldList}">
									<c:choose> 
										<c:when test="${s2.index==0}">  
											<a href="${f.url}" >${f.name}</a>
									  	</c:when> 
										  <c:otherwise>   
										   、 <a href="${f.url}">${f.name}</a>
										  </c:otherwise> 
									</c:choose> 
									</c:forEach>
								</dt>  
								
								<c:forEach var="r3" items="${r2.sublist}">
								<dd>
								<c:forEach var="f" varStatus="s2" items="${r3.fieldList}">
										<a href="${f.url}" >${f.name}</a>
									</c:forEach>
								</dd>
								</c:forEach>
							</dl>
						</c:forEach>
						</div>

						<div class="hideright">

							<div class="game"></div>

							<dt>推荐品牌</dt>

        						<ul>

	        						<li><a href="">得力旗舰店</a></li>

									<li><a href="">宏碁旗舰店</a></li>

									<li><a href="">神舟旗舰店</a></li>

									<li><a href="">HP旗舰店</a></li>

									<li><a href="">清华同方旗舰店</a></li>

									<li><a href="">ThinkPad旗舰店</a></li>

									<li><a href="">齐心旗舰店</a></li>

									<li><a href="">暴雪旗舰店</a></li>

									<li><a href="">罗技旗舰店</a></li>

									<li><a href="">TP-LINK旗舰店</a></li>

									<li><a href="">台电旗舰店</a></li>

									<li><a href="">微软旗舰店</a></li>

									<li><a href="">金士顿旗舰店</a></li>

									<li><a href="">HKC旗舰店</a></li>

        						</ul>

	

							</dl>

							<div class="tu3">

								<a href=""><img width="194px" height="70px" src="images/b9.jpg" alt="" /></a>

							</div>

							<div class="tu1">

								<a href=""><img width="194px" height="70px" src="images/b10.jpg" alt="" /></a>

							</div>

						</div>

					</div>
			</li>
			</c:forEach>
		</ul>
		</div>

	</div>

	<div class="dhright">

		<ul>

<c:forEach var="o" varStatus="s" items="${rowList}">

<li class="row-nav-item${s.index}">
<c:forEach var="f" varStatus="s2" items="${o.fieldList}">
	<c:choose> 
	<c:when test="${s2.index==0}">  
		 
		<a url="${f.url}" href="javascript:void();" <c:if test="${s.index==0}">style="background: #A40000"</c:if>>${f.name}</a>
	  </c:when> 
	  <c:otherwise>   
	   , <a url="${f.url}" href="javascript:void();">${f.name}</a>
	  </c:otherwise> 
	</c:choose> 
</c:forEach>
</li>

</c:forEach>
</ul>

<!-- 		<div class="dhtu"> -->

<!-- 			<ul> -->

<!-- 				<li class="on"><img src="images/a3.png" alt="" /> -->

<!-- 					<div class="zeng"><span>4.2610%</span></div> -->

<!-- 				</li> -->

<!-- 				<li><img src="images/a4.png" alt="" /></li> -->

<!-- 			</ul> -->

<!-- 		</div> -->

	</div>

</div>

<!-- 导航条区域结束 -->