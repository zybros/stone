package com.stone.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.base.system.FilePath;
import com.stone.base.system.SystemConstants;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.mapper.TProductStandardMapper;
import com.stone.product.model.Product;
import com.stone.product.model.ProductExtend;
import com.stone.product.model.TProductStandard;
import com.stone.product.service.IProductService;
import com.stone.util.FileUtil;

@Controller
public class ProductController extends BaseController {

	protected static final Logger log = Logger
			.getLogger(ProductController.class);

	@Resource(name = "productService")
	private IProductService productService;

	@InitBinder("productExtend")
	public void initBinderFormBean2(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("ext.");
	}

	@RequestMapping(value = "sho/product/add")
	public ModelAndView add(HttpServletResponse rps, HttpServletRequest rqs,
			Product product, @RequestParam MultipartFile[] files)
			throws Exception, IOException {
		try {
			StringBuffer sb = new StringBuffer();
			for (MultipartFile f : files) {
				if (!f.isEmpty()) {
					String fileName = FileUtil.getNewFileName(f
							.getOriginalFilename());
					String filePath = FilePath.itemImg
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
			product.setImgs(sb.toString());
			product.setShopId(this.getShopId(rqs));
			
			productService.addAndIndex(product);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/shop/productExtAdd");
			mav.addObject("product", product);
			log.info(product);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	

	@RequestMapping(value = "sho/product_list")
	public ModelAndView list(HttpServletRequest rqs, Product product)
			throws BusinessException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		List<Product> list = pm.selectByShopID(this.getShopId(rqs));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productList");
		mav.addObject("list", list);
		mav.addObject("product", product);
		log.info(product);
		return mav;
	}

	@RequestMapping(value = "/sho/product_list_ajax")
	public @ResponseBody List<Product> list_ajax(HttpServletResponse rps,
			HttpServletRequest rqs) throws Exception {
		ProductMapper mapper = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		List<Product> list = mapper.selectByShopID(this.getShopId(rqs));
		return list;
	}

	@RequestMapping(value = "sho/product/get4Edit")
	public ModelAndView get4Edit4shop(HttpServletRequest rqs, int id)
			throws BusinessException {

		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		Product t = pm.selectByPrimaryKey(id);

		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(
				ProductExtendMapper.class);
		List<Map> extList = pxm.selectByProductId(id);
		JSONArray extArr = JSONArray.fromObject(extList);

		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(
				TProductSkuMapper.class);
		List stdList = psm.callTemplateAndSkus(t.getCid(),t.getId());
		JSONArray stdArr = JSONArray.fromObject(stdList);

		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(
				TCategoryTemplateMapper.class);
		Integer maxValueOrder = tm.selectMaxValueOderByCategoryId(t.getCid());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productEdit");
		mav.addObject("product", t);
		mav.addObject("extItems", extArr);
		mav.addObject("stdItems", stdArr);
		mav.addObject("maxValueOrder", maxValueOrder);
		log.info("扩展属性： " + extArr);
		log.info("规格属性： " + stdArr);
		return mav;
	}
	
	@RequestMapping(value = "sho/product_get4edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id)
			throws BusinessException {

		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		Product t = pm.selectByPrimaryKey(id);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/product_edit");
		mav.addObject("product", t);
		return mav;
	}

	@RequestMapping(value = "sho/product/update")
	public String update4shop(HttpServletRequest rqs, HttpServletResponse rps,
			Product product, ArrayList<TProductStandard> standards,
			@RequestParam MultipartFile[] files,
			@RequestParam List<String> imgList) throws Exception {
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
				String filePath = FilePath.itemImg
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
		product.setImgs(sb.toString());
		this.productService.updateProduct(product, rqs);
		rps.sendRedirect("product_list.do");
		return null;
	}
	
	
	@RequestMapping(value = "sho/product_update")
	public String update(HttpServletRequest rqs, HttpServletResponse rps,
			Product product,@RequestParam MultipartFile[] files,@RequestParam List<String> imgList) throws Exception {
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
				String filePath = FilePath.itemImg
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
		product.setImgs(sb.toString());
		
		ProductMapper pm = this.getMybatisBaseService().getMapper(ProductMapper.class);
		pm.updateByPrimaryKeySelective(product);
		
		rps.sendRedirect("product_list.do");
		return null;
	}
	

	@RequestMapping(value = "sho/product_del")
	public String delete4shop(HttpServletResponse rps, Product product)
			throws BusinessException, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		pm.deleteByPrimaryKey(product.getId());
		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(
				ProductExtendMapper.class);
		pxm.deleteByProductId(product.getId());
		rps.sendRedirect("product_list.do");
		return null;
	}

}
