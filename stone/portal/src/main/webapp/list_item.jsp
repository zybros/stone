<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common_data.jsp" %>

  <link href="resource/css/list_zolcom_index.css" rel="stylesheet">
  <link href="resource/css/list_side_toolbar.css" rel="stylesheet" type="text/css">
  <script src="resource/js/jquery-1.7.2.min.js"></script>
  <link href="resource/css/list_v2.css" rel="stylesheet" type="text/css">
        <style>
            /*防止IE6顶部固定导航闪动所加样式*/
            *html{
                background-image:url(about:blank);
                background-attachment:fixed;
            }
            .none{display: none;}
        </style>
        <script>
        
        $(function() {
        	
        	
        	var initBrand = function(categoryId){
        		 
        		$.get("brand_listByCtgId4ajax.do?ctgId="+ categoryId,null,function(items) {
					var html = "";
					for(var i in items){
						var id = items[i].id;
						var name = items[i].name;
						var img = items[i].img;
						if(items[i].id=='${selector.brandId}'){
							html += '<li id="'+id+'" class="brand_img hover" style="display: block;"><a href="javascript:void();" title="'+name+'">'+name+' <img src="${baseImgServer}'+img+'" height="40" width="80"></a></li>';
						}else{
							html += '<li id="'+id+'" class="brand_img " style="display: block;"><a href="javascript:void();" title="'+name+'"> '+name+'<img src="${baseImgServer}'+img+'" height="40" width="80"></a></li>';
						}
					}
					$("#brandsUL").html(html);
				});
        	}
    		
        	initBrand("${product.cid}");
        	
        	
        	$("[class^='brand_img ']").live("mouseover",function(){
                $(this).attr("class","brand_img hover");
            }).live("mouseout",function(){
            	$(this).attr("class","brand_img ");
            });
        	
        	$("[class^='brand_img ']").live("click",function(){
                var id = $(this).attr("id");
                $("#brandId").val(id);
                $("#selectorForm").submit();
            });
    		
        	var exts = ${selector.exts};
        	var selectorCount = exts.length;
        	var initSelector = function(categoryId){
       		 
        		$.get("template_getCanSearchByCid4ajax.do?cid="+ categoryId,null,function(items) {
        			
					var html = "";
					for(var i in items){
						html += '<div class="prop-item" style="display: block;"><dl><dt>'+items[i].name+'：</dt><dd><ul>';
						
						var itemHtml="";
						var arr = items[i].options.split(",");
						for(var j in arr){
							var color = '';
							for(var j2 in exts){
								var ext = exts[j2];
								if(ext.templateId==items[i].id){
									if(ext.value==arr[j]){
										color = 'red';
										var tmpHtml = '<input type="hidden" name="extList['+selectorCount+'].templateId" value="'+ext.templateId+'"/>'+
						        		'<input id="'+ext.templateId+'" type="hidden" name="extList['+selectorCount+'].value" value="'+ext.value+'"/>';
						        		$("#selectorForm").append(tmpHtml);
						        		selectorCount++;
										break;
									}
								}
							}
							itemHtml += '<li><a class="select_field" href="javascript:void();" templateId="'+items[i].id+'" value="'+arr[j]+'"><font color="'+color+'">'+arr[j]+'</font></a></li>';
						}
						html += itemHtml;
						
						html += '</ul></dd></dl></div>';
					}
					$("#selectebox").append(html);
				});
        	}
    		
        	initSelector("${product.cid}");
        	
        	$(".select_field").live("click",function(){
        		var templateId = $(this).attr("templateId");
        		var value = $(this).attr("value");
        		if($("#"+templateId).val()==undefined){
        			var html = '<input type="hidden" name="extList['+selectorCount+'].templateId" value="'+templateId+'"/>'+
            		'<input type="hidden" name="extList['+selectorCount+'].value" value="'+value+'"/>';
            		$("#selectorForm").append(html);
        		}else{
        			$("#"+templateId).val(value);
        		}
        		
        		$("#selectorForm").submit();
// 				window.location.href="list.jsp?cid=${selector.cid}&productId=0&templateId="+$(this).attr("templateId")+"&value="+$(this).attr("value");
        	});
        	
        	

    	});
        
        
        
        </script>
    
	
	

	<!-- 热卖推荐  -->
	
<link rel="stylesheet" type="text/css" href="resource/css/list_hot1.css" media="all">

<link rel="stylesheet" type="text/css" href="resource/css/list_hot2.css" media="all">

	<div reco_id="3" class="w"><div id="J_promHotsaleWrap_46" class="hot-sales"><div id="hotsale" class="hot-sales-main J_promGoodsWrap_46">                <div class="hd">热卖推荐</div>                <div class="bd mc">                    <ul data-type="46" class="mc list-h clearfix">                      <li data-sku="1//x.jd.com/dsp/np?log=Jj2NCSKsPC8NEh8+RjsORAHRKOiTWSDovk+PYD03fgfwmxveyGJFx1ZzrTA5Vph67NSbAYZI3XFBAI4Ps4aMVnqcPodjjUriDLBsHsQX4qi3Rrq4Kx/6Zm1bN+8PMY/Q4SIlqRuYHdc1vx6qbOhsXtupXwQF5KJp+6akp954OpaMaImr0D8Zo9JOjguyp1KibZRMj2XGBWHM/NM6IdQJ6SNudwsYsyzj9jmhK7z/3gSquzSNK9T5IJQI4E++dAPgo8f/T3qILMoOHa1EFCpm6heWOj4LIxFU6LxK78ovGPVrfSvzR2CMsJZTSIHyLtYYG0s1h2mQyXMx/a8XmdcKdfbi43e2CMoUPDV61pjnkd8YNeSNTWqDmkRnUSg2XXoY2sld9TvtTOEn2G0dWmlUi4NwOYnlBLxvyOq93sUXWRNY7TJYjcDE1wjADnPCXXd9+PjFqCFH5v4nHv2vJ2clfLId3tIqWxMNnyERTwZLSoI=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "1", "1326953", "2", "1", "C")'>                          <a class="p-img" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwNTY5MDNfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMjY5NTMuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgfwmxveyGJFx1ZzrTA5Vph67NSbAYZI3XFBAI4Ps4aMVnqcPodjjUriDLBsHsQX4qi3Rrq4Kx_6Zm1bN-8PMY_Q4SIlqRuYHdc1vx6qbOhsXtupXwQF5KJp-6akp954OpaMaImr0D8Zo9JOjguyp1KiD-1ZAGjsol6xrPSRL1BvKiaw-euVdgq_eXwuDGwGGJ1t0q-BW5flac4KL6eS4NGA4FHXKfFVxot1vgPH9gmJ5ayPgi9bf0ZdfIfrVyWTAEjr5YEK_HbtZnxOB2Ft2JHzGO1wrDieLBcc5lsxMmwDFLF2c9vGmyOA8cIQ0QU2NGWsam4OB49kQO7vpsg29RBg&amp;v=404" title="摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机">                              <img data-img="1" src="${adImgServer}55496595Nff838baf.jpg" class="err-product" height="100" width="100">                          </a>                          <a class="p-name" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwNTY5MDNfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMjY5NTMuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgfwmxveyGJFx1ZzrTA5Vph67NSbAYZI3XFBAI4Ps4aMVnqcPodjjUriDLBsHsQX4qi3Rrq4Kx_6Zm1bN-8PMY_Q4SIlqRuYHdc1vx6qbOhsXtupXwQF5KJp-6akp954OpaMaImr0D8Zo9JOjguyp1KiD-1ZAGjsol6xrPSRL1BvKiaw-euVdgq_eXwuDGwGGJ1t0q-BW5flac4KL6eS4NGA4FHXKfFVxot1vgPH9gmJ5ayPgi9bf0ZdfIfrVyWTAEjr5YEK_HbtZnxOB2Ft2JHzGO1wrDieLBcc5lsxMmwDFLF2c9vGmyOA8cIQ0QU2NGWsam4OB49kQO7vpsg29RBg&amp;v=404" title="摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机">                              <em>摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机</em>                          </a>                          <div class="p-price">                               <strong><em class="number J-p-1326953">￥1699.00</em></strong>                          </div>                          <div class="p-btnbox">                              <a class="btn btn-default" target="_blank" href="http://gate.jd.com/InitCart.aspx?pid=1326953&amp;pcount=1&amp;ptype=1">立即抢购</a>                          </div>                    </li>                       <li data-sku="2//x.jd.com/dsp/np?log=Jj2NCSKsPC8NEh8+RjsORAHRKOiTWSDovk+PYD03fgftBV0bbWOeJ8xXCTkXEfLoLKMrXlROLAYi3VLsyoQFwfvj/uMjxV18WnMwBe3dzWUWIJYVFMv+y+fZKyqHdb5x41Zr4nox/KPt9hloUPPzVhlx1+ZKSPsa06vY0TyAVTB08U1CkfQkqfWhVu58P2lOQ0irfOHJihoH/F8Cnxil7XtrYHH6tdiVPHZ7ixBBEDVqA+Ib+sYh5F0GA7c4QeQwzp9QSWISir+wr4liVlYinWHiMuBq8DKeQN4ae0tfNdVd3wRKH89Zei739khiivGWcQ9vQxZhHXPKn52diCgIH44TOxhwsBuacT6WrEBvZFOEMAdiuW0a1uF2HxAG0D8j6PskaIpykRTwvouhTm+lXGq9vGD3ycqYjmL+9p4jAuD9Y8wf/6RqI6vrDHEFh6uzKrRAGl8VTEXsQT0/SAU9+bxg480lWZiD4IiQuRpoOJ4=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "1", "1057746", "2", "2", "C")'>                          <a class="p-img" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwMjY0MDZfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzEwNTc3NDYuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgftBV0bbWOeJ8xXCTkXEfLoLKMrXlROLAYi3VLsyoQFwfvj_uMjxV18WnMwBe3dzWUWIJYVFMv-y-fZKyqHdb5x41Zr4nox_KPt9hloUPPzVhlx1-ZKSPsa06vY0TyAVTB08U1CkfQkqfWhVu58P2lOc_kxoErZGhwsPtrEMaOIsT4vvTghwWQ4I41F3b6hupfUC0MocOLe-ystLyBM8x7m9ixImp7B1WzBHXV-y_1FxuSMIkXaehr6EEn87ZqXMvMMM-_TCFrB-ajLpFX4WF4CGP3mnZ0tqKfOqoSs_BF88QCQtThCa9oPRwQy9GW01D7GG1vdBJZl-HVHV8Yamx38&amp;v=404" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机">                              <img data-img="1" src="${adImgServer}55c17dc0Nd62f4a8e.jpg" class="err-product" height="100" width="100">                          </a>                          <a class="p-name" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwMjY0MDZfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzEwNTc3NDYuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgftBV0bbWOeJ8xXCTkXEfLoLKMrXlROLAYi3VLsyoQFwfvj_uMjxV18WnMwBe3dzWUWIJYVFMv-y-fZKyqHdb5x41Zr4nox_KPt9hloUPPzVhlx1-ZKSPsa06vY0TyAVTB08U1CkfQkqfWhVu58P2lOc_kxoErZGhwsPtrEMaOIsT4vvTghwWQ4I41F3b6hupfUC0MocOLe-ystLyBM8x7m9ixImp7B1WzBHXV-y_1FxuSMIkXaehr6EEn87ZqXMvMMM-_TCFrB-ajLpFX4WF4CGP3mnZ0tqKfOqoSs_BF88QCQtThCa9oPRwQy9GW01D7GG1vdBJZl-HVHV8Yamx38&amp;v=404" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机">                              <em>Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机</em>                          </a>                          <div class="p-price">                               <strong><em class="number J-p-1057746">￥2688.00</em></strong>                          </div>                          <div class="p-btnbox">                              <a class="btn btn-default" target="_blank" href="http://gate.jd.com/InitCart.aspx?pid=1057746&amp;pcount=1&amp;ptype=1">立即抢购</a>                          </div>                    </li>                       <li data-sku="3//x.jd.com/dsp/np?log=Jj2NCSKsPC8NEh8+RjsORAHRKOiTWSDovk+PYD03fgd4HGLpi5By/LwgJv99b4BuDApF38G8mLY/lZHFGJHEwJR0O+nMMvOdmBWriA4VhCt87E7qyZN8LdSfGz1TX/j5lyoXRkxybud/NztdqjLlVinDZmow9sZX9ekjDkphzx5Tzi8ctm0bNrPiH6c9Nmi3KaUvt+v1QY7x5Uq+lunpzzFhhzJ4ugHjwwHG9+Br+54uMdgqqN7bW724+PFZAr4FaUQnu101gunRuVIyq9CGVgj4pzMBo+7uMqYIgfBWiu14owAn0CuZEym0OtOCg1sU1NuXLTzJCBBt9XBYiI9mpWFRVsQQmjcQ1DRaKM4M2G3R8tWSYNPGCP767TY4O3IU5SLFXppBNl3cC1HPlvUMH3/Sqx3Ep+HSS42HiFA/EnwZamDoB/QxbWx0ndfdbzkWZmLBGeVx3t0ir9b8c6tRzoa+5NVbRyOlQ7uVGWnBZwM=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "1", "1169454", "2", "3", "C")'>                          <a class="p-img" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTU3NTUyNjZfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzExNjk0NTQuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgd4HGLpi5By_LwgJv99b4BuDApF38G8mLY_lZHFGJHEwJR0O-nMMvOdmBWriA4VhCt87E7qyZN8LdSfGz1TX_j5lyoXRkxybud_NztdqjLlVinDZmow9sZX9ekjDkphzx5Tzi8ctm0bNrPiH6c9Nmi3QN_mWXXHXuOuhBkAxJ9cqdR6ACd_StVZCXkvCgKp_VR3kdiuhixUt64GpIJMl1cqq9e_h7x9g-MgPaJHXhOMR89hSc1YLGy8ksJm3dfLAbLaLzb_7Lnk_-cL9kv7_6cTTk1f7FTkteSQeGIxjIsAekY8yOrX-mdRINSLTaekIU_w_vHwZBPkr4B_fCd3CcwI&amp;v=404" title="一加手机（A0001）64GB 砂岩黑 移动4G手机">                              <img data-img="1" src="${adImgServer}55667d63N29c71bcf.jpg" class="err-product" height="100" width="100">                          </a>                          <a class="p-name" target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTU3NTUyNjZfNDYmdG89aHR0cDovL2l0ZW0uamQuY29tLzExNjk0NTQuaHRtbA&amp;log=Jj2NCSKsPC8NEh8-RjsORAHRKOiTWSDovk-PYD03fgd4HGLpi5By_LwgJv99b4BuDApF38G8mLY_lZHFGJHEwJR0O-nMMvOdmBWriA4VhCt87E7qyZN8LdSfGz1TX_j5lyoXRkxybud_NztdqjLlVinDZmow9sZX9ekjDkphzx5Tzi8ctm0bNrPiH6c9Nmi3QN_mWXXHXuOuhBkAxJ9cqdR6ACd_StVZCXkvCgKp_VR3kdiuhixUt64GpIJMl1cqq9e_h7x9g-MgPaJHXhOMR89hSc1YLGy8ksJm3dfLAbLaLzb_7Lnk_-cL9kv7_6cTTk1f7FTkteSQeGIxjIsAekY8yOrX-mdRINSLTaekIU_w_vHwZBPkr4B_fCd3CcwI&amp;v=404" title="一加手机（A0001）64GB 砂岩黑 移动4G手机">                              <em>一加手机（A0001）64GB 砂岩黑 移动4G手机</em>                          </a>                          <div class="p-price">                               <strong><em class="number J-p-1169454">￥1499.00</em></strong>                          </div>                          <div class="p-btnbox">                              <a class="btn btn-default" target="_blank" href="http://gate.jd.com/InitCart.aspx?pid=1169454&amp;pcount=1&amp;ptype=1">立即抢购</a>                          </div>                    </li>                     </ul>                </div></div><div id="market" class="hot-sales-act"><div class="hd"> 促销活动</div><div class="bd"><ul clstag="thirdtype|keycount|thirdtype|promotion"><li>·<a href="http://sale.jd.com/act/gmPLe5p2uVAlbBwJ.html" target="_blank">手机配件低至49！低至49！</a></li><li>·<a href="http://www.jd.com/news.aspx?id=27000" target="_blank">LG G3 降至1699，领券还立减！</a></li><li>·<a href="http://www.jd.com/news.aspx?id=26966" target="_blank">甜蜜圣诞，购机全场送巧克力券</a></li><li>·<a href="http://www.jd.com/news.aspx?id=26947" target="_blank">荣耀圣诞感恩回馈</a></li><li>·<a href="http://www.jd.com/news.aspx?id=26898" target="_blank">vivo 年度旗舰 X6Plus新品上市</a></li></ul></div></div></div></div>



     

        <!-- 列表头部  筛选条件 -->
        
        <div class="wrapper">
           <div class="crumbs-bar">
<%--             ${selector.cid}-${selector.brandId}-${selector.exts} --%>
                <form action="list.jsp" method="post" id="selectorForm">
					<input name="cid" value="${selector.cid}" type="hidden"> 
					<input id="brandId" name="brandId" value="${selector.brandId}" type="hidden"> 
					<input name="productId" value="0" type="hidden"> 
				</form>
            </div>

                                    <div class="selector">
                <div id="selectebox" class="selectebox">
                        <div style="display: block;" class="prop-item brand-imglist ">
	                        <dl>
	                            <dt>品牌：</dt>
	                            <dd class=""> 
	                                <div class="brand-inner">
	                                    <div class="brandlist">
	                                        <ul id="brandsUL" class="clearfix">
	                                        </ul>
	                                        <p style="display: none;">非常抱歉，未找到相关品牌</p>
	                                    </div>
	                                </div>
	                                                            </dd>
	                        </dl>
	                    	<a class="morebtn open-up" href="javascript:void(0)">更多<i></i></a> 
                    	</div>
                </div>
                <div class="show-more"> 
                   <a class="more-select open-up" href="javascript:void(0)" style="display:block"><span>更多选项</span></a> 
                </div>
            </div>
		</div>






<!-- 列表内容 -->
        
        <div class="wrapper">
            

            <div class="toolbar clearfix">
                <ul class="sort">
                                            <li class="current">
                            <a href="http://www.zol.com/cell_phone/list/c34_s57.html" class="default">默认</a>
                        </li>
                                            <li>
                            <a href="http://www.zol.com/cell_phone/list/c34_s57_o7.html" class="desc">高人气</a>
                        </li>
                                            <li>
                            <a href="http://www.zol.com/cell_phone/list/c34_s57_o3.html" class="desc">高销量</a>
                        </li>
                                            <li>
                            <a href="http://www.zol.com/cell_phone/list/c34_s57_o2.html" class="desc">价格由低到高</a>
                        </li>
                                            <li>
                            <a href="http://www.zol.com/cell_phone/list/c34_s57_o1.html" class="desc">价格由高到低</a>
                        </li>
                    	
                    <li class="price-range clearfix">
                        <div class="inner clearfix" id="priceInner">
                            <form name="Z_searchForm" id="Z_searchForm" method="get" action="">
                                <input name="price_start" class="text" value="￥" id="priceStart" maxlength="10" type="text"><i>-</i>
                                <input name="price_end" class="text" value="￥" id="priceEnd" maxlength="10" type="text">
                                <span style="display: none;" class="operation"> 
                                    <a href="javascript:void(0);" class="confirm" id="priceConfirm">确定</a> 
                                    <a href="javascript:void(0);" id="priceCancle">清除</a> 
                                </span>
                            </form>
                        </div>
                    </li>
                    <li class="screening"> 
                        <span class="fold" style="display:none;">更多<i class="ico"></i></span>
                        <div class="list clearfix">
                            <label for="check_1"><input name="is_promo" value="1" class="check" id="check_1" type="checkbox">限时抢购</label>
                            <label for="check_21" style="display:none;"><input name="is_fullsent" value="1" class="check" id="check_21" type="checkbox">满件优惠</label>
                            <label for="check_3" style="display:none;"><input name="is_hdfk" value="1" class="check" id="check_3" type="checkbox">QQ在线</label>
                            <label for="check_11"><input name="is_fullsent" value="1" class="check" id="check_11" type="checkbox">店铺活动</label>
                        </div>
                    </li>
                </ul>
                <div class="mini-page"><em>1/100</em><span class="no-prev">上一页</span><a href="http://www.zol.com/cell_phone/list/c34_s57_2.html" class="next">下一页<i></i></a></div>
            </div>
            
                        <ul class="goods-list clearfix" id="goodsPicList">
                        
                        
                        
                        

	
			<c:forEach var="o" varStatus="s" items="${list}">
    			<li class="">
                <div class="attention"><span>关注</span></div>
                
                 <a href="${itemDomain}/item.jsp?id=${o.id}" target="_blank" class="pic">
	                 <span class="img">
	                 <script type="text/javascript">
						var uploadPath = "${itemImgServer}";
						var imgs = "${o.imgs} ";
						var imgArr = imgs.split(";");
						var img = uploadPath + imgArr[0];
						document.write('<img src="'+img+'" alt="${o.title}" title="${o.title}" height="132">');
					</script> 
	                 </span>
                 </a>
                 
                 <div class="title">
                     <a href="item.jsp?id=${o.id}" target="_blank">${o.title}  </a>
                 </div>
                 
                 <div class="price-bar clearfix">
                     <span class="price">&#165;${o.price}</span>
                     <span class="activity-infor" style="display:none;">最多减&#165;1000</span>
                 </div>
                 
                 <div class="volume"><em>2022</em>人已买</div>
                 
                 <div class="shop-infor">
                     <p class="shop-name"><a href="http://www.zol.com/shop_188530/" target="_blank" title="点沸数码">${o.shop.name}</a></p>
                     <p class="total-volume">店铺总成交<em>18687</em>笔</p>
                  </div>
                    
                 </li>
			</c:forEach>
	
                                            </ul>
            <div class="page"><span class="no-prev">上一页</span><span class="current">1</span><a href="http://www.zol.com/cell_phone/list/c34_s57_2.html">2</a><a href="http://www.zol.com/cell_phone/list/c34_s57_3.html">3</a>...<a href="http://www.zol.com/cell_phone/list/c34_s57_100.html">100</a><a href="http://www.zol.com/cell_phone/list/c34_s57_2.html" class="next">下一页</a></div>
                    </div>

        
        

       
        <!-- 侧边栏 -->
        <div class="zc-side-toolbar-box" id="side-toolbar-wrapper" data-url="/index.php?c=Ajax_RightSidebar">
    <div class="zc-toolbar-tabbar">
        <div class="zc-operation-tabbox" id="operation_region">
            
            <!-- QQ -->
            <div class="zc-qq" style="display:none">	<!--  zc-qq-hover -->
                <div class="zc-qq-ico"></div>
                <div class="zc-qq-layer">
                    <i class="zc-triangle"></i>
                    <i class="zc-close"></i>
                    <div class="zc-shop-name">点沸数码点沸数码点…</div>
                    <ul>
                        <li>
                            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1029884265&amp;site=qq&amp;menu=yes" target="_blank"><img title="点击这里给我发消息" alt="点击这里给我发消息" src="${adImgServer}pa.gif" border="0"></a><span>店长</span>
                        </li>
                        <li>
                            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1029884265&amp;site=qq&amp;menu=yes" target="_blank"><img title="点击这里给我发消息" alt="点击这里给我发消息" src="${adImgServer}pa.gif" border="0"></a><span>店长</span>
                        </li>
                        <li>
                            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1029884265&amp;site=qq&amp;menu=yes" target="_blank"><img title="点击这里给我发消息" alt="点击这里给我发消息" src="${adImgServer}pa.gif" border="0"></a><span>店长</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 订单 -->
            <div class="zc-tab-order" data-tips="我的订单" data-role="OrderInfo">	<!--  zc-tab-hover -->
                <div class="zc-tab-ico"></div>
            </div>

            <!-- 关注 -->
            <div class="zc-tab-attention" data-role="attention" style="display:none;">	<!--  zc-tab-hover -->
                <div class="zc-attention-border">
                    <div class="zc-tab-ico"></div>
                    <div class="zc-tab-txt">我的关注</div>
                </div>

                <!-- 消息通知层 -->
                <div class="zc-success-attention" style="display:none">
                    <i class="zc-triangle"></i>
                    <i class="zc-close"></i>
                    <div class="zc-title">成功加入我的关注</div>
                    <p>您可以查看<a href="#">我的关注</a></p>
                </div>

            </div>

            <!-- 足迹 -->
            <div class="zc-tab-footprint" data-tips="我的足迹" data-role="BrowseHistroy">	<!--  zc-tab-hover -->
                <div class="zc-tab-ico"></div>
            </div>

            <!-- 购物车 -->
            <div class="zc-tab-cart" data-tips="购物车" data-role="ShopCart">	<!--  zc-tab-hover -->
                <div class="zc-tab-ico"></div>
                <span class="zc-number" id="cart-total">0</span>

                <!-- 消息通知层 -->
                <div class="zc-success-attention" id="toast" style="display:none">
                    <i class="zc-triangle"></i>
                    <i class="zc-close"></i>
                    <div class="zc-title">成功加入购物车</div>
                    <p>您可以去<a href="#">购物车结算</a></p>
                </div>

            </div>
        </div>
        <div class="zc-toolbar-tool" id="show_region">

            <!-- 关注 -->
            <!--  zc-attention-click -->
            <div class="zc-attention-bar" style="display:none;">
                <div class="zc-attention-ico"></div>
                <div class="zc-attention-layer">
                    <i class="zc-triangle"></i>
                    <i class="zc-close"></i>
                    <div class="zc-title">活动关注成功！</div>
                </div>
            </div>

            <!-- 分享 -->
            <!--  zc-share-bar-hover -->
            <div class="zc-share-bar" style="display:none;">
                <div class="zc-share-ico"></div>
                <div class="zc-share-layer">
                    <i class="zc-triangle"></i>
                    <div class="bdsharebuttonbox bdshare_t bds_tools get-codes-bdshare bdshare-button-style0-16" id="bdshare" data-bd-bind="1403577164954">
                        <a data-cmd="tsina" class="bds_tsina" title="分享到新浪微博"></a>
                        <a data-cmd="qzone" class="bds_qzone" title="分享到QQ空间"></a>
                        <a data-cmd="tqq" class="bds_tqq" title="分享到腾讯微博"></a>
                        <a data-cmd="sqq" class="bds_sqq" title="分享到QQ"></a>
                        <a data-cmd="weixin" class="bds_weixin" title="分享到微信"></a>
                    </div> 
                </div>
            </div>

            <!-- 建议 -->
            <a href="http://www.wenjuan.com/s/NjAzmiO/" class="zc-feedback" target="blank">建议反馈</a>

            <!-- 二维码 -->
            <!-- zc-phone-login-hover -->
            <div class="zc-phone-login" style="display:none;">
                <i class="zc-ico"></i>
                <div class="zc-layer">
                    <i class="zc-triangle"></i>
                    <img src="${adImgServer}photo.jpg" alt="" height="150" width="150">
                    <div class="zc-title">登录手机商城</div>
                    <div class="zc-subtitle">享受不一样的购物体验</div>
                </div>
            </div>
            <!-- 返回顶部 -->
            <a href="#" class="zc-backtop"></a>
        </div>
    </div>

    <!-- Hover Tips -->
    <div style="right: -68px; top: 103px;" class="zc-tab-tips" id="hover_tips">我的足迹</div>

    <!-- 右侧切换层 -->
    <div class="zc-toolbar-plugins">

        <!-- 我的订单 -->
        <div class="zc-toolbar-plugin">
            <div class="zc-toolbar-plugin-hd">
                <div class="zc-toolbar-plugin-title">我的订单</div>
                <div class="zc-toolbar-plugin-close"></div>
            </div>
            <div class="zc-toolbar-plugin-bd">
                <div class="zc-scroll-bd">
                    <ul class="zc-order-list" data-contains="OrderInfo"></ul>
                </div>
                <div class="zc-view-all"><a href="http://my.zol.com/index.php?c=OrderManage"><span>查看全部</span>&gt;&gt;</a></div>
            </div>
        </div>
        <!-- //我的订单 -->

        <!-- 我的足迹 -->
        <div class="zc-toolbar-plugin zc-footprint-box">
            <div class="zc-toolbar-plugin-hd">
                <div class="zc-toolbar-plugin-title">我的足迹</div>
                <div class="zc-toolbar-plugin-close"></div>
            </div>
            <div class="zc-toolbar-plugin-bd">
                <div class="zc-footprint-hd">
                    <div class="zc-tips">在这里可以查看您的浏览记录</div>
                </div>
                <div class="zc-scroll-bd">
                    <div data-contains="BrowseHistroy">
                        <div class="zc-number">
                            共<em id="history-total">13</em>件商品<span class="zc-remove-btn">清空</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //我的足迹 -->

        <!-- 购物车 -->
        <div class="zc-toolbar-plugin zc-cart-box">
            <div class="zc-toolbar-plugin-hd">
                <div class="zc-toolbar-plugin-title">购物车</div>
                <div class="zc-toolbar-plugin-close"></div>
                <a href="http://order.zol.com/index.php?c=Cart" class="zc-all-links">全部&gt;&gt;</a>
            </div>
            <div class="zc-toolbar-plugin-bd">
                <div class="zc-scroll-bd">
                    <ul class="zc-cart-list" data-contains="ShopCart"></ul>
                </div>
            </div>
        </div>
        <!-- //购物车 -->

        <!-- 我的关注 -->
        <div class="zc-toolbar-plugin zc-attention-box" style="display:none;">
            <div class="zc-toolbar-plugin-hd">
                <div class="zc-toolbar-plugin-title">我的关注</div>
                <div class="zc-toolbar-plugin-close"></div>
            </div>
            <div class="zc-toolbar-plugin-bd">
                <ul class="zc-tabbar clearfix">
                    <li>商品<em>(134)</em></li>
                    <li>活动<em>(0)</em></li>
                    <li class="zc-current">店铺<em>(11)</em></li>
                </ul>
                <!-- 商品 -->
                <div class="zc-goods-box">
                    <div class="zc-empty-box" style="display:none;">
                        <p>在这里，可随时看到关注的商品</p>
                        <p>记得关注您心仪的商品哟~</p>
                    </div>
                    <div class="zc-goods-hd">
                        <div class="zc-goods-number">共关注了<em>13</em>件商品</div>
                        <div class="zc-goods-classify zc-goods-classify-trig ger">
                            <span class="zc-hd">分类</span>
                            <ul class="zc-classify-list clearfix">
                                <li><a href="#">手机(2)</a></li>
                                <li><a href="#">手机配件(2)</a></li>
                                <li><a href="#">笔记本(5)</a></li>
                                <li><a href="#">耳机(5)</a></li>
                                <li><a href="#">平板电脑(3)</a></li>
                                <li><a href="#">全部（17）</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="zc-scroll-bd" style="height:700px;">

                        <div class="zc-goods-item">
                            <div class="zc-time-show">当天</div>
                            <div class="zc-attention-goods">
                                <ul class="clearfix">
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete" style="display:block;"><i class="zc-ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="zc-goods-item">
                            <div class="zc-time-show">最近7天</div>
                            <div class="zc-attention-goods">
                                <ul class="clearfix">
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete" style="display:block;"><i class="zc-ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="zc-goods-item">
                            <div class="zc-time-show">一周前</div>
                            <div class="zc-attention-goods">
                                <ul class="clearfix">
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="zc-pic">
                                            <img src="${adImgServer}photo.jpg" alt="" height="100" width="100">
                                            <span class="zc-price">&#165;2899</span>
                                        </a>
                                        <a href="#" class="zc-delete"><i class="zc-ico"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="zc-view-all"><a href="#"><span>查看全部</span>&gt;&gt;</a></div>
                </div>
                <!-- //商品 -->

                <!-- 活动 -->
                <div class="zc-activity-box" style="display:none;">
                    <div class="zc-empty-box" style="display:none;">
                        <p>亲，您可能</p>
                        <p>还没有关注过我们的活动呢~</p>
                    </div>
                    <div class="zc-empty-box" style="display:none;">
                        <p>亲，虽然错过了</p>
                        <p>但我们还有更多活动等着您！</p>
                    </div>
                    <div class="zc-scroll-bd">

                        <ul class="zc-activity-list" style="height:700px;">
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                            <li>
                                <div class="zc-hd">活动进行中…<i class="zc-cancel-btn"></i></div>
                                <div class="zc-activity-name">夏季办公室小家电推荐</div>
                                <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                <a href="#" class="zc-activity-button">进入活动</a>
                            </li>
                        </ul>
                    </div>
                    <div class="zc-view-all"><a href="#"><span>查看全部</span>&gt;&gt;</a></div>
                    <div class="zc-more-activity-box">
                        <div class="zc-unfold-btn zc-fold-btn"><i class="zc-ico"></i></div>
                        <div class="zc-scroll-bd" style="height:auto;">
                            <div class="zc-scroll-bar" style="height:24px;"></div>
                            <div class="zc-more-activity-hd">其他进行中的活动 (8)</div>
                            <ul>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                                <li>
                                    <div class="zc-activity-name">小家电红六月</div>
                                    <div class="zc-activity-times">2015/5/19~2015/7/31</div>
                                    <a href="#" class="zc-activity-button">进入活动</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- //活动 -->

                <!-- 店铺 -->
                <div class="zc-store-box" style="display:none;">
                    <div class="zc-empty-box" style="display:none;">
                        <p>亲，当前没有已关注的店铺~</p>
                    </div>
                    <div class="zc-scroll-bd">

                        <ul class="zc-store-list" style="height:700px;">
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">爱国者北京专卖店</span>
                                    <span class="zc-subtitle">官方授权 正品保障</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">点沸数码专营店</span>
                                    <span class="zc-subtitle">满100减10元</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">鑫天下电子</span>
                                    <span class="zc-subtitle">满100送精美礼品一份</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">华晨数码旗舰店</span>
                                    <span class="zc-subtitle">官方授权  正品保障</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">万方宇笔记本旗舰店</span>
                                    <span class="zc-subtitle">满1000减200</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">华晨数码旗舰店</span>
                                    <span class="zc-subtitle">官方授权  正品保障</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="zc-store-name">万方宇笔记本旗舰店</span>
                                    <span class="zc-subtitle">满1000减200</span>
                                    <span class="zc-button">进入店铺</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="zc-view-all"><a href="#"><span>查看全部</span>&gt;&gt;</a></div>
                </div>
                <!-- //店铺 -->
            </div>
        </div>
        <!-- //我的关注 -->
    </div>
    <!-- //右侧切换层 -->

    <!-- 清空浏览记录 -->
    <div class="zc-layerbox-overlay" id="cover_screen"></div>
    <div class="zc-layerbox" id="clear_confirm">
        <div class="zc-title">清空浏览记录？</div>
        <div class="zc-subtitle">确定后，您的浏览记录将被清空</div>
        <div class="zc-btn clearfix">
            <span class="ok">确定</span>
            <span class="cancel">取消</span>
        </div>
    </div>
    <!-- //清空浏览记录 -->  
</div> 

<script src="js/side_toolbar.js"></script>
<script src="js/side_toolbar_fun_v1.js"></script>
<script>
//侧边栏购物车数量 
    function setCartNum(){
        var url = "http://www.zol.com/index.php?c=Ajax_ShopCart&a=GetCartNumber&callback=?&t="+Math.random();
        $.getJSON(
            url,
            {},
            function(data){
                $("#cart-total").html(data.cartNumber);
            }
        );
    }
    setCartNum();
</script>
        <!-- //侧边栏 -->

        <div class="layer-box" style="display:none;" id="zp-goods-follow">
            <div class="layer-body"> 
                <a href="javascript:void(0)" class="close" onclick="$('#zp-goods-follow-box').empty();$('.layer-box').hide()"></a>
                <div id="zp-goods-follow-box" class="success">
                    <h3>商品关注成功</h3>
                    <p>您已关注8个商品，查看<a target="_blank" href="http://my.zol.com/index.php?c=FollowGoods">我关注的商品</a></p>
                </div>
            </div>
        </div>

        <div class="layer-box" style="display:none;" id="zp-goods-follow">
            <div class="layer-body"> 
                <a href="javascript:void(0)" class="close" onclick="$('#zp-goods-follow-box').empty();$('.layer-box').hide()"></a>
                <div id="zp-goods-follow-box" class="failure">
                    <h3>您已关注过该商品</h3>
                    <p>您已关注8个商品，查看<a target="_blank" href="http://my.zol.com/index.php?c=FollowGoods">我关注的商品</a></p>
                </div>
            </div>
        </div>
        <script>
            $(function(){
                // 类别
                $('.menu-drop').hover(function(){
                    $(this).addClass('menu-drop-hover');
                },function(){
                    $(this).removeClass('menu-drop-hover');
                });
                // 发货地
                $('li[class="comm-dress"]').hover(function(){
                    $(this).addClass('hover');
                },function(){
                    $(this).removeClass('hover');
                });
                // 价格筛选
                $('#Z_searchForm').hover(function(){
                    $(this).parents('.price-range').addClass('price-click');
                },function(){
                    $(this).parents('.price-range').removeClass('price-click');
                });
                // 店铺活动
                $('li[class="screening"] > .fold').hover(function(){
                    $(this).parents('.screening').addClass('screen-hover'); 
                },function(){
                    $(this).parents('.screening').removeClass('screen-hover');
                });
                // 商品鼠标在上的样式
                $("#goodsPicList > li").mouseover(function(){
                    $(this).siblings("li").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children(".attention").fadeIn("fast");
                }).mouseleave(function(){
                    $(this).removeClass("hover").children(".attention").fadeOut("fast");
                });
                var selectManu = '';
                // 左侧分类导航
                $('.category-nav-title').mouseover(function(){
                    $('.category-menu-nav').css('display','block');
                }).mouseleave(function(){
                    selectManu = setTimeout(function(){
                        $('.category-menu-nav').css('display','');
                    },2000);
                });
                $(".menu-nav-container > li").hover(function () {
                    clearTimeout(selectManu);
                    $(this).addClass("current");
                },function () {
                    $(this).removeClass("current");
                });
                $("body").mouseover(function(event){
                    var currElement = $(event.target || event.srcElement);
                    if(currElement.parents(".category-nav-container").length != 1){
                        $(".category-menu-nav").css("display","none");
                    }
                });
            })
        </script>
        <script>    
    var baseDetailUrl    = "http://www.zol.com"; 
    var cateId           = '34'
    var subId            = '57';
    var manuId           = '0';
    var provinceId       = '0';
    var orderby          = '0';
    var paramStr         = '';
    var priceRange       = '';

     // 图片后加载 add by liufang 2014-11-21
    window.onload = window.onscroll = window.onresize = function() {
        var imgArr = document.getElementsByTagName("img");
        var noLoadingArr = noLoadingImg(imgArr);
        var sTop = document.documentElement.scrollTop || document.body.scrollTop;
        var iHeight = document.documentElement.clientHeight + sTop;
        var iiTop = iiBottom = 0;
        var m = null;

        if (noLoadingArr.length) {
            for (var i = 0; i < noLoadingArr.length; i++) {
                m = noLoadingArr[i].parentElement;

                iiTop = getHight(m);//- 300;
                iiBottom = iiTop + m.offsetHeight;
                if (((iiTop > sTop && iiTop < iHeight) || (iiBottom > sTop && iiBottom < iHeight)) && noLoadingArr[i].getAttribute("loadsrc") != null) {
                    loadingImg(i, noLoadingArr)
                }
            }
        }
        function loadingImg(j, noLoadingArr) {
            var opts = null, alpha = 0;
            opts = setInterval(function() {
                noLoadingArr[j].src = noLoadingArr[j].getAttribute("loadsrc");
                noLoadingArr[j].setAttribute("shid", 1);
                alpha += 2;
                if (alpha > 100) {
                    alpha = 100
                }
                noLoadingArr[j].style.opacity = alpha / 100;
                noLoadingArr[j].style.filter = "alpha(opacity=" + alpha + ")";
                if (alpha == 100) {
                    clearInterval(opts)
                }
            }, 13)
        }
        function noLoadingImg(noLoadingArr) {

            var noImg = [];
            for (var i = 0; i < noLoadingArr.length; i++) {
                if (noLoadingArr[i].getAttribute("shid") != 1 && noLoadingArr[i].getAttribute("loadsrc") != null) {
                    noImg.push(imgArr[i])
                }
            }
            return noImg
        }
        function getHight(e) {
            return e.offsetTop + (e.offsetParent ? arguments.callee(e.offsetParent) : 0)
        }
    };
    $(function($){

        var referer       = $("#referer").val();
        var searchKeyword = $("input[name='keyword']").val();
        var keywordUrl    = baseDetailUrl+"/index.php?c=Ajax_ListV1&a=SearchKeywordLog&t="+Math.random();
        var hotSearch     = $("#searchType").val();
       // 搜索关键词记录到数据库中
        if (''!= searchKeyword || hotSearch) {
            $.get(keywordUrl,{keyword:searchKeyword,access:referer,result:2335,searchType:hotSearch});
        }

       // 热门推荐
       $.extend({
            getGoodsRecommendInfo : function(options){
               var defaults = {                    
                   subId : subId ,
                   manuId : manuId
               };          

               var options     = $.extend(defaults, options);  
       //        var subId       = defaults.subId;    
       //        var manuId       = defaults.manuId; 
               var url         = baseDetailUrl+"/index.php?c=Ajax_ListV1&a=getGoodsRecommendInfo&callback=?&t="+Math.random();
               var str         = '';
               $.getJSON(
                       url,
                       {subId:subId,manuId:manuId},
                       function(data){
                           if(data.flag){
                               var goodsInfo   = data.info;
                               for(var i in goodsInfo){
                                   str     += '<li>';
                                   str     += '<a href="'+goodsInfo[i].goodsUrl+'" class="pic" target="_blank"><span><img width="160" alt="'+goodsInfo[i].shortGoodsName+'" src="'+goodsInfo[i].indexPicUrl+'"></span></a>';
                                   str     += '<h3><a title="'+goodsInfo[i].goodsName+'" href="'+goodsInfo[i].goodsUrl+'" target="_blank">'+goodsInfo[i].goodsName+'</a></h3>';
                                   str     += '<div class="cost-price">';
                                   if(goodsInfo[i].goodsPrice != goodsInfo[i].promoPrice){
                                       str += '<span>市场价：<del>&yen;'+goodsInfo[i].goodsPrice+'</del></span>';
                                   }
                                   str     += '<span>销量：<em>'+goodsInfo[i].sellNumber+'</em></span>';
                                   str     += '</div>';
                                   str     += '<div class="sale-price">抢购价：<span>&yen;'+goodsInfo[i].promoPrice+'</span></div>';
                                   str     += '<a href="'+goodsInfo[i].goodsUrl+'" class="btn" target="_blank">立即抢购</a>';
                                   str     += '</li>';
                               }
                               //放入页面
                               $("#goods-recommend-info-list").html(str);
                           }else{//暂无推荐提示
                               $("#goods-recommend-info-area").hide();//隐藏
                           }
                       }     
               );

            }
        });

       // 热门活动推荐
//       $.extend({
//            getActivityInfo : function(){   
//               var url         = baseDetailUrl+"/index.php?c=Ajax_ListV1&a=GetActivityInfo&callback=?&t="+Math.random();;
//               $.getJSON(
//                       url,
//                       {},
//                       function(data){
//                           if(data.flag){
//                               var actInfo     = data.info;
//                               var str         = '';
//                               for(var i in actInfo){
//                                   str        += '<li>';
//                                   str        += '<a href="'+actInfo[i].promoUrl+'" target="_blank" title="'+actInfo[i].promoName+'">'+actInfo[i].promoName+'</a>';
//                                   str        += '</li>';
//                               }
//                               $("#activity-info-list").html(str);
//                           }else{
//                               //该子类下暂时没有促销活动
//                           }
//                       }     
//               );
//
//            }
//        }); 



       // 限时抢购
    //   $.extend({
    //        getGoodsPromoInfo : function(options){
    //           var defaults = {                    
    //               subId : 0                
    //           };                       
    //           var options     = $.extend(defaults, options);   
    //           var subId       = defaults.subId;     
    //           var url         = baseDetailUrl+"/index.php?c=Ajax_ListV1&a=getGoodsPromoInfo&callback=?&t="+Math.random();;
    //           $.getJSON(
    //                   url,
    //                   {subId:subId},
    //                   function(data){
    //                       if(data.flag){
    //                           var promoInfo   = data.info;
    //                           var promoLen    = data.infoNumber;
    //                           var str         = '';
    //                           for(var i in promoInfo){
    //                               str        += '<li>';
    //                               str        += '<a href="'+promoInfo[i].goodsUrl+'" target="_blank"><span class="pic">';
    //                               str        += '<img width="200"  alt="'+promoInfo[i].goodsName+'" src="'+promoInfo[i].indexPicUrl+'"></span>';
    //                               str        += '<span class="title" title="'+promoInfo[i].goodsName+'">'+promoInfo[i].goodsName+'</span></a>';
    //                               str        += '<div class="price-bar clearfix">';
    //                               str        += '<div class="price">&yen;'+promoInfo[i].promoPrice+'</div>';
    //                               str        += '<div class="countdown" id="promo_sort_'+i+'">';
    //                               str        += '<span>余</span><b>0</b><b>0</b><span>时</span><b>0</b><b>0</b><span>分</span><b>0</b><b>0</b><span>秒</span>';
    //                               str        += '</div></div>';
    //                               str        += '</li>';
    //                           }
    //                           $("#goods-promo-info-list").html(str);
    //                           for(var k=0;k<promoLen;k++){
    //                               promoClock('promo_sort_'+k,promoInfo[k].endTime);
    //                           }
    //                       }else{
    //                           $("#goods-promo-info").hide();
    //                       }
    //                   }     
    //           );
    //
    //        }
    //    });   

       // 人气排行
       $.extend({
            getGoodsTopInfo : function(options){
               var defaults = {                    
                   subId : 0                
               };                       
               var options     = $.extend(defaults, options);   
               var subId       = defaults.subId;     
               var url         = baseDetailUrl+"/index.php?c=Ajax_ListV1&a=getGoodsTopInfo&callback=?&t="+Math.random();;
               var str         = '';
               $.getJSON(
                       url,
                       {subId:subId},
                       function(data){
                           if(data.flag){
                               var goodsInfo   = data.info;
                               for(var i in goodsInfo){
                                   str += '<li>';
                                   str += '<a href="'+goodsInfo[i].goodsUrl+'" class="pic" target="_blank">';
                                   str += '<img alt="'+goodsInfo[i].shortGoodsName+'" loadsrc="'+goodsInfo[i].indexPicUrl+'">';
                                   str += '<span title="'+goodsInfo[i].goodsName+'">'+goodsInfo[i].goodsName+'</span>';
                                   str += '</a>';
                                   str += '<div class="price-bar clearfix"><div class="price">&yen;'+goodsInfo[i].goodsPrice+'</div></div>';
                                   str += '</li>';
                               }
                               $("#goods-top-info-list").html(str);
                           }else{
                               $("#goods-top-info").hide();
                           }
                       }     
                );    
             }
           });
        // 加关注
        $.extend({
            saveGoodsFllow:function(options,obj){
                var defaults = {
                    goodsOjb   : 0,
                    goodsId    : 0,                   
                    merchantId : 0,
                    goodsName  : '',    
                    goodsPrice : 0    
                };                       
                var options     = $.extend(defaults, options);   

                var goodsId     = defaults.goodsId;
                var merchantId  = defaults.merchantId;
                var goodsName   = defaults.goodsName;
                var goodsPrice  = defaults.goodsPrice;            
                var url         = baseDetailUrl+"/index.php?c=Ajax_GoodsFollow&callback=?&t="+Math.random();
                 $.getJSON(
                    url,
                    {goodsId:goodsId, merchantId:merchantId, goodsName:goodsName, goodsPrice:goodsPrice},
                    function(data){                    
                        var str = '';                    
                        if (data.flag){                        
                            if (1 == data.flag){                            
                                str += '<h3>商品关注成功</h3>';
                                $(obj).html("已关注");
                            }else{
                                str += '<h3>您已关注过该商品</h3>';                                                    
                            }
                            str += '<p>您已关注'+data.goodsNumber+'个商品，查看<a target="_blank" href="http://my.zol.com/index.php?c=FollowGoods">我关注的商品</a></p>';
                        }else{
                            str = '<h3>关注失败</h3>';
                            str += '<p>' + data.msg + '</p>';
                        }                                        

                        if (1 == data.flag){                        
                            $("#zp-goods-follow-box").html(str).addClass("success").removeClass("failure");
                        }else{
                            $("#zp-goods-follow-box").html(str).addClass("failure").removeClass("success");

                        }
                        $("#zp-goods-follow").show();
                    }
                 );                                    
            }
        });   

        $.extend({
            getCartInfo: function() {
                var url = baseDetailUrl + '/index.php?c=Ajax_ShopCart&a=getCartInfo&callback=?&t=' + Math.random();
                $.getJSON(
                        url,
                        {},
                        function(data) {
                            $(".mycart-list").html(data.str);
                            $("#Z_cart_number").html(data.cart_number);
                            if (data.js_cartnumber > 4) {
                                $(".cartlist").css({"overflow": "auto", "height": "415px"});
                            }
                            $(".cartlist > li").mouseover(function() {
                                $(this).addClass("cur").siblings().removeClass("cur");
                            }).mouseleave(function() {
                                $(this).removeClass("cur");
                            });
                        }
                );
            }
        });

        $.extend({
            delCart: function(obj) {
                var cart_data   = $(obj).data();
                var cart_id     = parseInt(cart_data.cart_id);
                var cart_number = parseInt(cart_data.cart_number);            
                var url = baseDetailUrl + '/index.php?c=Ajax_ShopCart&a=DeleteCart&callback=?&t=' + Math.random();
                $.getJSON(
                    url,
                    {cart_id: cart_id, cart_number: cart_number},
                    function(data) {		
                        $.getCartInfo();
                    }
                );
            }
        });
        
        $.extend({
            attentionMerchant: function(obj){
                var defaults = {merId:0};
                var options = $.extend(defaults,obj);
                var merId   = defaults.merId;
                var url = "/index.php?c=Ajax_MerchantFollow&callback=?&t="+Math.random();
                $.getJSON(url,{merchantId:merId},function(data){
                    var str = '';                    
                    if (data.flag){                                                  
                        str += '<h3>关注成功</h3>';
                        str += '<p>'+data.num+'</p>';                                                    
                    }else{
                        str = '<h3>关注失败</h3>';
                        str += '<p>' + data.msg + '</p>';
                    }                                        

                    if (1 == data.flag){                        
                        $("#zp-goods-follow-box").html(str).addClass("success").removeClass("failure");
                        $('.brand-name').next('a').remove();
                        $('.brand-name').after('<span class="has-btn">已关注</span>');
                    }else{
                        $("#zp-goods-follow-box").html(str).addClass("failure").removeClass("success");
                    }
                    $("#zp-goods-follow").show();
                });
            }
        });
    });

    $(function(){
        $("input[name=keyword]").click(function(){
            var searchKeyword = $(this).val();
            if ('三星GALAXY' == searchKeyword){
                $(this).val("");
            }
        });
        // 团购切换 
        $(".z-tuan").mouseover(function(){       
            $(this).addClass("z-tuan-hover");
        }).mouseleave(function(){
            $(this).removeClass("z-tuan-hover");
        }); 


        // 搜索切换
        $(".zp-findmod").mousemove(function(){
            $(this).addClass("zp-findmod-cur");    
            $("#zp-search-info").show();
        }).mouseleave(function(){
            $("#zp-search-info").hide();
            $(this).removeClass("zp-findmod-cur");
        });

        $("#zp-search-info > li").click(function(){
            var rel = $(this).attr("rel");
            if (1 == rel){
                $("#search-type-content").html("商品<i></i>");
                $("#searchForm").attr("action", "http://www.zol.com/index.php");
                $("#searchAction").val("List");
            }else{
                $("#search-type-content").html("店铺<i></i>");
                $("#searchForm").attr("action", "http://www.zol.com/index.php");
                $("#searchAction").val("MerchantSearch");
            }        
            $("#zp-search-info").hide();
            $("#zp-search-type").val(rel);                
        });

        $("#zp-search-info > li").mousemove(function(){
            $(this).addClass("hov");
        }).mouseleave(function(){
            $(this).removeClass("hov");
        });

        // 地区切换
        $(".comm-dress").mousemove(function(){
             $(this).siblings("li").removeClass("hover");
             $(this).addClass("hover");
             $(".commdress-list").show();
        }).mouseleave(function(){
             $(this).removeClass("hover");
             $(".commdress-list").hide();
        });

        // 导航切换
        var subcateTm =  null;        
        $(".productnav").mouseover(function() {
            if (subcateTm != null) {
                clearTimeout(subcateTm);
            }
            subcateTm = setTimeout(function() {
                $(".catenav").show();
                $(this).addClass("navhover");
            }, 150)
        }).mouseleave(function() {
            if (subcateTm != null) {
                clearTimeout(subcateTm);
            }
            subcateTm = setTimeout(function() {
                $(".catenav").hide();
                $(this).removeClass("navhover");
            }, 150)
        });        

        $(".cateitembox").mouseover(function() {
            $(this).addClass("cateitembox-hover");
        }).mouseleave(function() {
            $(this).removeClass("cateitembox-hover");
        }); 

        // 限时抢购 大图
        $(".ad-icon").mouseover(function(){
            $(this).next('div').show();
        }).mouseleave(function(){
            $(this).next('div').hide();
        });
        $(".adList").mouseover(function(){
            $(this).children('div').show();
        }).mouseleave(function(){
            $(this).children('div').hide();
        });

       // 热门推荐
       $.getGoodsRecommendInfo({subId:subId});

       // 人气商品
       $.getGoodsTopInfo({subId:subId});  

       // 限时抢购
       //$.getGoodsPromoInfo({subId:subId});



        // 限时抢购、满赠、货到付款更多样式切换 add by liufang 2014-11-17
        $(".fold").click(function(){
            if($(this).parent(".screening").hasClass("screen-hover")){
                $(this).parent(".screening").removeClass("screen-hover");
                $(this).html("更多");
                $(this).siblings("div").children("label:gt(2)").hide();
            }else{
                $(this).parent(".screening").addClass("screen-hover");
                $(this).html("收起");
                $(this).siblings("div").children("label:gt(2)").show();
            }
        })

        // 商品鼠标在上的样式
        $("#goodsPicList > li").mouseover(function(){
            $(this).siblings("li").removeClass("hover");
            $(this).addClass("hover");
            $(this).children(".attention").fadeIn("fast");
        }).mouseleave(function(){
            $(this).removeClass("hover").children(".attention").fadeOut("fast");
        })

        // 价格区间筛选
        $("#priceStart,#priceEnd").focus(function(){
            if(/￥/.test($(this).val())){
                $(this).val("");
            }
            $(this).siblings(".operation").show();
            $(this).parents("li").addClass("price-click");
        }).keyup(function(){
            var price = $(this).val();
            if(!/^(\d)+$/.test(price)){
                $(this).val('');
            }
        })
        $("#priceCancle").click(function(){
            $(this).parent(".operation").siblings("input").val('');
        });
        $("#priceConfirm").click(function(){
            submitList(1);
            $(this).parent(".operation").hide();
            $(this).parent(".operation").parents("li").removeClass("price-click");
        });
        $("#priceInner").mouseover(function(){
            $(this).children("form").children(".operation").show();
            $(this).parents("li").addClass("price-click");
        }).mouseleave(function(){
            if($("#priceStart").val()==''){
                $("#priceStart").val("￥");
            }
            if($("#priceEnd").val()==''){
                $("#priceEnd").val("￥");
            }
            $(this).children("form").children(".operation").hide();
            $(this).parents("li").removeClass("price-click");
        })

        //  显示更多选项
        var div_len = $(".selectebox > div").length; 
        if (div_len > 3) {
            $(".more-select").show();
        }
        // 更多分类选择
        $(".more-select").click(function() {
            var curr   = 0;
            var subStr = "";
            if ($(this).hasClass('open-up')) {

                $(".selectebox > div").show();
                $(this).removeClass("open-up").addClass("open-down").html("<span>收起</span>");
            } else {

                $(".selectebox > div").each(function() {
                    if ('none' != $(this).css("display")) {
                        curr++;
                        if (curr > 3) {
                            $(this).css('display', 'none');
                            var moreStr = $(this).children("dl").children("dt").html();
                                subStr  = moreStr.replace("：","");
                                subStr  = subStr+",";
                        }
                    }
                });
                $(this).removeClass("open-down").addClass("open-up").html("<span>更多选项</span>");;
            }
        });    
        // 品牌显示隐藏
        var li_len = $(".brandlist >ul > li").length;
        if (li_len > 20) {
            $(".brand-imglist > .morebtn").show();
        } 
        $(".brandlist > ul > li").mousemove(function(){
            $(this).addClass("hover");
        }).mouseleave(function(){
            $(this).removeClass("hover");
        })
        var div_curr = 0;
        $(".selectebox > div").each(function() {
            if (div_curr < 3) {
                $(this).css('display', 'block');
            }else{
                $(this).css('display', 'none');
            }
            div_curr++;
        });    
        $("#manuSearch").focus(function () {
            var manuSearch = $(this).val();
            if (manuSearch == "搜索 品牌名称") {
                $(this).val("");
            }
        }).blur(function (){
            var manuSearch = $(this).val();
            showManu(manuSearch);
            if (manuSearch == "") {
                $(this).val("搜索 品牌名称");
                $("ul.characters>li").removeClass("hover");
                $("#brandAll").addClass("hover");

            }
        }).keyup(function (){
            var manuSearch = $(this).val();
            showManu(manuSearch);
        })

        // 显示更多品牌 类别
        $(".brand-imglist > .morebtn").click(function() {
            if ($(this).hasClass("open-up")) {
                $(this).siblings("dl").children("dd").addClass("more-options");
                $(this).removeClass("open-up").addClass("open-down").html("收起<i></i>");
                $("div.search-alphabet").show();
                $(this).siblings().children().find("li").css("display","block");
                $(".characters").show();
                var a = "";
                $(".characters li").mouseover(function() {
                    var charactersObj = $(this);
                    var n = $(this).attr("rel");
                    if (n == undefined) {
                        return;
                    }
                    if (a) {
                        clearTimeout(a)
                    }
                    a = setTimeout(function(){showBrand(charactersObj, n)} ,150);
                }).mouseout(function() {
                    if(a){
                        clearTimeout(a);
                    }
                }).click(function() {
                    var n = $(this).attr("rel");
                    if (n == undefined) {
                        return;
                    }
                    showBrand($(this), n);
                });
            } else {
                $(this).siblings("dl").children("dd").removeClass("more-options");
                showBrand($("#brandAll"), 0);
                $("div.search-alphabet").hide();
                $("div.brandlist>p").hide();
                $("div.brandlist").children("ul").find("li:lt(14)").css("display","block");
    //            $("div.brandlist").children("ul").find("li:gt(20)").hide();
                $(this).removeClass("open-down").addClass("open-up").html("更多<i></i>");
            }
        });
        
        // 热卖推荐商品
        $('.hot-goods').click(function(){
            var urlHref = $(this).data('url');
            if(urlHref && '' != urlHref){
                window.open(urlHref);
            }
        });
        
        $(".classify-title").click(function(){
            $(this).parent().parent().addClass("classify-nav-hover").siblings().removeClass("classify-nav-hover");
        });

        // 视图切换
        $(".switch-image, .switch-list").click(function() {
            var rel   = parseInt($(this).attr("rel"));    
            var name  = "Z_view_type";
            var hours = 1;
            writeCookie(name, rel, hours);
            window.location.reload();
        });    

        // 提交搜索
        $(":input[type=checkbox]").click(function() {
            submitList();
        });    

        // 显示购物车				
        $(".mycartmod").mouseover(function(){         
            $(".mycart-list").show();
        }).mouseleave(function(){
            $(".mycart-list").hide();	
        });          

        // 显示购物车
        $.getCartInfo();

        // 搜索热词        
        var searchHotUrl = baseDetailUrl+"/index.php?c=Ajax_List&a=GetSearchHotInfo&t=" + Math.random();    
        $.getJSON(
                searchHotUrl,
                {},
                function(data) {
                    var str = '';                    
                    if (data.flag) {
                        var info     = data.goodsInfo;
                        var goodsLen = info.length;
                        if (goodsLen) {
                            str += '别人都在搜：';
                            for (var i = 0; i < goodsLen; i++) {
    //                            var newUrl = info[i].url.replace("www.","shop.liufang.test.");
                                if(info[i].url=='http://n1.zol.com/'){
                                    str += '<a href="' + info[i].url + '" target="_blank">' + info[i].title + '</a>';
                                }else{
                                    str += '<a href="' + info[i].url + '&searchType=2" target="_blank">' + info[i].title + '</a>';
                                }
                            }
                        }
                        $("#searchHot").html(str);
                    } else {
                        $("#searchHot").remove();
                    } 
                }
        );  


    });
    // 其他参数更多
    function showItem(obj) {
        if ($(obj).hasClass("open-up")) {
            $(obj).siblings("dl").children("dd").addClass("more");
            $(obj).removeClass("open-up").addClass("open-down").html("收起<i></i>");
        }else{
            $(obj).siblings("dl").children("dd").removeClass("more");
            $(obj).removeClass("open-down").addClass("open-up").html("更多<i></i>");
        }
    }
    // 字母匹配筛选品牌
    function showBrand(o, n) {
        o.addClass("hover").siblings().removeClass("hover");
        if (n === "0") {
            $(".brandlist").children("ul").find("li").css("display", "block");
        } else {
            $(".brandlist").children("ul").find("li").css("display", "none").filter("[rel='" + n + "']").css("display", "block");
        }
        var showNum = $(".brandlist > ul > li:visible").length;

        if(showNum>0){
            $(".brandlist p").hide();
        }else{
            $(".brandlist p").show();
        }
    }
    // 关键词搜索匹配筛选品牌
    function showManu(obj) {
        var manuList = $(".brandlist").children("ul").children("li");
        for (var i in manuList) {
           var manuName = manuList.eq(i).attr("manuName");
           if(typeof(manuName) != 'undefined'){
                if(manuName.indexOf(obj)>=0){
                    manuList.eq(i).css("display", "block");
                }else{
                    manuList.eq(i).css("display", "none");
                }
           }
        }
        var showNum = $(".brandlist > ul > li:visible").length;

        if(showNum>0){
            $(".brandlist p").hide();
        }else{
            $(".brandlist p").show();
        }
    }

    // 搜索提交
    function submitList(submitType) {            
        var searchKeywords = $(".brand").html();
        var priceStart     = $("#priceStart").val();
        var priceEnd       = $("#priceEnd").val();
        priceStart         = priceStart.replace("￥",'');
        priceEnd           = priceEnd.replace("￥",'');
        var submitConfirm  = 2;
        if('undefined'!= submitType){
            submitConfirm = submitType;
        }
        var isSuit = 0;
        if ($(":input[name=is_suit]").is(":checked")) {
            isSuit = 1;
        }

        var isHdfk = 0;
        if ($(":input[name=is_hdfk]").is(":checked")) {
            isHdfk = 1;
        }

        var isPay = 0;
        if ($(":input[name=is_pay]").is(":checked")) {
            isPay = 1;
        }

        var isProtect = 0;
        if ($(":input[name=is_protect]").is(":checked")) {
            isProtect = 1;
        }

        var isGreenChannel = 0;
        if ($(":input[name=is_green_channel]").is(":checked")) {
            isGreenChannel = 1;
        }

        var isPromo = 0;
        if ($(":input[name=is_promo]").is(":checked")) {
            isPromo = 1;
        }

        var isXiaoBao = 0;
        if ($(":input[name=is_xiaobao]").is(":checked")) {
            isXiaoBao = 1;
        }

        var isQi = 0;
        if ($(":input[name=is_qi]").is(":checked")) {
            isQi = 1;
        }

        var isZheng = 0;
        if ($(":input[name=is_zheng]").is(":checked")) {
            isZheng = 1;
        }

        var isShang = 0;
        if ($(":input[name=is_shang]").is(":checked")) {
            isShang = 1;
        }

        var isTrue = 0;
        if ($(":input[name=is_true]").is(":checked")) {
            isTrue = 1;
        }
        var isZPlus = 0;
        if ($(":input[name=is_zplus]").is(":checked")) {
            isZPlus = 1;
        }
        var isFullsent = 0;
        if ($(":input[name=is_fullsent]").is(":checked")) {
            isFullsent = 1;
        }
        var url = baseDetailUrl+"/index.php?c=Ajax_List&a=GetSeeUrlV1&t=" + Math.random();
        $.getJSON(
                url,
                {cateId:cateId, subId:subId, manuId:manuId, provinceId:provinceId, searchKeywords:searchKeywords, priceStart:priceStart, priceEnd:priceEnd,
                 isSuit:isSuit,isHdfk:isHdfk, isPay:isPay, isPromo:isPromo, isXiaoBao:isXiaoBao, isQi:isQi, isZheng:isZheng, 
                 isShang:isShang, isTrue:isTrue, orderby:orderby, priceRange:priceRange, paramStr:paramStr, isProtect:isProtect, isGreenChannel:isGreenChannel,
                 isZPlus:isZPlus, isFullsent:isFullsent,submitConfirm:submitConfirm},
        function(data) {
            if (data.url) {
                $("#Z_searchForm").attr("action", data.url);
                window.location.href = data.url;
            }
        }

        );
        return false;
    }
        // 统计代码
        function getUserTrack(event, goodsId, url) {
            var statsImg = new Image();
            var rand = new Date().getTime();
            var ipck = getCookie('ip_ck');
            var URL = typeof(url) == 'undefined' ? document.URL : url;
            //http://pvtest.zol.com.cn/images/pvevents.gif?t=时间戳 &event=tuan_tui1 &ip_ck=读ip_ck cookie &url=document_URL
            statsImg.src = 'http://pvtest.zol.com.cn/images/pvevents.gif?t='
                    + rand + '&event=' + event
                    + '&ip_ck=' + ipck
                    + '&goodsId=' + goodsId
                    + '&url=' + URL;

        }
        //“限时抢购”统计
        $(".sc_list_qiang_class").click(function() {
            var goodsId = $(this).attr("goodsId");
            getUserTrack('sc_list_qiang',goodsId);
        });
    </script>





<!-- 商品精选  -->


<div class="w"><div style="display: block;" id="J_goods_best" class="m-box-s1 rec-goods-chosen hide">                <div class="mt"><strong class="mt-title">商品精选</strong></div>                <div class="mc">                    <ul data-type="48" class="goods-chosen-list clearfix">                      <li data-sku="1//x.jd.com/dsp/np?log=/ThDaRjBiwblT/ZTecLw1T+5wmVDMjtFw0SttKnEdKu/J46GtD7fgTwARFMOVmLnFr3ESSZ4/QeChTvRWk5ImX/YRSqKZyuziNYGPaRB03L/jr5cJB6TzTKzSkXDYcnFE0Vm+13QSd+PiHgbvaAfon6JKi3TWwFJMJIr4h74ENeFtrJLsZLL+x+Y9DE4VnvOmyqiKLgUPSj8RP5nXUWpaUBJ972CQua/rR6koYMI4cVVPbV9JGURJJ9gYfnw2WRrRaYwYi10OPWjlXPWWX+2oSf795m+aclGpOZUNJCsvHCtHfGjBfIeZkWNDWWHgmUma+nqeq6+8fv5VhwHERqm4fiVFJZ6i/BJMPKiUIt6b1lvyPnyd2rvvuPEimoj/6upWcs+u3vOK8LHm7eQcIlcCG38hFwl3KhGM30ViLSE8xSE9O1kvs2VqPvF0pBz9BRzPW8VY5IB67IKJq8235pyAdU/7SEQBOReChgcYzWQnyI=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "8", "1326953", "2", "1", "C")'>                      <div class="p-img">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwNTY5MDNfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMjY5NTMuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKu_J46GtD7fgTwARFMOVmLnFr3ESSZ4_QeChTvRWk5ImX_YRSqKZyuziNYGPaRB03L_jr5cJB6TzTKzSkXDYcnFE0Vm-13QSd-PiHgbvaAfon6JKi3TWwFJMJIr4h74ENeFtrJLsZLL-x-Y9DE4VnvOzA74knLFh3dfBLC810HqwYICgXzWfpknd4qSqyAQccDyTuCG1TtAv1MsAJ5HSCVMB74IIpnLku7mkpM2Ce3Bp_BiTMJ0EhQT9nEMIMBJJ_4dAhd0drazj25qnmjqw0MHSlTAorFfdwDGK5Oxwy9j5IySuzRW7ZdjEDlLbl_dBaG9TsDjGDHnKgcfexSTHg4i&amp;v=404" title="摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机">                              <img data-img="1" src="${adImgServer}55496595Nff838baf_002.jpg" class="err-product" height="190" width="190">                          </a>                      </div>                      <div class="p-name">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwNTY5MDNfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMjY5NTMuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKu_J46GtD7fgTwARFMOVmLnFr3ESSZ4_QeChTvRWk5ImX_YRSqKZyuziNYGPaRB03L_jr5cJB6TzTKzSkXDYcnFE0Vm-13QSd-PiHgbvaAfon6JKi3TWwFJMJIr4h74ENeFtrJLsZLL-x-Y9DE4VnvOzA74knLFh3dfBLC810HqwYICgXzWfpknd4qSqyAQccDyTuCG1TtAv1MsAJ5HSCVMB74IIpnLku7mkpM2Ce3Bp_BiTMJ0EhQT9nEMIMBJJ_4dAhd0drazj25qnmjqw0MHSlTAorFfdwDGK5Oxwy9j5IySuzRW7ZdjEDlLbl_dBaG9TsDjGDHnKgcfexSTHg4i&amp;v=404" title="摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机">                              <em>摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 移动联通电信4G手机</em>                          </a>                      </div>                      <div class="p-price">                          <strong class="price"><span class="J-p-1326953">￥1699.00</span></strong>                          <span class="p-ico J-pt-1326953"></span>                      </div>                      <div class="p-review">                          <a href="http://item.jd.com/1326953.html#comment-list" target="_blank" class="number">6382</a>人好评                      </div>                    </li>                       <li data-sku="2//x.jd.com/dsp/np?log=/ThDaRjBiwblT/ZTecLw1T+5wmVDMjtFw0SttKnEdKuEr3AFkXrOcnhvzSBFRVn2eCSC73HtAHujk2L2yUATzn7pD9VMxzNF0TAIFvTyy9VxsU43poB48oOZ9wVJWHNPshSxWvUUam9hD96N/CVLVyRy5NOKGyjKfLjZJlVPd4wy/BH3earT3Oi+aLQO/0S/l8nFegi19NURa2dgBm0lMji0MIkHCtAE5GhwbuaqRV2MeuBDIoVJEsOXOyjMTJi0BqQhBGvwjz8JPhjC/1hgYfQHL4VmmOKBW0ls6KzwlZ6SGigKxseXU4d4SyPgr49kS8+jhlJqBX2NbgT2kzTmGTMmSRJ3SGYM4+okT3yQhqruI/rsgGdRU1r/ylb/SSrJEEMK1GvS+Beu9F/cHFgDNLFnIbe0AwN9sZ4Szf+zRm5HKy+W0xKx1FoFukZvXOvjI8HaTNunSfwE8WQZ/TD4+jdS5HnBTh9lCyw7cdxW968=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "8", "1057746", "2", "2", "C")'>                      <div class="p-img">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwMjY0MDZfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEwNTc3NDYuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKuEr3AFkXrOcnhvzSBFRVn2eCSC73HtAHujk2L2yUATzn7pD9VMxzNF0TAIFvTyy9VxsU43poB48oOZ9wVJWHNPshSxWvUUam9hD96N_CVLVyRy5NOKGyjKfLjZJlVPd4wy_BH3earT3Oi-aLQO_0S_85khEn9PvNhxJFi4RQ57qCG-wFrPQ19YTSjaEpdeVluizoSRx4mQX25GVEc4ZxeC58hGaQzJL-E-w-YKpzz2CyHCttO_74NbXUXbV65kNH4ZOZuj9mTZSJD3QY3kcqr21opp6kpEIaJXqQBcciNnoIKvaPDbDRtS40wVWAxax3VW_oxwbJs7JgpK-Ergz4a5&amp;v=404" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机">                              <img data-img="1" src="${adImgServer}55c17dc0Nd62f4a8e_002.jpg" class="err-product" height="190" width="190">                          </a>                      </div>                      <div class="p-name">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTUwMjY0MDZfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEwNTc3NDYuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKuEr3AFkXrOcnhvzSBFRVn2eCSC73HtAHujk2L2yUATzn7pD9VMxzNF0TAIFvTyy9VxsU43poB48oOZ9wVJWHNPshSxWvUUam9hD96N_CVLVyRy5NOKGyjKfLjZJlVPd4wy_BH3earT3Oi-aLQO_0S_85khEn9PvNhxJFi4RQ57qCG-wFrPQ19YTSjaEpdeVluizoSRx4mQX25GVEc4ZxeC58hGaQzJL-E-w-YKpzz2CyHCttO_74NbXUXbV65kNH4ZOZuj9mTZSJD3QY3kcqr21opp6kpEIaJXqQBcciNnoIKvaPDbDRtS40wVWAxax3VW_oxwbJs7JgpK-Ergz4a5&amp;v=404" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机">                              <em>Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机</em>                          </a>                      </div>                      <div class="p-price">                          <strong class="price"><span class="J-p-1057746">￥2688.00</span></strong>                          <span class="p-ico J-pt-1057746"></span>                      </div>                      <div class="p-review">                          <a href="http://item.jd.com/1057746.html#comment-list" target="_blank" class="number">129103</a>人好评                      </div>                    </li>                       <li data-sku="3//x.jd.com/dsp/np?log=/ThDaRjBiwblT/ZTecLw1T+5wmVDMjtFw0SttKnEdKsyWKmtcdpPkqrV+xWYVq1sGROl3iiLwHx17RjGUry7cHkqSFb9VW/+phDvjpoxtBq0VKg32Ccoyosyb4m9cbaEhPQ+tmr5YT9k/T3L7LIGpB1ylBmxo3BHW3EaRxIYlm5WIjIpoUj26TbzfpCYPdfuRG0tTCTe2XQ8FASY1bdgIBcCNazRtQYVTFK3SoFvn7tmjOJFnKILYUgs5+mIMZjYbmUE3CAHZiUAigRVPXW4vN/6XOvg+eDdzbnknaxRKi96osx8eareXmaULr9RSIowXmHb3pbDV0usXRm9q9dmikogittcpIxKJXRtDzBTwo72D5PWWR5/ISCeIuErrmnXwFH9+ynTOQSEvJXqO3v1DcWXyb2jwPAxqYiafTB3GNsQz0wrTb1hQ8ydMLjrpAEyycZEhnYPGPwyHihhTlhunWMLaOmLiUfb92UyBE+IUqQ=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "8", "1169454", "2", "3", "C")'>                      <div class="p-img">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTU3NTUyNjZfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzExNjk0NTQuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKsyWKmtcdpPkqrV-xWYVq1sGROl3iiLwHx17RjGUry7cHkqSFb9VW_-phDvjpoxtBq0VKg32Ccoyosyb4m9cbaEhPQ-tmr5YT9k_T3L7LIGpB1ylBmxo3BHW3EaRxIYlm5WIjIpoUj26TbzfpCYPdfudwqYW7J5FteDNRuNkTg2tRevGPdb-ceVMVKymqpYyIx67vYYIyFNBzlAL58v36zYnxs1d_TPKmvNt_3xBreU_e1tBgwb7fwg3q4F90UQz-77LlI3vwJKIbYyAsp1GNX4y9tbHu1gfSp5M0m4F7vg9vxZT1RQOnuMss0lrpRtg-nosYIjKhlLoHjxbnEDdohU&amp;v=404" title="一加手机（A0001）64GB 砂岩黑 移动4G手机">                              <img data-img="1" src="${adImgServer}55667d63N29c71bcf_002.jpg" class="err-product" height="190" width="190">                          </a>                      </div>                      <div class="p-name">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTU3NTUyNjZfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzExNjk0NTQuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKsyWKmtcdpPkqrV-xWYVq1sGROl3iiLwHx17RjGUry7cHkqSFb9VW_-phDvjpoxtBq0VKg32Ccoyosyb4m9cbaEhPQ-tmr5YT9k_T3L7LIGpB1ylBmxo3BHW3EaRxIYlm5WIjIpoUj26TbzfpCYPdfudwqYW7J5FteDNRuNkTg2tRevGPdb-ceVMVKymqpYyIx67vYYIyFNBzlAL58v36zYnxs1d_TPKmvNt_3xBreU_e1tBgwb7fwg3q4F90UQz-77LlI3vwJKIbYyAsp1GNX4y9tbHu1gfSp5M0m4F7vg9vxZT1RQOnuMss0lrpRtg-nosYIjKhlLoHjxbnEDdohU&amp;v=404" title="一加手机（A0001）64GB 砂岩黑 移动4G手机">                              <em>一加手机（A0001）64GB 砂岩黑 移动4G手机</em>                          </a>                      </div>                      <div class="p-price">                          <strong class="price"><span class="J-p-1169454">￥1499.00</span></strong>                          <span class="p-ico J-pt-1169454"></span>                      </div>                      <div class="p-review">                          <a href="http://item.jd.com/1169454.html#comment-list" target="_blank" class="number">26378</a>人好评                      </div>                    </li>                       <li data-sku="4//x.jd.com/dsp/np?log=/ThDaRjBiwblT/ZTecLw1T+5wmVDMjtFw0SttKnEdKuPANk/ro1zDHov3H3DET34L3vb/mHyUKS+ZcOeBtiTbcN/RofMAGQuKEE80ObP7wTaFJtejT7Rfv7oonYSSrwfOydfVREeuQqMy0KfT2EkOr+EaOaKkrzMoxoLFtfzH4HF0u22LFwjDUEUMBOW5rMcMBLQtx0BYNdviqX+zomb3ZnyJrPQ3+0T+yyurxGBC9hSwmwy+boAVLHV71uRiBU1761qTzqNLCSRS4Q52u96a/5iXb++ZqARMKsbgxkc5+QHATKQRP39XiHEZ9lgbEtudpLdPyXpT4xtNv2FkGyOOv/B61bkTAab2zZtyO2OtCRz8YSyu8RzzdVd0vvvHlfx45f9J9xagXFTsBOdoCu/ZDLzy8R/R5wCGSk2j44KDMJm6r7m6ZW1sla/wrssAw7LG+5CPdK0QWl1XcPLHwBz76caTvafimpe9tW6oPLvRhs=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "8", "1307481", "2", "4", "C")'>                      <div class="p-img">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTQwNTMyODJfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMDc0ODEuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKuPANk_ro1zDHov3H3DET34L3vb_mHyUKS-ZcOeBtiTbcN_RofMAGQuKEE80ObP7wTaFJtejT7Rfv7oonYSSrwfOydfVREeuQqMy0KfT2EkOr-EaOaKkrzMoxoLFtfzH4HZBx-E-bN41A5Qiov2TghVPYEkBbVPgant4r452KdzksZbAaWl8CdX4T8eTPB6DXNy7szXVFZZFClbgSDq75-6sxWoUcgaTagh2pV02ETxIetxBt6T0SQkT-r4eP_4QFOhll3tQOhqbtZXcWrglgAGUPZ8bOh5BPr3GJPfgP4Qe4D5HnWankEiy6QBzdA07xQijd59ieyBdsgQqbUzPFQn&amp;v=404" title="华为（HUAWEI）GX1 (SC-CL00) 白 电信4G手机 双卡双待">                              <img data-img="1" src="${adImgServer}55474c56N8e0d36d8_002.jpg" class="err-product" height="190" width="190">                          </a>                      </div>                      <div class="p-name">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTQwNTMyODJfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzEzMDc0ODEuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKuPANk_ro1zDHov3H3DET34L3vb_mHyUKS-ZcOeBtiTbcN_RofMAGQuKEE80ObP7wTaFJtejT7Rfv7oonYSSrwfOydfVREeuQqMy0KfT2EkOr-EaOaKkrzMoxoLFtfzH4HZBx-E-bN41A5Qiov2TghVPYEkBbVPgant4r452KdzksZbAaWl8CdX4T8eTPB6DXNy7szXVFZZFClbgSDq75-6sxWoUcgaTagh2pV02ETxIetxBt6T0SQkT-r4eP_4QFOhll3tQOhqbtZXcWrglgAGUPZ8bOh5BPr3GJPfgP4Qe4D5HnWankEiy6QBzdA07xQijd59ieyBdsgQqbUzPFQn&amp;v=404" title="华为（HUAWEI）GX1 (SC-CL00) 白 电信4G手机 双卡双待">                              <em>华为（HUAWEI）GX1 (SC-CL00) 白 电信4G手机 双卡双待</em>                          </a>                      </div>                      <div class="p-price">                          <strong class="price"><span class="J-p-1307481">￥829.00</span></strong>                          <span class="p-ico J-pt-1307481"></span>                      </div>                      <div class="p-review">                          <a href="http://item.jd.com/1307481.html#comment-list" target="_blank" class="number">5411</a>人好评                      </div>                    </li>                       <li data-sku="5//x.jd.com/dsp/np?log=/ThDaRjBiwblT/ZTecLw1T+5wmVDMjtFw0SttKnEdKv57a4vrLZd1iOG1XUnHJiddo1q01d2Q/gpzYTIvQWCvKEMujvpSEhxxgnaJMXgewrw9h/XApCe4Lef/sumiuILWO/F+8KdWvPFSPBUzNtDYWLq/1M5NNl/LCIDa6Iu++/0m45FUn9fAFvrFZxdgjQh9Q8PlGvxLpBFmu+WbVJBgZcUwScIBVPn0REPE3FuOPxXQPGzUvM9JarTUbDelML+BO0cU7gVrXSMMLJumqsKNriIABPtxMrE2l/sLS0PJNWAu3GPxhshwIs2raKaEXIYqv0ICbb2CXHXLrXW/Tvdx2MpJCLG3LpHRehRwfP2xIKuxPegMXWftcwV4VADxVAhwLSc5208iqm8XYzTaZYX4hGzgEfhebW5ZYUiAW2pLEWuKujKEVZNFMyCLh+bPqN9Fyf818t/QyffpjogmYMxYQhujEMxXF5VPAMkPQD9G9g=&amp;v=404" onclick='log("search", "list", "http://list.jd.com/list.html?cat=9987,653,655", "655", "8", "8", "1773549", "2", "5", "C")'>                      <div class="p-img">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTQ4ODUwMjVfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzE3NzM1NDkuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKv57a4vrLZd1iOG1XUnHJiddo1q01d2Q_gpzYTIvQWCvKEMujvpSEhxxgnaJMXgewrw9h_XApCe4Lef_sumiuILWO_F-8KdWvPFSPBUzNtDYWLq_1M5NNl_LCIDa6Iu--_0m45FUn9fAFvrFZxdgjQh312fBwxNrwHApOLz7GXOcrhM8sSFEf9O6i9z5ghtvico0uTJYIFEIdk5VSI9aqZbIT8nqMGMpEFs8SIVN6VWuZXeP3JAqhWtPHhNpYknyLYzCttqOm1oGwcE7pr8BG3IMWj9-T-TUAGVwyMQZPVRId9V0l6v3ulcmn7rpu3t3FElws6yd0G3CA0298r6kjZf&amp;v=404" title="乐视（Letv）乐1 pro（X800）32G 银色 移动联通4G手机 双卡双待">                              <img data-img="1" src="${adImgServer}55bf3fa2Nee28b063.jpg" class="err-product" height="190" width="190">                          </a>                      </div>                      <div class="p-name">                          <a target="_blank" href="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTQ4ODUwMjVfNDgmdG89aHR0cDovL2l0ZW0uamQuY29tLzE3NzM1NDkuaHRtbA&amp;log=_ThDaRjBiwblT_ZTecLw1T-5wmVDMjtFw0SttKnEdKv57a4vrLZd1iOG1XUnHJiddo1q01d2Q_gpzYTIvQWCvKEMujvpSEhxxgnaJMXgewrw9h_XApCe4Lef_sumiuILWO_F-8KdWvPFSPBUzNtDYWLq_1M5NNl_LCIDa6Iu--_0m45FUn9fAFvrFZxdgjQh312fBwxNrwHApOLz7GXOcrhM8sSFEf9O6i9z5ghtvico0uTJYIFEIdk5VSI9aqZbIT8nqMGMpEFs8SIVN6VWuZXeP3JAqhWtPHhNpYknyLYzCttqOm1oGwcE7pr8BG3IMWj9-T-TUAGVwyMQZPVRId9V0l6v3ulcmn7rpu3t3FElws6yd0G3CA0298r6kjZf&amp;v=404" title="乐视（Letv）乐1 pro（X800）32G 银色 移动联通4G手机 双卡双待">                              <em>乐视（Letv）乐1 pro（X800）32G 银色 移动联通4G手机 双卡双待</em>                          </a>                      </div>                      <div class="p-price">                          <strong class="price"><span class="J-p-1773549">￥1599.00</span></strong>                          <span class="p-ico J-pt-1773549"></span>                      </div>                      <div class="p-review">                          <a href="http://item.jd.com/1773549.html#comment-list" target="_blank" class="number">1498</a>人好评                      </div>                    </li>                     </ul>                </div></div></div>
  





<!-- 猜你喜欢  -->

  <div class="w"><div data-lazyload-fn="done" id="footmark" class="footmark">                
  <div style="display: block;" class="m hide may-like">            <div class="mt clearfix">               
   <h2 class="title">猜你喜欢</h2>             
      <div class="extra"><a clstag="personal|keycount|myhistory|hyp407" href="#none" class="change"><i class="ico"></i>
      <span class="txt">换一批</span></a></div>            </div>            <div class="mc">              
        <ul class="may-like-list clearfix">                   
         <li data-gid="1" onclick="clsClickLog('', '', '1905319', 2, 0, 'rodGlobalTrack');" data-push="1" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1905319$index=0$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=41a8e88122558d6d915eea13cdda9e8db22687a2">                        <div class="p-img">                            <a href="http://item.jd.com/1905319.html" title="华为 荣耀 畅玩4C (CHM-TL00H) 白色 移动增强版4G手机 双卡双待" target="_blank">                                <img src="${adImgServer}556fe7eaNf378087d.jpg" alt="华为 荣耀 畅玩4C (CHM-TL00H) 白色 移动增强版4G手机 双卡双待" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1905319.html" target="_blank" title="华为 荣耀 畅玩4C (CHM-TL00H) 白色 移动增强版4G手机 双卡双待">华为 荣耀 畅玩4C (CHM-TL00H) 白色 移动增强版4G手机 双卡双待</a></div>                        <div class="p-review"><a class="p-comm-1905319" href="http://club.jd.com/review/1905319-1-1.html" target="_blank">(已有22301人评价)</a></div>                        <div class="p-price J-p-1905319">￥799.00</div>                    </li>                    <li data-gid="1" onclick="clsClickLog('', '', '1057746', 2, 1, 'rodGlobalTrack');" data-push="2" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1057746$index=1$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=a08185a33e33db96e1f0abd954309f1e5a5e433f">                        <div class="p-img">                            <a href="http://item.jd.com/1057746.html" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机" target="_blank">                                <img src="${adImgServer}564c5465N82d8e969.jpg" alt="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1057746.html" target="_blank" title="Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机">Apple iPhone 5s (A1530) 16GB 金色 移动联通4G手机</a></div>                        <div class="p-review"><a class="p-comm-1057746" href="http://club.jd.com/review/1057746-1-1.html" target="_blank">(已有137812人评价)</a></div>                        <div class="p-price J-p-1057746">￥2688.00</div>                    </li>                    <li data-gid="1" onclick="clsClickLog('', '', '1743181', 2, 2, 'rodGlobalTrack');" data-push="3" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1743181$index=2$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=9425c9d389dfef863ea604a363617dcd5a6dfb21">                        <div class="p-img">                            <a href="http://item.jd.com/1743181.html" title="小米 红米Note 2 白色 移动4G手机 双卡双待" target="_blank">                                <img src="${adImgServer}55cc56e8N05d7bd8a.jpg" alt="小米 红米Note 2 白色 移动4G手机 双卡双待" height="130" width="130">                            </a>                        </div>     
                            <div class="p-name"><a href="http://item.jd.com/1743181.html" target="_blank" title="小米 红米Note 2 白色 移动4G手机 双卡双待">小米 红米Note 2 白色 移动4G手机 双卡双待</a></div>                        <div class="p-review"><a class="p-comm-1743181" href="http://club.jd.com/review/1743181-1-1.html" target="_blank">(已有61393人评价)</a></div>                        <div class="p-price J-p-1743181">￥799.00</div>                    </li>                    <li data-gid="1" onclick="clsClickLog('', '', '1514794', 2, 3, 'rodGlobalTrack');" data-push="4" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1514794$index=3$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=ba70db31f861666c016e9f65864685761cf52b4f">                        <div class="p-img">                            <a href="http://item.jd.com/1514794.html" title="小米 4 2GB内存版 白色 移动4G手机" target="_blank">                                <img src="${adImgServer}555aebfbN2625109b.jpg" alt="小米 4 2GB内存版 白色 移动4G手机" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1514794.html" target="_blank" title="小米 4 2GB内存版 白色 移动4G手机">小米 4 2GB内存版 白色 移动4G手机</a></div>                        <div class="p-review"><a class="p-comm-1514794" href="http://club.jd.com/review/1514794-1-1.html" target="_blank">(已有130084人评价)</a></div>                     
                               <div class="p-price J-p-1514794">￥1299.00</div>                    </li>                  
                                 <li data-gid="1" onclick="clsClickLog('', '', '20072638', 2, 4, 'rodGlobalTrack');" data-push="5" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20072638$index=4$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=9eb2b7c2ff369dc4181ffd9cb5a79f74bba4d5db">                        <div class="p-img">                            <a href="http://item.jd.com/20072638.html" title="三国杀标准版" target="_blank">                                <img src="${adImgServer}rBEQYFGUqsEIAAAAAAIay-Y5bmEAABUvQMGRc8AAhrj006.jpg" alt="三国杀标准版" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20072638.html" target="_blank" title="三国杀标准版">三国杀标准版</a></div>                        <div class="p-review"><a class="p-comm-20072638" href="http://club.jd.com/review/20072638-1-1.html" target="_blank">(已有7048人评价)</a></div>                        <div class="p-price J-p-20072638">￥23.20</div>                    </li>                    <li data-gid="1" onclick="clsClickLog('', '', '20013299', 2, 5, 'rodGlobalTrack');" data-push="6" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20013299$index=5$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=eb4e4a8e2145fa08b8deed0290d7ad37a31d7a95">                        <div class="p-img">                            <a href="http://item.jd.com/20013299.html" title="越听越聪明3：莫扎特音乐经典段落（2CD）" target="_blank">                                <img src="${adImgServer}f2bb3d03-01b4-4c05-87ff-1bc7ce0daff4.jpg" alt="越听越聪明3：莫扎特音乐经典段落（2CD）" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20013299.html" target="_blank" title="越听越聪明3：莫扎特音乐经典段落（2CD）">越听越聪明3：莫扎特音乐经典段落（2CD）</a></div>                        <div class="p-review"><a class="p-comm-20013299" href="http://club.jd.com/review/20013299-1-1.html" target="_blank">(已有2570人评价)</a></div>                        <div class="p-price J-p-20013299">￥12.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '20080014', 2, 6, 'rodGlobalTrack');" data-push="7" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20080014$index=6$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=2d50c5318939a2be1230e590d7ce483c9efd3bb">                        <div class="p-img">                            <a href="http://item.jd.com/20080014.html" title="美国早教：芝麻街快乐成长版1~8岁 套装（22DVD）（京东专卖）" target="_blank">                                <img src="${adImgServer}rBEhWFJvf6AIAAAAAA76QFouyFcAAEu-gK9WEUADvpY904.jpg" alt="美国早教：芝麻街快乐成长版1~8岁 套装（22DVD）（京东专卖）" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20080014.html" target="_blank" title="美国早教：芝麻街快乐成长版1~8岁 套装（22DVD）（京东专卖）">美国早教：芝麻街快乐成长版1~8岁 套装（22DVD）（京东专卖）</a></div>                        <div class="p-review"><a class="p-comm-20080014" href="http://club.jd.com/review/20080014-1-1.html" target="_blank">(已有1042人评价)</a></div>                        <div class="p-price J-p-20080014">￥89.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '20062574', 2, 7, 'rodGlobalTrack');" data-push="8" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20062574$index=7$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=5b3bce2a7ceb6a8966d52f4774bcc8b8e2da6f49">                        <div class="p-img">                            <a href="http://item.jd.com/20062574.html" title="欢乐坊：天黑请闭眼" target="_blank">                                <img src="${adImgServer}53f1a2ddN7cbd296d.jpg" alt="欢乐坊：天黑请闭眼" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20062574.html" target="_blank" title="欢乐坊：天黑请闭眼">欢乐坊：天黑请闭眼</a></div>                        <div class="p-review"><a class="p-comm-20062574" href="http://club.jd.com/review/20062574-1-1.html" target="_blank">(已有752人评价)</a></div>                        <div class="p-price J-p-20062574">￥15.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '2063517', 2, 8, 'rodGlobalTrack');" data-push="9" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=2063517$index=8$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=9cfbc201735be3a857fc2aa61fbe04f7c6ae4ab0">                        <div class="p-img">                            <a href="http://item.jd.com/2063517.html" title="三星 Galaxy On7（G6000）金色 全网通4G手机 双卡双待" target="_blank">                                <img src="${adImgServer}5627609eN65931e21.jpg" alt="三星 Galaxy On7（G6000）金色 全网通4G手机 双卡双待" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/2063517.html" target="_blank" title="三星 Galaxy On7（G6000）金色 全网通4G手机 双卡双待">三星 Galaxy On7（G6000）金色 全网通4G手机 双卡双待</a></div>                        <div class="p-review"><a class="p-comm-2063517" href="http://club.jd.com/review/2063517-1-1.html" target="_blank">(已有68人评价)</a></div>                        <div class="p-price J-p-2063517">￥1398.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '1618201', 2, 9, 'rodGlobalTrack');" data-push="10" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1618201$index=9$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=f0c4aaad5659ab8949b052140dbe927e8e1cd602">                        <div class="p-img">                            <a href="http://item.jd.com/1618201.html" title="【简约套装版】魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待" target="_blank">                                <img src="${adImgServer}556d64fcNf28f90d0.jpg" alt="【简约套装版】魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1618201.html" target="_blank" title="【简约套装版】魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待">【简约套装版】魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待</a></div>                        <div class="p-review"><a class="p-comm-1618201" href="http://club.jd.com/review/1618201-1-1.html" target="_blank">(已有66683人评价)</a></div>                        <div class="p-price J-p-1618201">￥849.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '1196255', 2, 10, 'rodGlobalTrack');" data-push="11" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1196255$index=10$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=a3a1ab9803ea3e6ee12b61715bd555e39b1506d6">                        <div class="p-img">                            <a href="http://item.jd.com/1196255.html" title="荣耀 6 (H60-L01) 3GB内存标准版 白色 移动4G手机" target="_blank">                                <img src="${adImgServer}554c7561N818b93df.jpg" alt="荣耀 6 (H60-L01) 3GB内存标准版 白色 移动4G手机" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1196255.html" target="_blank" title="荣耀 6 (H60-L01) 3GB内存标准版 白色 移动4G手机">荣耀 6 (H60-L01) 3GB内存标准版 白色 移动4G手机</a></div>                        <div class="p-review"><a class="p-comm-1196255" href="http://club.jd.com/review/1196255-1-1.html" target="_blank">(已有153060人评价)</a></div>                        <div class="p-price J-p-1196255">￥1299.00</div>                    </li>                    <li data-gid="2" onclick="clsClickLog('', '', '10015005122', 2, 11, 'rodGlobalTrack');" data-push="12" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=10015005122$index=11$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=7012b07c25e50f7f6462c190f5de2cf5f39b61b5">                        <div class="p-img">                            <a href="http://item.jd.com/10015005122.html" title="启墨苑秋冬女鞋女靴 2015秋冬英伦风靴女鞋短筒粗跟擦色学生女靴马丁短靴女秋季 黑色 34" target="_blank">                                <img src="${adImgServer}563786b5Nca26aa65.jpg" alt="启墨苑秋冬女鞋女靴 2015秋冬英伦风靴女鞋短筒粗跟擦色学生女靴马丁短靴女秋季 黑色 34" height="130" width="130">                            </a>                        </div>              
                                 
                                 
                                           <div class="p-name"><a href="http://item.jd.com/10015005122.html" target="_blank" title="启墨苑秋冬女鞋女靴 2015秋冬英伦风靴女鞋短筒粗跟擦色学生女靴马丁短靴女秋季 黑色 34">启墨苑秋冬女鞋女靴 2015秋冬英伦风靴女鞋短筒粗跟擦色学生女靴马丁短靴女秋季 黑色 34</a></div>                        <div class="p-review"><a class="p-comm-10015005122" href="http://club.jd.com/review/10015005122-1-1.html" target="_blank">(已有0人评价)</a></div>                        <div class="p-price J-p-10015005122">￥1108.00</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '20081897', 2, 12, 'rodGlobalTrack');" data-push="13" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20081897$index=12$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=eb5140ee815f9d738687760f12a6aec34960d1e2">                        <div class="p-img">                            <a href="http://item.jd.com/20081897.html" title="迪士尼：特务欧宝 套装（15DVD）（京东专卖）" target="_blank">                                <img src="${adImgServer}rBEhWFMmvgcIAAAAAAqAsQlgYa8AAKPOAKV_DcACoDJ192.jpg" alt="迪士尼：特务欧宝 套装（15DVD）（京东专卖）" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20081897.html" target="_blank" title="迪士尼：特务欧宝 套装（15DVD）（京东专卖）">迪士尼：特务欧宝 套装（15DVD）（京东专卖）</a></div>                        <div class="p-review"><a class="p-comm-20081897" href="http://club.jd.com/review/20081897-1-1.html" target="_blank">(已有75人评价)</a></div>                        <div class="p-price J-p-20081897">￥125.00</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '20002042', 2, 13, 'rodGlobalTrack');" data-push="14" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20002042$index=13$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=3084b7fed4b4216910304bb1dc1e2ecfe33d7aaf">                        <div class="p-img">                            <a href="http://item.jd.com/20002042.html" title="公司的力量（5DVD）" target="_blank">                                <img src="${adImgServer}c2c809e3-07a0-4f75-8c45-7fe2a7b7d231.jpg" alt="公司的力量（5DVD）" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20002042.html" target="_blank" title="公司的力量（5DVD）">公司的力量（5DVD）</a></div>                        <div class="p-review"><a class="p-comm-20002042" href="http://club.jd.com/review/20002042-1-1.html" target="_blank">(已有232人评价)</a></div>                        <div class="p-price J-p-20002042">￥120.00</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '20020158', 2, 14, 'rodGlobalTrack');" data-push="15" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=20020158$index=14$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=99301ace88357591c9c7fd2bf65bc0287013129b">                        <div class="p-img">                            <a href="http://item.jd.com/20020158.html" title="好儿歌天天唱（3CD）" target="_blank">                                <img src="${adImgServer}60d60cfb-2750-4b8b-8760-f5438ad6361f.jpg" alt="好儿歌天天唱（3CD）" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/20020158.html" target="_blank" title="好儿歌天天唱（3CD）">好儿歌天天唱（3CD）</a></div>                        <div class="p-review"><a class="p-comm-20020158" href="http://club.jd.com/review/20020158-1-1.html" target="_blank">(已有162人评价)</a></div>                        <div class="p-price J-p-20020158">￥11.30</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '1011452320', 2, 15, 'rodGlobalTrack');" data-push="16" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1011452320$index=15$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=910009b1b252e85dcbe0642940154f735ecf217c">                        <div class="p-img">                            <a href="http://item.jd.com/1011452320.html" title="玛格丽特 毛绒娃娃 玩具 棒球帽麦兜猪公仔 礼物精选 精品大号 粉色帽子 150厘米" target="_blank">                                <img src="${adImgServer}53e4826eNa7d24c64.jpg" alt="玛格丽特 毛绒娃娃 玩具 棒球帽麦兜猪公仔 礼物精选 精品大号 粉色帽子 150厘米" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1011452320.html" target="_blank" title="玛格丽特 毛绒娃娃 玩具 棒球帽麦兜猪公仔 礼物精选 精品大号 粉色帽子 150厘米">玛格丽特 毛绒娃娃 玩具 棒球帽麦兜猪公仔 礼物精选 精品大号 粉色帽子 150厘米</a></div>                        <div class="p-review"><a class="p-comm-1011452320" href="http://club.jd.com/review/1011452320-1-1.html" target="_blank">(已有26人评价)</a></div>                        <div class="p-price J-p-1011452320">￥388.00</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '10006104432', 2, 16, 'rodGlobalTrack');" data-push="17" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=10006104432$index=16$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=14f09d1049e8138fc95cfab81fe268e67a730392">                        <div class="p-img">                            <a href="http://item.jd.com/10006104432.html" title="梦想折折乐——马达加斯加3(交通工具)" target="_blank">                                <img src="${adImgServer}56330974N0c064ea6.jpg" alt="梦想折折乐——马达加斯加3(交通工具)" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/10006104432.html" target="_blank" title="梦想折折乐——马达加斯加3(交通工具)">梦想折折乐——马达加斯加3(交通工具)</a></div>                        <div class="p-review"><a class="p-comm-10006104432" href="http://club.jd.com/review/10006104432-1-1.html" target="_blank">(已有0人评价)</a></div>                        <div class="p-price J-p-10006104432">￥8.40</div>                    </li>                    <li data-gid="3" onclick="clsClickLog('', '', '1012952', 2, 17, 'rodGlobalTrack');" data-push="18" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1012952$index=17$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=8e99ce76136a4b8086745fc3d5068ec42d491114">                        <div class="p-img">                            <a href="http://item.jd.com/1012952.html" title="美丽雅 特惠 4卷装 垃圾袋 45x55cm 100只 HC050174" target="_blank">             
                                           
                                           
                                           
<img src="${adImgServer}5409811fN3b4d5d86.jpg" alt="美丽雅 特惠 4卷装 垃圾袋 45x55cm 100只 HC050174" height="130" width="130"/>                          

  </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1012952.html" target="_blank" title="美丽雅 特惠 4卷装 垃圾袋 45x55cm 100只 HC050174">美丽雅 特惠 4卷装 垃圾袋 45x55cm 100只 HC050174</a></div>                        <div class="p-review"><a class="p-comm-1012952" href="http://club.jd.com/review/1012952-1-1.html" target="_blank">(已有82829人评价)</a></div>                        <div class="p-price J-p-1012952">￥9.90</div>                    </li>                    <li data-gid="4" onclick="clsClickLog('', '', '701382', 2, 18, 'rodGlobalTrack');" data-push="19" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=701382$index=18$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=adb73919f285ed35819373c1ab97ade88ab6204e">                        <div class="p-img">                            <a href="http://item.jd.com/701382.html" title="妙洁 点断式平底垃圾袋促销装（45cm*50cm*90只） MBGRMC2+1 3040" target="_blank">                                <img src="${adImgServer}5449f317N86bab23c.jpg" alt="妙洁 点断式平底垃圾袋促销装（45cm*50cm*90只） MBGRMC2+1 3040" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/701382.html" target="_blank" title="妙洁 点断式平底垃圾袋促销装（45cm*50cm*90只） MBGRMC2+1 3040">妙洁 点断式平底垃圾袋促销装（45cm*50cm*90只） MBGRMC2+1 3040</a></div>                        <div class="p-review"><a class="p-comm-701382" href="http://club.jd.com/review/701382-1-1.html" target="_blank">(已有13592人评价)</a></div>                        <div class="p-price J-p-701382">￥9.90</div>                    </li>                    <li data-gid="4" onclick="clsClickLog('', '', '1132433', 2, 19, 'rodGlobalTrack');" data-push="20" data-clk="//mercury.jd.com/log.gif?t=rec.202002&amp;v=src=rec$action=1$reqsig=542b33b12ce8c954eacd44aaeb74961ba9917c95$enb=1$sku=0$csku=1132433$index=19$st=0$adcli=$expid=0&amp;rid=6988971064507570233&amp;ver=1&amp;sig=dc6e11a661818ff9c5b5f51fdf2b6ae269635e01">                        <div class="p-img">                            <a href="http://item.jd.com/1132433.html" title="宜洁（yekee）环保卫生厨房清洁食品餐具一次性手套 50只装（28cm×30cm） Y-9990" target="_blank">                                <img src="${adImgServer}541816b5Nc7b6140a.jpg" alt="宜洁（yekee）环保卫生厨房清洁食品餐具一次性手套 50只装（28cm×30cm） Y-9990" height="130" width="130">                            </a>                        </div>                        <div class="p-name"><a href="http://item.jd.com/1132433.html" target="_blank" title="宜洁（yekee）环保卫生厨房清洁食品餐具一次性手套 50只装（28cm×30cm） Y-9990">宜洁（yekee）环保卫生厨房清洁食品餐具一次性手套 50只装（28cm×30cm） Y-9990</a></div>                        <div class="p-review"><a class="p-comm-1132433" href="http://club.jd.com/review/1132433-1-1.html" target="_blank">(已有5503人评价)</a></div>     
                     <div class="p-price J-p-1132433">￥3.90</div>                    </li>                </ul>            </div></div>                </div></div>
