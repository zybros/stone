package com.stone.cms.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cms.mapper.TCmsCategoryMapper;
import com.stone.cms.model.TCmsCategory;

import net.sf.json.JSONArray;

@Controller("cmsCategoryController")
public class CategoryController extends BaseController{
	
	@RequestMapping(value = "adm/cms_ctg_pre_add")
	public ModelAndView preAdd(HttpServletResponse rps, TCmsCategory ctg) throws BusinessException, IOException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectSublist(ctg.getParentId());
		JSONArray ctgArr = JSONArray.fromObject(list);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/ctg_add");   
	    mav.addObject("ctgArr", ctgArr);
	    return mav;
	}
	
	@RequestMapping(value = "cms_ctg_tree_ajax")
	public @ResponseBody Object tree4ajax(HttpServletResponse rps, TCmsCategory ctg){
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectSublist(ctg.getParentId());
		JSONArray tree = JSONArray.fromObject(list);
		
		return  tree;
	}
	
	@RequestMapping(value = "cms_ctg_tree")
	public ModelAndView tree(HttpServletResponse rps, TCmsCategory ctg){
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectSublist(ctg.getParentId());
		String tree = "[{name:\"根节点\", children:["+toJsonTree(list)+"]}]";
		log.info(tree);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/tree");  
	    mav.addObject("tree", tree);
	    return mav;
	}
	
	
	private String toJsonTree(List<TCmsCategory>  list){
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<list.size();i++){
			TCmsCategory ctg = list.get(i);
			sb.append("{name:\"").append(ctg.getName()).append("\"");
			if(ctg.getSublist().size()>0){
				sb.append(", children:[");
				sb.append(toJsonTree(ctg.getSublist()));
				sb.append("]}");
			}else{
				sb.append("}");
			}
			if(i<list.size()-1){
				sb.append(", ");
			}
		}
		
		return sb.toString();
	}
	
	
	
	@RequestMapping(value = "adm/cms_ctg_pre_add4content")
	public ModelAndView preAdd4content(HttpServletResponse rps, TCmsCategory ctg) throws BusinessException, IOException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectSublist(ctg.getParentId());
		JSONArray ctgArr = JSONArray.fromObject(list);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/content_add");   
	    mav.addObject("ctgArr", ctgArr);
	    return mav;
	}
	
	@RequestMapping(value = "adm/cms_ctg_add")
	public String add(HttpServletRequest rqs, TCmsCategory ctg) throws BusinessException, IOException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		ctg.setAdminId(this.getCurrentAdminId(rqs));
		ccm.insert(ctg);
		return "redirect:cms_ctg_list.do";
	}
	
	@RequestMapping(value = "adm/cms_ctg_list")
	public ModelAndView list(HttpServletRequest rqs,  TCmsCategory ctg) throws BusinessException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		List<TCmsCategory> list = ccm.selectList(ctg);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/ctg_list");   
	    mav.addObject("list", list);
	    return mav;
	}
	
	@RequestMapping(value = "adm/cms_ctg_find_edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id) throws BusinessException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		TCmsCategory ctg = ccm.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/cms/ctg_edit");   
	    mav.addObject("ctg", ctg);
	    return mav;
	}
	@RequestMapping(value = "adm/cms_ctg_update")
	public String update(HttpServletResponse rps, TCmsCategory ctg) throws BusinessException, IOException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		int a=ccm.updateByPrimaryKey(ctg);
		System.out.println(a);
		
		
		return "redirect:cms_ctg_list.do";
	}
	
	@RequestMapping(value = "adm/cms_ctg_del")
	public String delete(HttpServletResponse rps, int id) throws BusinessException, IOException {
		TCmsCategoryMapper ccm = this.getMybatisBaseService().getMapper(TCmsCategoryMapper.class);
		ccm.deleteByPrimaryKey(id);
		return "redirect:cms_ctg_list.do";
	}
	
}
