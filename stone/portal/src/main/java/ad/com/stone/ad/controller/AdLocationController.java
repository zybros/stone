package com.stone.ad.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdLocationMapper;
import com.stone.ad.model.TAdLocation;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cms.mapper.TCmsCategoryMapper;
import com.stone.cms.model.TCmsCategory;

import net.sf.json.JSONArray;

/**
 * 广告位置管理
 * @author stone
 *
 */
@Controller
public class AdLocationController extends BaseController{
	
	@RequestMapping(value = "/ad_loca_listByPid")
	public ModelAndView listByPid(HttpServletRequest rqs,int parentId, String page) throws BusinessException {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		List<TAdLocation> list = alm.selectSublist(parentId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/ad_loca_listByPid4ajax")
	public @ResponseBody Object listByPid4ajax(HttpServletRequest rqs,int parentId) throws BusinessException {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		List<TAdLocation> list = alm.selectSublist(parentId);
		JSONArray items = JSONArray.fromObject(list);
		return items;
	}
	
}
