package com.stone.ad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdMapper;
import com.stone.ad.model.TAd;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;

import net.sf.json.JSONArray;

/**
 * 广告管理
 * 
 * @author stone
 *
 */
@Controller
public class AdController extends BaseController {
	

	@RequestMapping(value = "/ad_listByLocation")
	public ModelAndView listByLocaId(HttpServletRequest rqs, int locationId, String page) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> adList = am.selectListByLocationId(locationId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("adList", adList);
		return mav;
	}
	
	
	@RequestMapping(value = "/ad_listByLocation4ajax")
	public @ResponseBody Object listByLocaId4ajax(HttpServletRequest rqs, int locationId, String page) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> adList = am.selectListByLocationId(locationId);
		JSONArray items = JSONArray.fromObject(adList);
		return items;
	}

}
