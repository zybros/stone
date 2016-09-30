package com.stone.cms.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cms.mapper.TCmsContentMapper;
import com.stone.cms.model.TCmsContent;

@Controller
public class ContentController extends BaseController{
	
	
	@RequestMapping(value = "cms_content_list")
	public ModelAndView list(HttpServletRequest rqs,  TCmsContent content, String page) throws BusinessException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		List<TCmsContent> cmsList = ccm.selectList(content);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(page);   
	    mav.addObject("cmsList", cmsList);
	    return mav;
	}
	
	
	@RequestMapping(value = "cms_content_item")
	public ModelAndView item(HttpServletRequest rqs, int id,String page) throws BusinessException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		TCmsContent content = ccm.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(page);   
	    mav.addObject("content", content);
	    return mav;
	}
	
}
