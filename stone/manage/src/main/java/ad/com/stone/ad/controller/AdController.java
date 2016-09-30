package com.stone.ad.controller;

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
import com.stone.util.FileUtil;

/**
 * 广告管理
 * 
 * @author stone
 *
 */
@Controller
public class AdController extends BaseController {

	@RequestMapping(value = "/admin/ad_add")
	public String register(HttpServletRequest rqs, HttpServletResponse rps, TAd ad, @RequestParam MultipartFile img)
			throws Exception {
		try {
			if (!img.isEmpty()) {
				String fileName = FileUtil.getNewFileName(img.getOriginalFilename());
				String filePath = FilePath.adImg + fileName;
				log.info(filePath);
				File file = new File(filePath);
				if (!file.exists())
					file.mkdirs();
				img.transferTo(file);
				ad.setAdImg(fileName);
			}
			TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
			am.insert(ad);
			rps.sendRedirect("ad_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/ad_del")
	public String logout(HttpServletResponse rps, TAd ad) throws Exception {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		am.deleteByPrimaryKey(ad.getAdId());
		rps.sendRedirect("ad_list.do");
		return null;
	}

	@RequestMapping(value = "/admin/ad_update")
	public String updateUser(HttpServletRequest rqs, HttpServletResponse rps, TAd ad, @RequestParam MultipartFile img)
			throws Exception {
		try {
			if (!img.isEmpty()) {
				String fileName = FileUtil.getNewFileName(img.getOriginalFilename());
				String filePath = FilePath.adImg + fileName;
				log.info(filePath);
				File file = new File(filePath);
				if (!file.exists())
					file.mkdirs();
				img.transferTo(file);
				ad.setAdImg(fileName);
			}

			TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
			am.updateByPrimaryKey(ad);
			rps.sendRedirect("ad_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/admin/ad_get4edit")
	public ModelAndView get4edit(HttpServletRequest rqs, TAd ad) throws Exception {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		ad = am.selectByPrimaryKey(ad.getAdId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_edit");
		mav.addObject("a", ad);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_get")
	public ModelAndView get(HttpServletRequest rqs, TAd ad) throws Exception {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		ad = am.selectByPrimaryKey(ad.getAdId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad");
		mav.addObject("a", ad);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_list")
	public ModelAndView list(HttpServletRequest rqs, TAd ad) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> list = am.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_list");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_list4link")
	public ModelAndView list4link(HttpServletRequest rqs, TAd ad, int locationId) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> list = am.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/location_ad_list4link");
		mav.addObject("list", list);
		mav.addObject("locationId", locationId);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_listByOwner")
	public ModelAndView listByOwner(HttpServletRequest rqs, TAd ad) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> list = am.selectListByOwnerId(ad.getOwnerId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/ad_list");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/admin/ad_listByLocation")
	public ModelAndView listByOwner(HttpServletRequest rqs, int locationId) throws BusinessException {
		TAdMapper am = this.getMybatisBaseService().getMapper(TAdMapper.class);
		List<TAd> list = am.selectListByLocationId(locationId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/ad/location_ad_list");
		mav.addObject("list", list);
		mav.addObject("locationId", locationId);
		return mav;
	}

}
