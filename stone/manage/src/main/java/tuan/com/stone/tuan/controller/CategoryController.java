package com.stone.tuan.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping(value = "adm/tuan_ctg_pre_add")
	public ModelAndView preAdd(HttpServletResponse rps, TTuanCategory ctg) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		List<TTuanCategory> list = mapper.selectSublist(ctg.getParentId());
		JSONArray ctgArr = JSONArray.fromObject(list);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/tuan/ctg_add");   
	    mav.addObject("ctgArr", ctgArr);
	    return mav;
	}
	
	
	@RequestMapping(value = "adm/tuan_ctg_pre_add4product")
	public ModelAndView preAdd4product(HttpServletResponse rps, TTuanCategory ctg) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		List<TTuanCategory> list = mapper.selectSublist(ctg.getParentId());
		JSONArray ctgArr = JSONArray.fromObject(list);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/tuan/content_add");   
	    mav.addObject("ctgArr", ctgArr);
	    return mav;
	}
	
	@RequestMapping(value = "adm/tuan_ctg_add")
	public String add(HttpServletRequest rqs, TTuanCategory ctg) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		ctg.setAdminId(this.getCurrentAdminId(rqs));
		mapper.insert(ctg);
		return "redirect:tuan_ctg_list.do";
	}
	
	@RequestMapping(value = "adm/tuan_ctg_list")
	public ModelAndView list(HttpServletRequest rqs,  TTuanCategory ctg) throws BusinessException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		List<TTuanCategory> list = mapper.selectList(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/tuan/ctg_list");   
	    mav.addObject("list", list);
	    return mav;
	}
	
	@RequestMapping(value = "adm/tuan_ctg_find_edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id) throws BusinessException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		TTuanCategory ctg = mapper.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/tuan/ctg_edit");   
	    mav.addObject("ctg", ctg);
	    return mav;
	}
	@RequestMapping(value = "adm/tuan_ctg_update")
	public String update(HttpServletResponse rps, TTuanCategory ctg) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		int a=mapper.updateByPrimaryKey(ctg);
		System.out.println(a);
		
		
		return "redirect:tuan_ctg_list.do";
	}
	
	@RequestMapping(value = "adm/tuan_ctg_del")
	public String delete(HttpServletResponse rps, int id) throws BusinessException, IOException {
		TTuanCategoryMapper mapper = this.getMybatisBaseService().getMapper(TTuanCategoryMapper.class);
		mapper.deleteByPrimaryKey(id);
		return "redirect:tuan_ctg_list.do";
	}
	
}
