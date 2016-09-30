package com.stone.ad.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdLocationMapper;
import com.stone.ad.model.TAdLocation;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cms.mapper.TCmsCategoryMapper;
import com.stone.cms.model.TCmsCategory;

/**
 * 广告位置管理
 * @author stone
 *
 */
@Controller
public class AdLocationController extends BaseController{
	
	
	
	@RequestMapping(value = "/admin/ad_loca_add")
	public String register(HttpServletRequest rqs,HttpServletResponse rps, TAdLocation al) throws Exception {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		alm.insert(al);
		rps.sendRedirect("ad_loca_list.do?parentId="+al.getParentId());
		return null;
	}


	@RequestMapping(value = "/admin/ad_loca_del")
	public String logout(HttpServletResponse rps, TAdLocation al) throws Exception {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		alm.deleteByPrimaryKey(al.getLocationId());
		rps.sendRedirect("ad_loca_list.do?parentId="+al.getParentId());
		return null;
	}

	@RequestMapping(value = "/admin/ad_loca_update")
	public String updateUser(HttpServletRequest rqs, HttpServletResponse rps, TAdLocation al) throws Exception {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		alm.updateByPrimaryKey(al);
		rps.sendRedirect("ad_loca_list.do?parentId="+al.getParentId());
		return null;
	}

	@RequestMapping(value = "/admin/ad_loca_get")
	public ModelAndView get(HttpServletRequest rqs, TAdLocation al) throws Exception {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		al = alm.selectByPrimaryKey(al.getLocationId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_location");
		mav.addObject("al", al);
		return mav;
	}
	
	@RequestMapping(value = "/admin/ad_loca_get4edit")
	public ModelAndView get4edit(HttpServletRequest rqs, TAdLocation al) throws Exception {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		
		al = alm.selectByPrimaryKey(al.getLocationId());
		List<TAdLocation> list = alm.selectSublist(0);
		String tree = "[{id:\"0\", name:\"根节点\", children:["+toJsonTree(list,al.getParentId())+"]}]";
		log.info(tree);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_location_edit");
		mav.addObject("tree", tree);
		mav.addObject("al", al);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_loca_list")
	public ModelAndView list(HttpServletRequest rqs,int parentId) throws BusinessException {
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		List<TAdLocation> listT = alm.selectSublist(0);
		String tree = "[{id:\"0\", name:\"根节点\", children:["+toJsonTree(listT,parentId)+"]}]";
		log.info(tree);
		
		List<TAdLocation> list = alm.selectSublist(parentId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_location_list");
		mav.addObject("tree", tree);
		mav.addObject("list", list);
		mav.addObject("parentId", parentId);
		return mav;
	}
	
	

	@RequestMapping(value = "ad_loca_tree_4_add")
	public ModelAndView tree(HttpServletResponse rps, TAdLocation loca,String page){
		TAdLocationMapper alm = this.getMybatisBaseService().getMapper(TAdLocationMapper.class);
		List<TAdLocation> list = alm.selectSublist(0);
		String tree = "[{id:\"0\", name:\"根节点\", children:["+toJsonTree(list,0)+"]}]";
		log.info(tree);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(page);  
	    mav.addObject("tree", tree);
	    mav.addObject("parentId", loca.getParentId());
	    return mav;
	} 
	
	
	private String toJsonTree(List<TAdLocation>  list, int checkedId){
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<list.size();i++){
			TAdLocation loca = list.get(i);
			sb.append("{id:\""+loca.getLocationId()+"\", name:\"").append(loca.getLocationName()).append("\"");
			if(loca.getLocationId()==checkedId){
				sb.append(",  open:\"true\", checked:\"true\"");
			}
			if(loca.getSublist().size()>0){
				sb.append(", children:[");
				sb.append(toJsonTree(loca.getSublist(),checkedId));
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
	
}
