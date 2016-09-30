package com.stone.ad.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdOwnerMapper;
import com.stone.ad.model.TAdOwner;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;

/**
 * 广告投放者管理
 * @author stone
 *
 */
@Controller
public class AdOwnerController extends BaseController{
	
	
	
	@RequestMapping(value = "/admin/ad_owner_add")
	public String register(HttpServletRequest rqs,HttpServletResponse rps, TAdOwner ao) throws Exception {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		alm.insert(ao);
		rps.sendRedirect("ad_owner_list.do");
		return null;
	}


	@RequestMapping(value = "/admin/ad_owner_del")
	public String logout(HttpServletResponse rps, TAdOwner ao) throws Exception {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		alm.deleteByPrimaryKey(ao.getId());
		rps.sendRedirect("ad_owner_list.do");
		return null;
	}

	@RequestMapping(value = "/admin/ad_owner_update")
	public String updateUser(HttpServletRequest rqs, HttpServletResponse rps, TAdOwner ao) throws Exception {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		alm.updateByPrimaryKey(ao);
		rps.sendRedirect("ad_owner_list.do");
		return null;
	}

	@RequestMapping(value = "/admin/ad_owner_get4edit")
	public ModelAndView find(HttpServletRequest rqs, TAdOwner ao) throws Exception {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		ao = alm.selectByPrimaryKey(ao.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_owner_edit");
		mav.addObject("ao", ao);
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/ad_owner_get")
	public ModelAndView get(HttpServletRequest rqs, TAdOwner ao) throws Exception {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		ao = alm.selectByPrimaryKey(ao.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_owner");
		mav.addObject("ao", ao);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_owner_list")
	public String list(HttpServletRequest rqs, ModelMap model) throws BusinessException {
		TAdOwnerMapper alm = this.getMybatisBaseService().getMapper(TAdOwnerMapper.class);
		List<TAdOwner> list = alm.selectAll();
		model.addAttribute("list", list);
		return "/admin/ad/ad_owner_list";
	}
	
}
