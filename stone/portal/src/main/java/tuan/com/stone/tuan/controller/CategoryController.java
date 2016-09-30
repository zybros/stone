package com.stone.tuan.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.tuan.mapper.TTuanCategoryMapper;
import com.stone.tuan.model.TTuanCategory;

import net.sf.json.JSONArray;

@Controller("tuanCategoryController")
public class CategoryController extends BaseController{
	
	
	@RequestMapping(value = "shop/tuan_ctg_list4tuan_add")
	public ModelAndView preAdd4product(HttpServletResponse rps) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		List<TTuanCategory> list = mapper.selectSublist(0);
		JSONArray ctgArr = JSONArray.fromObject(list);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/shop/tuan_add");   
	    mav.addObject("ctgArr", ctgArr);
	    return mav;
	}
	
}
