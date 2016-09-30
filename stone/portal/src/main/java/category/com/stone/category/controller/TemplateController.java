package com.stone.category.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.category.model.TCategoryTemplate;
import com.stone.category.service.ICategoryTemplateService;

@Controller
public class TemplateController extends BaseController{
	protected static final Logger log = Logger.getLogger(TemplateController.class);
	
	@Resource(name = "categoryTemplateService")  
	private ICategoryTemplateService categoryTemplateService ; 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "template/getByCid")
	public @ResponseBody Map getByCid(HttpServletRequest rqs, int cid) throws BusinessException {
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		List<TCategoryTemplate> list = tm.selectByCategoryId(cid);
		int maxValueOrder = tm.selectMaxValueOderByCategoryId(cid);
		Map m = new HashMap();
		m.put("list", list);
		m.put("maxValueOrder", maxValueOrder);
	    return m;
	}
	
	@RequestMapping(value = "template_getCanSearchByCid4ajax")
	public @ResponseBody Object getCanSearchByCid4ajax(HttpServletRequest rqs, int cid) throws BusinessException {
		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(TCategoryTemplateMapper.class);
		TCategoryTemplate t = new TCategoryTemplate();
		t.setCategoryId(cid);
		t.setType(2);
		List<TCategoryTemplate> list = tm.selectByCidAndType(t);
	    return list;
	}
	
	
}
