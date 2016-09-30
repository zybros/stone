package com.stone.brand.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.stone.ad.model.TAdLocationLink;
import com.stone.ad.service.ILocaAdLinkService;
import com.stone.base.controller.BaseController;
import com.stone.brand.model.TCategoryBrandKey;
import com.stone.brand.service.ICtgBrandLinkService;

/**
 * 品牌和分类关系管理
 * @author stone
 *
 */
@Controller
public class BrandCtgLinkController extends BaseController{
	
	
	
	@Resource(name = "ctgBrandLinkServiceImpl")
	private ICtgBrandLinkService ctgBrandLinkServiceImpl;
	
	@RequestMapping(value = "/admin/ctgBrand_add")
	public String register(HttpServletRequest rqs,HttpServletResponse rps, TCategoryBrandKey k) throws Exception {
		ctgBrandLinkServiceImpl.add(k);
		rps.sendRedirect("brand_listByCtgId.do?ctgId="+k.getCategoryId());
		return null;
	}


	@RequestMapping(value = "/admin/ctgBrand_del")
	public String logout(HttpServletResponse rps, TCategoryBrandKey k) throws Exception {
		ctgBrandLinkServiceImpl.delete(k);
		rps.sendRedirect("brand_listByCtgId.do?ctgId="+k.getCategoryId());
		return null;
	}
	
}
