package com.stone.category.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.category.model.TCategoryTemplate;
import com.stone.category.service.ICategoryTemplateService;

import net.sf.json.JSONArray;

@Controller
public class TemplateController extends BaseController{
	protected static final Logger log = Logger.getLogger(TemplateController.class);
	
	@Resource(name = "categoryTemplateService")  
	private ICategoryTemplateService categoryTemplateService ; 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "template/getByCid4ajax")
	public @ResponseBody Map getByCid4ajax(HttpServletRequest rqs, int cid) throws BusinessException {
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		List<TCategoryTemplate> list = tm.selectByCategoryId(cid);
		Integer maxValueOrder = tm.selectMaxValueOderByCategoryId(cid);
		Map m = new HashMap();
		m.put("list", list);
		m.put("maxValueOrder", maxValueOrder);
	    return m;
	}
	
	
	@RequestMapping(value = "shop/template_getByCid")
	public ModelAndView getByCid(HttpServletRequest rqs, int cid,String view) throws BusinessException {
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		List<TCategoryTemplate> list = tm.selectByCategoryId(cid);
		JSONArray arr = JSONArray.fromObject(list);
		Integer maxValueOrder = tm.selectMaxValueOderByCategoryId(cid);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);  
	    mav.addObject("list", arr);
	    mav.addObject("maxValueOrder", maxValueOrder);
	    return mav;
	}
	
	
	
	@RequestMapping(value = "shop/template_getByCidAndType")
	public ModelAndView getByCidAndType(HttpServletRequest rqs, TCategoryTemplate tpl,String view) throws BusinessException {
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		List<TCategoryTemplate> list = tm.selectByCidAndType(tpl);
		JSONArray arr = JSONArray.fromObject(list);
		Integer maxValueOrder = tm.selectMaxValueOderByCategoryId(tpl.getCategoryId());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);  
	    mav.addObject("list", arr);
	    mav.addObject("maxValueOrder", maxValueOrder);
	    return mav;
	}
	
	
	@RequestMapping(value = "shop/template_getSelf4shop")
	public ModelAndView getSelf4shop(HttpServletRequest rqs, int categoryId,String view) throws BusinessException {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("shopId", this.getShopId(rqs));
		m.put("categoryId", categoryId);
		
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		List<TCategoryTemplate> list = tm.selectSelf4shop(m);
		JSONArray arr = JSONArray.fromObject(list);
		
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);  
	    mav.addObject("list", arr);
	    return mav;
	}
}
