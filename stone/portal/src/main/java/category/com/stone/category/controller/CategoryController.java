package com.stone.category.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryMapper;
import com.stone.category.model.CategoryTree;
import com.stone.category.model.TCategory;

@Controller
public class CategoryController extends BaseController{
	protected static final Logger log = Logger.getLogger(CategoryController.class);
	
	@RequestMapping(value = "category/list")
	public @ResponseBody List list(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectByPid(ctg.getPid());
	    return list;
	}
	@RequestMapping(value = "category/listTree")
	public @ResponseBody List<CategoryTree> listTree(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<CategoryTree> list = cm.selectSublist4Tree(ctg.getPid());
	    return list;
	}
	
	@RequestMapping(value = "category/listSibling")
	public @ResponseBody List listSibling(HttpServletRequest rqs, TCategory ctg) throws BusinessException {
		TCategoryMapper cm = this.getMybatisBaseService().getMapper(TCategoryMapper.class);
		List<TCategory> list = cm.selectSiblingById(ctg.getId());
	    return list;
	}
	
}
