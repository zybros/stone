package com.stone.product.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;
import com.stone.product.service.IProductService;

import net.sf.json.JSONArray;

@Controller
public class ProductSkuController extends BaseController {

	protected static final Logger log = Logger
			.getLogger(ProductSkuController.class);

	@Resource(name = "productService")
	private IProductService productService;

	
	@RequestMapping(value = "sho/productSku_add")
	public String addSku(HttpServletResponse rps, TProductSku sku)
		throws Exception, IOException {
		this.productService.addProductSku(sku);
		rps.sendRedirect("productSku_list.do?productId="+sku.getProductId()+"&categoryId="+sku.getCategoryId());
		return null;
	}
	
	
	@RequestMapping(value = "sho/productSku_get4edit")
	public ModelAndView get4edit(HttpServletResponse rps, HttpServletRequest rqs, TProductSku sku)
			throws Exception, IOException {

		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
		List list = psm.callTemplateAndSku(sku.getCategoryId(),sku.getId());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productSku_edit");
		mav.addObject("list", list);
		return mav;
	}
	
	
	@RequestMapping(value = "sho/productSku_update")
	public ModelAndView update(HttpServletResponse rps, HttpServletRequest rqs,TProductSku sku)
			throws Exception{
		
		this.productService.updateProductSku(sku);
		rps.sendRedirect("productSku_list.do?productId="+sku.getProductId()+"&categoryId="+sku.getCategoryId());
		return null;
	}
	
	
	@RequestMapping(value = "sho/productSku_del")
	public ModelAndView del(HttpServletResponse rps, HttpServletRequest rqs,TProductSku sku)
			throws Exception{
		
		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
		psm.deleteByPrimaryKey(sku.getId());
		rps.sendRedirect("productSku_list.do?productId="+sku.getProductId()+"&categoryId="+sku.getCategoryId());
		return null;
	}
	
	
	@RequestMapping(value = "sho/productSku_list")
	public ModelAndView list(HttpServletResponse rps, HttpServletRequest rqs, TProductSku sku)
			throws Exception, IOException {

		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
		List<TProductSku> list = psm.selectSkusByProductId(sku.getProductId());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productSku_list");
		mav.addObject("list", list);
		mav.addObject("sku", sku);
		return mav;
	}
	
}
