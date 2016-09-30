package com.stone.brand.controller;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdMapper;
import com.stone.ad.model.TAd;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.base.system.SystemConstants;
import com.stone.brand.mapper.TBrandMapper;
import com.stone.brand.model.TBrand;
import com.stone.util.FileUtil;

/**
 * 品牌访问
 * 
 * @author stone
 *
 */
@Controller
public class BrandController extends BaseController {
	
	
	@RequestMapping(value = "/brand_list4ajax")
	public @ResponseBody Object list4ajax(HttpServletRequest rqs, TBrand brand) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectList(brand);
		return list;
	}
	
	@RequestMapping(value = "/brand_list")
	public ModelAndView list(HttpServletRequest rqs, TBrand brand) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectList(brand);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("brand/list");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/brand_listByCtgId4ajax")
	public @ResponseBody Object listByCtgId4ajax(HttpServletRequest rqs, int ctgId) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectListByCtgId(ctgId);
		return list;
	}
	
	@RequestMapping(value = "/brand_listByCtgId")
	public ModelAndView listByOwner(HttpServletRequest rqs, int ctgId) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectListByCtgId(ctgId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("brand/ctg_brand_list");
		mav.addObject("list", list);
		mav.addObject("ctgId", ctgId);
		return mav;
	}
}
