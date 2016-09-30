package com.stone.order.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cart.model.Cart;
import com.stone.order.mapper.TOrderMapper;
import com.stone.order.model.OrdersTO;
import com.stone.order.model.TOrder;
import com.stone.order.model.TOrderDetail;
import com.stone.order.model.TOrderExtra;
import com.stone.order.service.IOrderService;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;
import com.stone.shop.model.TShop;
import com.stone.user.mapper.TUserAddressMapper;
import com.stone.user.model.TUserAddress;


@Controller
public class OrderController extends BaseController{
	
	
	@Resource(name = "orderServiceImpl")
	private IOrderService orderService;
	
	
	
	@RequestMapping(value = "user/order_pre_confirm")
	public ModelAndView preConfirm(HttpServletRequest rqs,HttpServletResponse rps) throws BusinessException, IOException {
		//收货信息
		TUserAddressMapper uam = this.getMybatisBaseService().getMapper(TUserAddressMapper.class);
		TUserAddress addr = new TUserAddress();
		addr.setUserId(this.getCurrentUserId(rqs));
		List<TUserAddress> addrList = uam.selectList(addr);
		
		//商品信息
		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
		Cart cart  = (Cart) this.getCurrentCart(rqs);

		List<TShop> shopList = psm.selectSkusGroupByShop(cart.getCheckedSkuIds());
		
		syncFromCart(shopList,cart);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("addrList", addrList);
	    mav.addObject("shopList", shopList);
	    mav.setViewName("user/order_confirm");   
	    return mav;
	}
	
	private void syncFromCart(List<TShop> shopList, Cart cart){
		
		for(TShop s : shopList){
			List<Product> proList =  s.getProductList();
			for(Product p : proList){
				List<TProductSku> skuList = p.getSkuList();
				for(TProductSku sku : skuList){
					sku.setCount(cart.getItemById(sku.getId()).getSku().getCount());
					sku.setChecked(cart.getItemById(sku.getId()).getSku().getChecked());
				}
			}
		}
	}
	
	@RequestMapping(value = "use/order_submit")
	public String submit(HttpServletRequest rqs, HttpServletResponse rps, OrdersTO to) throws Exception {
		long groupId = System.currentTimeMillis();
		List<TOrder> orders = to.getOrders();
		for(TOrder order : orders){
			order.setGroupId(groupId);
			order.setUserId(this.getCurrentUserId(rqs));
			order.setUsername(this.getCurrentUser(rqs).getUsername());
			order.setIsPaid(TOrder.Paid.wfk);
			order.setSrvType(TOrder.ServiceType.common);
			order.setPayment(TOrder.Payment.online);
			order.setOrderType(TOrder.Type.user);
			order.setExtra(to.getExtra());
		}
		orderService.submit(orders);
	    rps.sendRedirect("../user/pay.jsp");
	    return null;
	}
	
	@RequestMapping(value = "user/order_list")
	public ModelAndView list(HttpServletRequest rqs, TOrder order) throws BusinessException {
		TOrderMapper om = this.getMybatisBaseService().getMapper(TOrderMapper.class);
		order.setUserId(this.getCurrentUserId(rqs));
		List<TOrder> list = om.select4myOrderList(order);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/user/order_list");   
	    mav.addObject("list", list);
	    log.info(list);
	    return mav;
	}
	
	@RequestMapping(value = "use/order/{id}")
	public ModelAndView add(HttpServletResponse rps, @PathVariable long id) throws BusinessException, IOException {
		TOrderMapper om = this.getMybatisBaseService().getMapper(TOrderMapper.class);
		TOrder order = om.selectByPrimaryKey(id);
		ModelAndView mav = new ModelAndView();
	    mav.addObject("order", order);
	    mav.setViewName("user/order");   
	    return mav;
	}
	
	@RequestMapping(value = "use/order/cancel")
	public void cancel(HttpServletResponse rps, TOrder order) throws BusinessException, IOException {
		TOrderMapper om = this.getMybatisBaseService().getMapper(TOrderMapper.class);
		order.setStatus(TOrder.Status.cancel);
		om.updateStatusById(order);
		rps.sendRedirect("list.do");
	}
	
	@RequestMapping(value = "use/order/finish")
	public void finish(HttpServletResponse rps, TOrder order) throws BusinessException, IOException {
		TOrderMapper om = this.getMybatisBaseService().getMapper(TOrderMapper.class);
		order.setStatus(TOrder.Status.finish);;
		om.updateByPrimaryKeySelective(order);
		rps.sendRedirect("list.do");
	}
	
	
}
