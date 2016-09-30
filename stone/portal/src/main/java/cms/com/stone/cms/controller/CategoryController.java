package com.stone.cms.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cms.mapper.TCmsCategoryMapper;
import com.stone.cms.model.TCmsCategory;


@Controller("cmsCategoryController")
public class CategoryController extends BaseController{
	
	@RequestMapping(value = "cms_ctg_list")
	public ModelAndView list(HttpServletRequest rqs,  TCmsCategory ctg) throws BusinessException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectList(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cms_list");   
	    mav.addObject("list", list);
	    return mav;
	}
	
}
