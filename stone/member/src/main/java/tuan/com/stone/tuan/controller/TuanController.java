package com.stone.tuan.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.system.FilePath;
import com.stone.base.system.SystemConstants;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.service.IProductService;
import com.stone.tuan.mapper.TProductTuanMapper;
import com.stone.tuan.mapper.TTuanMapper;
import com.stone.tuan.model.TProductTuan;
import com.stone.tuan.model.TTuan;
import com.stone.tuan.service.ITuanService;
import com.stone.util.FileUtil;

@Controller
public class TuanController extends BaseController {

	protected static final Logger log = Logger.getLogger(TuanController.class);

	@Resource(name = "tuanService")
	private ITuanService tuanService;
	
	@RequestMapping(value = "/shop/tuan_add")
	public void add(HttpServletResponse rps, HttpServletRequest rqs,TTuan item, @RequestParam MultipartFile[] files) throws Exception {
		try {
			StringBuffer sb = new StringBuffer();
			for (MultipartFile f : files) {
				if (!f.isEmpty()) {
					String fileName = FileUtil.getNewFileName(f
							.getOriginalFilename());
					String filePath = FilePath.tuanImg
							+ fileName;
					log.info(filePath);
					File file = new File(filePath);
					if (!file.exists())
						file.mkdirs();
					f.transferTo(file);
					if (sb.length() == 0) {
						sb.append(fileName);
					} else {
						sb.append(";" + fileName);
					}
				}
			}
			item.setImages(sb.toString());
			item.setShopId(this.getShopId(rqs));
			tuanService.add(item);
			rps.sendRedirect("tuan_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/shop/tuan_list")
	public ModelAndView list(HttpServletResponse rps, HttpServletRequest rqs) throws Exception {
		ModelAndView mav = new ModelAndView();
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		TTuan item = new TTuan();
		item.setShopId(this.getShopId(rqs));
//		item.setStatus(TTuan.StatusC.del);
		List<TTuan> list = mapper.select(item);
		mav.setViewName("/shop/tuan_list");  
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/shop/tuan_del")
	public ModelAndView del(HttpServletResponse rps, HttpServletRequest rqs,TTuan item) throws Exception{
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		item.setStatus(TTuan.StatusC.del);
		mapper.updateByPrimaryKeySelective(item);
		rps.sendRedirect("tuan_list.do");
		return null;
	}
	
	@RequestMapping(value = "/shop/tuan_4_edit")
	public ModelAndView toEdit(HttpServletResponse rps, HttpServletRequest rqs,TTuan item) throws Exception{
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		item = mapper.selectByPrimaryKey(item.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/tuan_edit");  
		mav.addObject("tuan", item);
		return mav;
	}

	@RequestMapping(value = "/shop/tuan_edit")
	public ModelAndView edit(HttpServletResponse rps, HttpServletRequest rqs,TTuan item,@RequestParam MultipartFile[] files,
			@RequestParam List<String> imgList) throws Exception{
		
		StringBuffer sb = new StringBuffer();
		log.info(imgList);
		for (String img : imgList) {
			if ("".equals(img))
				continue;
			if (sb.length() == 0) {
				sb.append(img);
			} else {
				sb.append(";" + img);
			}
		}
		for (MultipartFile f : files) {
			if (!f.isEmpty()) {
				String fileName = FileUtil.getNewFileName(f
						.getOriginalFilename());
				String filePath = FilePath.tuanImg
						+ fileName;
				log.info(filePath);
				File file = new File(filePath);
				if (!file.exists())
					file.mkdirs();
				f.transferTo(file);
				if (sb.length() == 0) {
					sb.append(fileName);
				} else {
					sb.append(";" + fileName);
				}
			}
		}
		item.setImages(sb.toString());
		tuanService.update(item);
		rps.sendRedirect("tuan_list.do");
		return null;
	}
	
	@RequestMapping(value = "/shop/tuan_del_list")
	public ModelAndView list_del(HttpServletResponse rps, HttpServletRequest rqs) throws Exception {
		ModelAndView mav = new ModelAndView();
		TTuanMapper mapper = this.getMybatisBaseService().getMapper(TTuanMapper.class);
		TTuan item = new TTuan();
		item.setShopId(this.getShopId(rqs));
		item.setStatus(TProductTuan.StatusC.del);
		List<TTuan> list = mapper.select(item);
		mav.setViewName("/shop/tuan_del_list");  
		mav.addObject("list", list);
		return mav;
	}
}
