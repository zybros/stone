package com.stone.brand.controller;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.ad.mapper.TAdMapper;
import com.stone.ad.model.TAd;
import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.base.system.FilePath;
import com.stone.base.system.SystemConstants;
import com.stone.brand.mapper.TBrandMapper;
import com.stone.brand.model.TBrand;
import com.stone.util.FileUtil;

/**
 * 品牌管理
 * 
 * @author stone
 *
 */
@Controller
public class BrandController extends BaseController {

	@RequestMapping(value = "/admin/brand_add")
	public String register(HttpServletRequest rqs, HttpServletResponse rps, TBrand brand, @RequestParam MultipartFile imgObj)
		throws Exception {
		try {
			if (!imgObj.isEmpty()) {
				String fileName = FileUtil.getNewFileName(imgObj.getOriginalFilename());
				String filePath = FilePath.baseImg + fileName;
				log.info(filePath);
				File file = new File(filePath);
				if (!file.exists())
					file.mkdirs();
				imgObj.transferTo(file);
				brand.setImg(fileName);
			}
			TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
			bm.insert(brand);
			rps.sendRedirect("brand_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	@RequestMapping(value = "/admin/brand_del")
	public String logout(HttpServletResponse rps, TBrand brand) throws Exception {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		bm.deleteByPrimaryKey(brand.getId());
		rps.sendRedirect("brand_list.do");
		return null;
	}

	@RequestMapping(value = "/admin/brand_update")
	public String updateUser(HttpServletRequest rqs, HttpServletResponse rps, TBrand brand, @RequestParam MultipartFile imgObj)
			throws Exception {
		try {
			if (!imgObj.isEmpty()) {
				String fileName = FileUtil.getNewFileName(imgObj.getOriginalFilename());
				String filePath = FilePath.baseImg + fileName;
				log.info(filePath);
				File file = new File(filePath);
				if (!file.exists())
					file.mkdirs();
				imgObj.transferTo(file);
				brand.setImg(fileName);
			}

			TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
			bm.updateByPrimaryKey(brand);
			rps.sendRedirect("brand_list.do");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/brand_get4edit")
	public ModelAndView get4edit(HttpServletRequest rqs, TBrand brand) throws Exception {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		brand = bm.selectByPrimaryKey(brand.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/brand/edit");
		mav.addObject("brand", brand);
		return mav;
	}

	@RequestMapping(value = "/admin/brand_list")
	public ModelAndView list(HttpServletRequest rqs, TBrand brand) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectList(brand);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/brand/list");
		mav.addObject("list", list);
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/brand_listByCtgId")
	public ModelAndView listByOwner(HttpServletRequest rqs, int ctgId) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectListByCtgId(ctgId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/brand/ctg_brand_list");
		mav.addObject("list", list);
		mav.addObject("ctgId", ctgId);
		return mav;
	}

	
	@RequestMapping(value = "/admin/brand_list4link")
	public ModelAndView list4link(HttpServletRequest rqs,int ctgId) throws BusinessException {
		TBrandMapper bm = this.getMybatisBaseService().getMapper(TBrandMapper.class);
		List<TBrand> list = bm.selectList(null);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/brand/ctg_brand_list4link");
		mav.addObject("list", list);
		mav.addObject("ctgId", ctgId);
		return mav;
	}

}
