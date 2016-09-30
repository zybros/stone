package com.stone.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.stone.base.system.SystemConstants;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
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

	@RequestMapping(value = "adm/product/add")
	public String add(HttpServletRequest rqs, HttpServletResponse rps,
			Product product) throws Exception, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		productService.addAndIndex(product);
		rps.sendRedirect("list.do?cid=" + product.getCid());
		return null;
	}


	@RequestMapping(value = "adm/product/list4my")
	public ModelAndView list4my(HttpServletRequest rqs, Product product)
			throws BusinessException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		List<Product> list = pm.selectByCategoryID(product.getCid());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/my_products");
		mav.addObject("list", list);
		mav.addObject("product", product);
		log.info(product);
		return mav;
	}
	
	@RequestMapping(value = "adm/product/list")
	public ModelAndView list(HttpServletRequest rqs, Product product)
			throws BusinessException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		List<Product> list = pm.selectByCategoryID(product.getCid());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/products");
		mav.addObject("list", list);
		mav.addObject("product", product);
		log.info(product);
		return mav;
	}

	@RequestMapping(value = "adm/product/get4Edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int id)
			throws BusinessException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		Product t = pm.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/productEdit");
		mav.addObject("product", t);
		return mav;
	}

	@RequestMapping(value = "adm/product/update")
	public String update(HttpServletResponse rps, Product product)
			throws BusinessException, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		pm.updateByPrimaryKey(product);
		rps.sendRedirect("list.do?cid=" + product.getCid());
		return null;
	}
	/**
	 * 将之前的强制下架恢复
	 * @param rps
	 * @param product
	 * @return
	 * @throws BusinessException
	 * @throws IOException
	 */
	@RequestMapping(value = "adm/product/product_recover")
	public String recover(HttpServletResponse rps, Product product)
			throws BusinessException, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		return null;
	}
	
	/**
	 * 强制下架
	 * @param rps
	 * @param product
	 * @return
	 * @throws BusinessException
	 * @throws IOException
	 */
	@RequestMapping(value = "adm/product/product_forceOffSale")
	public String forceOffSale(HttpServletResponse rps, Product product)
			throws BusinessException, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		return null;
	}

	@RequestMapping(value = "adm/product/del")
	public String delete(HttpServletResponse rps, Product product)
			throws BusinessException, IOException {
		ProductMapper pm = this.getMybatisBaseService().getMapper(
				ProductMapper.class);
		pm.deleteByPrimaryKey(product.getId());
		rps.sendRedirect("list.do?cid=" + product.getCid());
		return null;
	}
}
