package com.stone.shop.controller;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.shop.model.TShop;
import com.stone.shop.service.IShopService;
import com.stone.user.model.TUser;
import com.stone.shop.mapper.TShopMapper;

@Controller
public class ShopController extends BaseController{
	protected static final Logger log = Logger.getLogger(ShopController.class);
	
	
	@Resource(name = "shopServiceImpl")
	private IShopService shopService;

	
	@RequestMapping(value = "shop/index")
	public ModelAndView index(HttpServletRequest rqs,HttpServletResponse rps) throws Exception{
		
		int shopId = this.getShopId(rqs);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("shop/index");   
	    mav.addObject("shopId", shopId);
	    return mav;
	}
	
	
	
	@RequestMapping(value = "shop/shop_apply")
	public ModelAndView apply(HttpServletRequest rqs,HttpServletResponse rps, TShop shop) throws Exception{
		shop.setUserId(getCurrentUserId(rqs));
		shopService.apply(shop);
		
		TUser user = this.getCurrentUser(rqs);
		user.setShopId(shop.getShopId());
		this.setCurrentUser(user, rqs, rps);
		
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("shop/msg");   
	    mav.addObject("msg", "开通申请已提交，<a href='shop_get.do?shopId="+shop.getShopId()+"&view=shop/shop_info'>查看申请状态</a>");
	    return mav;
	}
	
	@RequestMapping(value = "shop_register")
	public ModelAndView register(HttpServletResponse rps, TShop shop) throws BusinessException, IOException {
		TShopMapper sm = this.getMybatisBaseService().getMapper(TShopMapper.class);
		sm.insert(shop);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("msg");   
	    mav.addObject("msg", "注册成功");
	    return mav;
	}
	
	
	@RequestMapping(value = "shop/shop_get")
	public ModelAndView get4shop(HttpServletRequest rqs, int shopId,String view) throws BusinessException {
		TShopMapper sm = this.getMybatisBaseService().getMapper(TShopMapper.class);
		TShop shop = sm.selectByPrimaryKey(shopId);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(view);  
	    mav.addObject("shop", shop);
	    return mav;
	}
	
	
	
}
