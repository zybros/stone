package com.stone.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.model.Product;
import com.stone.product.model.ProductExtend;
import com.stone.product.service.IProductService;

@Controller
public class ProductController extends BaseController {

	protected static final Logger log = Logger
			.getLogger(ProductController.class);

	@InitBinder("productExtend")
	public void initBinderFormBean2(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("ext.");
	}
	

	@RequestMapping(value = "/list")
	public ModelAndView productList(HttpServletRequest rqs, Product product)
			throws BusinessException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		Map<String,Object>  m = new HashMap<String,Object> ();
		m.put("cid", product.getCid());
		m.put("brandId", product.getBrandId());
		JSONArray extArr = JSONArray.fromObject(product.getExtList());
		m.put("exts", extArr);
		
		List<Product> list = pm.selectBySelector(m);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list_item");
		mav.addObject("list", list);
		mav.addObject("product", product);
		mav.addObject("selector",m);
		log.info(product);
		return mav;
	}

	@RequestMapping(value = "/item")
	public ModelAndView findProduct(HttpServletRequest rqs, int id)
			throws BusinessException {

		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		Product t = pm.selectWithShopById(id);

		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(
				ProductExtendMapper.class);
		List<Map> extList = pxm.selectByProductId(id);
		JSONArray extArr = JSONArray.fromObject(extList);

//		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(
//				TProductSkuMapper.class);
//		List stdList = psm.callTemplateAndSkus(t.getCid(),t.getId());
//		JSONArray stdArr = JSONArray.fromObject(stdList);

		TCategoryTemplateMapper tm = this.getMybatisBaseService().getMapper(
				TCategoryTemplateMapper.class);
		Integer maxValueOrder = tm.selectMaxValueOderByCategoryId(t.getCid());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/item_info");
		mav.addObject("product", t);
		mav.addObject("extItems", extArr);
//		mav.addObject("stdItems", stdArr);
		mav.addObject("maxValueOrder", maxValueOrder);
		log.info("扩展属性： " + extArr);
//		log.info("规格属性： " + stdArr);
		return mav;
	}
	
	
}
