package com.stone.search.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.model.Product;

@Controller
public class SearchController extends BaseController{
	
	
	@RequestMapping(value = "/search")
	public ModelAndView search(HttpServletRequest rqs, String keywords)
			throws BusinessException {
		keywords = keywords.toLowerCase().trim().replaceAll("\\s+", "|");
		ProductMapper pm = this.getMybatisBaseService().getMapper(ProductMapper.class);
		List<Product> list = pm.search(keywords);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search_item");
		mav.addObject("list", list);
		return mav;
	}

	
	

}
