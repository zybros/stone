package com.stone.order.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.order.mapper.TOrderMapper;
import com.stone.order.model.TOrder;


@Controller
public class OrderController extends BaseController{
	
	
	
	@RequestMapping(value = "adm/order_list")
	public ModelAndView list4Adm(HttpServletRequest rqs, TOrder order) throws BusinessException {
		TOrderMapper om = this.getMybatisBaseService().getMapper(TOrderMapper.class);
		List<TOrder> list = om.selectList(order);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/order/orderList");   
	    mav.addObject("list", list);
	    log.info(list);
	    return mav;
	}
	
}
