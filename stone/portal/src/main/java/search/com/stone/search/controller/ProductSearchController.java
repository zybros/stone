package com.stone.search.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.exception.BusinessException;
import com.stone.search.api.product.IProductSearch;
import com.stone.search.base.model.product.ProductDoc;

import org.codehaus.jackson.map.ObjectMapper;

@Controller
public class ProductSearchController {
	
	@Resource(name="productSearch")
	private IProductSearch productSearch ;
		
	
	 @RequestMapping(value = "/searchByTitle")
	 public void searchByTitle( HttpServletResponse rsp,@RequestParam(value = "title") String title) 
	 {
		 try {
			List<ProductDoc> list = productSearch.findByTitle(title);
			rsp.getWriter().print( (new ObjectMapper()).writeValueAsString(list));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
				 
	 }
	 
	 @RequestMapping(value = "/search_all")
		public ModelAndView searchAll(HttpServletRequest rqs,String keywords)
				throws Exception {
		 	List<ProductDoc> list = productSearch.findByTitle(keywords);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("search_item");
			mav.addObject("list", list);
			return mav;
		}
	 
	 	@RequestMapping(value = "/searchShop")
		public ModelAndView searchShop(HttpServletRequest rqs, String keywords)
				throws BusinessException {
			return null;
		}


}
