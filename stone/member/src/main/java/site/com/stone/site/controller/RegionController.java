package com.stone.site.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.site.mapper.TRegionMapper;
import com.stone.site.model.TRegion;

@Controller
public class RegionController extends BaseController{
	
	
	
	@RequestMapping(value = "region_sublist")
	public @ResponseBody List<TRegion> sublist(HttpServletRequest rqs, long pid) throws BusinessException {
		TRegionMapper rm = this.getMybatisBaseService().getMapper(TRegionMapper.class);
		List<TRegion> list = rm.selectSublistByPid(pid);
	    return list;
	}
	
	
}
