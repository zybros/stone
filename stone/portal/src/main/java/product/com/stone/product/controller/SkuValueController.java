package com.stone.product.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryTemplateMapper;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.mapper.TSkuValueMapper;
import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;
import com.stone.product.model.TSkuValue;

import net.sf.json.JSONArray;

@Controller
public class SkuValueController extends BaseController {

	protected static final Logger log = Logger
			.getLogger(SkuValueController.class);


	@RequestMapping(value = "item_skuVals")
	public ModelAndView getSkuValsByProductId(HttpServletRequest rqs, int productId)
			throws BusinessException {

		TSkuValueMapper svm = this.getMybatisBaseService().getMapper(TSkuValueMapper.class);
		List<TSkuValue> vals = svm.selectSkuValsGroupByTemplateId(productId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/item_skus");
		mav.addObject("skuVals", vals);
		return mav;
	}
	


}
