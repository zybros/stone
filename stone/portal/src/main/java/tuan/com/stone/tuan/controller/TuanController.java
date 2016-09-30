package com.stone.tuan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.tuan.mapper.TTuanCategoryMapper;
import com.stone.tuan.mapper.TTuanMapper;
import com.stone.tuan.model.TTuan;
import com.stone.tuan.model.TTuanCategory;

@Controller
public class TuanController extends BaseController {

	protected static final Logger log = Logger.getLogger(TuanController.class);

	
	@RequestMapping(value = "tuan_all")
	public ModelAndView all(HttpServletResponse rps, HttpServletRequest rqs) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		TTuanCategoryMapper cmapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		List<TTuanCategory> ctgs = cmapper.selectSublist(0);
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		List<TTuan> items = mapper.select(null);
		
		mav.setViewName("tuan_all");  
		mav.addObject("ctgs", ctgs);
		mav.addObject("items", items);
		return mav;
	}
	
	@RequestMapping(value = "tuan_list")
	public ModelAndView list(HttpServletResponse rps, HttpServletRequest rqs,TTuan item) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		List<TTuan> items = mapper.select(item);
		
		mav.setViewName("tuan_list");  
		mav.addObject("items", items);
		return mav;
	}
	
	@RequestMapping(value = "/tuan_item")
	public ModelAndView toEdit(HttpServletResponse rps, HttpServletRequest rqs,TTuan item) throws Exception{
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		item = mapper.selectByPrimaryKey(item.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/tuan_item");  
		mav.addObject("item", item);
		return mav;
	}

}
