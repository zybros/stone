package com.stone.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.model.Product;
import com.stone.product.model.ProductExtend;

import net.sf.json.JSONArray;

@Controller
public class ProductExtController extends BaseController {

	protected static final Logger log = Logger
			.getLogger(ProductExtController.class);

	
	
	@RequestMapping(value = "sho/productExt_add")
	public ModelAndView addExt(HttpServletResponse rps, HttpServletRequest rqs,Product product)
			throws Exception{
		
		List<ProductExtend> extList = toProductExtends(product.getId(), rqs);
		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(ProductExtendMapper.class);
		if (extList.size() > 0) {
			pxm.insertList(extList);
		} else {
			log.warn("*****  商品没有任何扩展属性       ******");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productSkuAdd");
		mav.addObject("product", product);
		log.info(product);
		return mav;
	}
	

	@SuppressWarnings("unchecked")
	private List<ProductExtend> toProductExtends(int productId, HttpServletRequest rqs) {
		List<ProductExtend> list = new ArrayList<ProductExtend>();
		Map<String, String[]> m = rqs.getParameterMap();
		for (Entry<String, String[]> entry : m.entrySet()) {
			String k = entry.getKey();
			if (k.startsWith("ext")) {
				String str = Arrays.toString(entry.getValue());
				str = str.substring(1, str.length() - 1);
				ProductExtend ext = new ProductExtend();
				ext.setProductId(productId);
				ext.setTemplateId(Integer.parseInt(k.substring(3)));
				StringBuffer sb = new StringBuffer();
				String[] arr = str.split(",");
				for (int i = 0; i < arr.length; i++) {
					sb.append(arr[i].trim()).append(",");
				}
				str = sb.toString();
				ext.setValue(str.substring(0, str.length() - 1));
				list.add(ext);
				log.info(ext.getValue());
			}

		}
		return list;
	}
	
	
	@RequestMapping(value = "sho/productExt_get4edit")
	public ModelAndView get4edit(HttpServletResponse rps, HttpServletRequest rqs,int id)
			throws Exception, IOException {

		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(
				ProductExtendMapper.class);
		List<Map> extList = pxm.selectByProductId(id);
		JSONArray extArr = JSONArray.fromObject(extList);
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/productExt_edit");
		mav.addObject("extItems", extArr);
		mav.addObject("productId", id);
		log.info("扩展属性： " + extArr);
		return mav;
	}
	
	
	@RequestMapping(value = "sho/productExt_update")
	public ModelAndView update(HttpServletResponse rps, HttpServletRequest rqs,int productId)
			throws Exception{
		
		ProductExtendMapper pxm = this.getMybatisBaseService().getMapper(
				ProductExtendMapper.class);
		pxm.updateList(toProductExtends(productId, rqs));
		
		rps.sendRedirect("product_list.do");
		return null;
	}
}
