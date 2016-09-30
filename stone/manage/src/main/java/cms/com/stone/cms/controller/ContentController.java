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
import com.stone.cms.mapper.TCmsCategoryMapper;
import com.stone.cms.mapper.TCmsContentMapper;
import com.stone.cms.model.TCmsCategory;
import com.stone.cms.model.TCmsContent;

import net.sf.json.JSONArray;

@Controller
public class ContentController extends BaseController{
	
	
	@RequestMapping(value = "adm/cms_content_add")
	public String add(HttpServletRequest rqs, TCmsContent content) throws BusinessException, IOException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		content.setAdminId(this.getCurrentAdminId(rqs));
		ccm.insert(content);
		return "redirect:cms_content_list.do";
	}
	
	@RequestMapping(value = "adm/cms_content_list")
	public ModelAndView list(HttpServletRequest rqs,  TCmsContent content) throws BusinessException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		List<TCmsContent> list = ccm.selectList(content);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/content_list");   
	    mav.addObject("list", list);
	    return mav;
	}
	
	@RequestMapping(value = "adm/cms_content_find_edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id) throws BusinessException {
		
		TCmsCategoryMapper ctgm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ctgm.selectSublist(0);
		JSONArray ctgArr = JSONArray.fromObject(list);
		
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		TCmsContent content = ccm.selectByPrimaryKey(id);
		
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/content_edit");   
	    mav.addObject("ctgArr", ctgArr);
	    mav.addObject("content", content);
	    
	    return mav;
	}
	
	
	@RequestMapping(value = "adm/cms_content_get")
	public ModelAndView get(HttpServletRequest rqs, int id) throws BusinessException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		TCmsContent content = ccm.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/content");   
	    mav.addObject("content", content);
	    return mav;
	}
	
	
	@RequestMapping(value = "adm/cms_content_update")
	public String update(HttpServletRequest rqs, TCmsContent content) throws BusinessException, IOException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		content.setAdminId(this.getCurrentAdminId(rqs));
		int a=ccm.updateByPrimaryKeySelective(content);
		System.out.println(a);
		
		return "redirect:cms_content_list.do";
	}
	
	@RequestMapping(value = "adm/cms_content_del")
	public String delete(HttpServletResponse rps, int id) throws BusinessException, IOException {
		TCmsContentMapper ccm = this.getMybatisBaseService().getMapper(TCmsContentMapper.class);
		ccm.deleteByPrimaryKey(id);
		return "redirect:cms_content_list.do";
	}
	
}
