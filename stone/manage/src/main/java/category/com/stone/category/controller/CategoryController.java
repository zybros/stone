package com.stone.category.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryMapper;
import com.stone.category.model.CategoryTree;
import com.stone.category.model.TCategory;

@Controller
public class CategoryController extends BaseController{
	protected static final Logger log = Logger.getLogger(CategoryController.class);
	@RequestMapping(value = "adm/category/add")
	public String add(HttpServletResponse rps, TCategory ctg) throws BusinessException, IOException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		cm.insert(ctg);
		if(ctg.getPid()==0)
			rps.sendRedirect("list.do?pid=0");
		else
			rps.sendRedirect("sublist.do?pid="+ctg.getPid());
		return null;
	}
	
	@RequestMapping(value = "adm/category/list")
	public ModelAndView list4adm(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/category/categoryList");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/listWithView")
	public ModelAndView listWithView(HttpServletRequest rqs, TCategory ctg,String view) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/list4template")
	public ModelAndView list4template(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/category/ctgList4tmpl");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/list4product")
	public ModelAndView list4product(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/product/ctgList4product");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/list4myProduct")
	public ModelAndView list4myProduct(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/product/ctgList4myProduct");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/sublistWithView")
	public ModelAndView sublistWithView(HttpServletRequest rqs, TCategory ctg,String view) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSublist(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	
	@RequestMapping(value = "adm/category/sublist")
	public ModelAndView sublist(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSublist(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/category/categoryList");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/sublist4template")
	public ModelAndView sublist4template(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSublist(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/category/ctgList4tmpl");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/sublist4product")
	public ModelAndView sublist4product(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSublist(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/product/ctgList4product");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	@RequestMapping(value = "adm/category/sublist4myProduct")
	public ModelAndView sublist4myProduct(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSublist(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/product/ctgList4myProduct");   
	    mav.addObject("list", list);
	    mav.addObject("pCategory", ctg);
	    return mav;
	}
	
	@RequestMapping(value = "adm/category/get4Edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		TCategory ctg = cm.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/category/categoryEdit");   
	    mav.addObject("category", ctg);
	    return mav;
	}
	@RequestMapping(value = "adm/category/update")
	public String update(HttpServletResponse rps, TCategory ctg) throws BusinessException, IOException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		cm.updateByPrimaryKey(ctg);
		if(ctg.getPid()==0)
			rps.sendRedirect("list.do?pid=0");
		else
			rps.sendRedirect("sublist.do?pid="+ctg.getPid());
		return null;
	}
	
	@RequestMapping(value = "adm/category/del")
	public String delete(HttpServletResponse rps, TCategory ctg) throws BusinessException, IOException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		cm.deleteByPrimaryKey(ctg.getId());
		if(ctg.getPid()==0)
			rps.sendRedirect("list.do?pid=0");
		else
			rps.sendRedirect("sublist.do?pid="+ctg.getPid());
		return null;
	}
	
}
