package com.stone.category.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.category.mapper.TCategoryTemplateShopMapper;
import com.stone.category.model.TCategoryTemplateShop;


@Controller
public class TemplateShopController extends BaseController{
	protected static final Logger log = Logger.getLogger(TemplateShopController.class);
	
	
	
	@RequestMapping(value = "shop/templateShop_add4ajax")
	public @ResponseBody int add4ajax(HttpServletRequest rqs, TCategoryTemplateShop cts) throws BusinessException {
		TCategoryTemplateShopMapper ctsm = this.getMybatisBaseService().getMapper(TCategoryTemplateShopMapper.class);
		cts.setShopId(this.getShopId(rqs));
		if(cts.getOptions().indexOf(TCategoryTemplateShop.optionSeparator)==-1){
			ctsm.insert(cts);
		}else{
			ctsm.updateOptionsByShopIdAndTemplateId(cts);
		}
	    return 1;
	}
	
	
	@RequestMapping(value = "shop/templateShop_delete4ajax")
	public @ResponseBody int delete4ajax(HttpServletRequest rqs, TCategoryTemplateShop cts) throws BusinessException {
		TCategoryTemplateShopMapper ctsm = this.getMybatisBaseService().getMapper(TCategoryTemplateShopMapper.class);
		cts.setShopId(this.getShopId(rqs));
		ctsm.updateOptionsByShopIdAndTemplateId(cts);
	    return 1;
	}
	
	
	@RequestMapping(value = "shop/templateShop_getByCid")
	public ModelAndView getByCid(HttpServletRequest rqs, TCategoryTemplateShop cts, String view) throws BusinessException {
		TCategoryTemplateShopMapper ctsm = this.getMybatisBaseService().getMapper(TCategoryTemplateShopMapper.class);
		cts = ctsm.selectByCategoryId(cts.getCategoryId());
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);  
	    mav.addObject("cts", cts);
	    return mav;
	}
	
	
	
}
