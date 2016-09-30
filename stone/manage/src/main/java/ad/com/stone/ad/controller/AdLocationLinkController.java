package com.stone.ad.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.stone.ad.model.TAdLocationLink;
import com.stone.ad.service.ILocaAdLinkService;
import com.stone.base.controller.BaseController;

/**
 * 广告和位置关系管理
 * @author stone
 *
 */
@Controller
public class AdLocationLinkController extends BaseController{
	
	
	
	@Resource(name = "locaAdLinkServiceImpl")
	private ILocaAdLinkService locaAdLinkService;
	
	@RequestMapping(value = "/admin/adLocaLink_add")
	public String register(HttpServletRequest rqs,HttpServletResponse rps, TAdLocationLink all) throws Exception {
		locaAdLinkService.add(all);
		rps.sendRedirect("ad_listByLocation.do?locationId="+all.getLocationId());
		return null;
	}


	@RequestMapping(value = "/admin/adLocaLink_del")
	public String logout(HttpServletResponse rps, TAdLocationLink all) throws Exception {
		locaAdLinkService.delete(all);
		rps.sendRedirect("ad_listByLocation.do?locationId="+all.getLocationId());
		return null;
	}
	
}
