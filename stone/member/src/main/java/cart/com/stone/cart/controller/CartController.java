package com.stone.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.cart.model.Cart;
import com.stone.cart.model.CartItem;
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;
import com.stone.shop.model.TShop;

@Controller
public class CartController extends BaseController {

	protected static final Logger log = Logger.getLogger(CartController.class);

	@RequestMapping(value = "/user/cart_add")
	public ModelAndView add(HttpServletResponse rps, HttpServletRequest rqs,CartItem item) throws BusinessException, IOException {
		ModelAndView mav = new ModelAndView();
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		if (cart == null) cart = new Cart();
		//此后增加判断该sku是否已经在购物车里面，若不在，则需要查询数据库的逻辑
		if(cart.getItemById(item.getSku().getId())==null){
			TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
			TProductSku sku = psm.selectSku4cart(item.getSku().getId());
			sku.setCount(item.getSku().getCount());
			item.setSku(sku);
		}
		cart.add(item);
		this.setCurrentCart(cart,rqs,rps);
		mav.addObject("cart", cart);
		mav.setViewName("user/cart");
		return mav;
	}
	
	@RequestMapping(value = "/user/cart_add4ajax")
	public @ResponseBody int add4ajax(HttpServletResponse rps, HttpServletRequest rqs,CartItem item) throws BusinessException, IOException {
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		if (cart == null) cart = new Cart();
		//此后增加判断该sku是否已经在购物车里面，若不在，则需要查询数据库的逻辑
		//cart 里面只存放skuID和count
//		if(cart.getItemById(item.getSku().getId())==null){
//			TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
//			TProductSku sku = psm.selectSku4cart(item.getSku().getId());
//			sku.setCount(item.getSku().getCount());
//			item.setSku(sku);
//		}
		item.getSku().setChecked(true);
		cart.add(item);
		this.setCurrentCart(cart,rqs,rps);
		
		return 1;
	}
	
	
	@RequestMapping(value = "/user/cart_list")
	public ModelAndView list(HttpServletResponse rps, HttpServletRequest rqs,CartItem item) throws BusinessException, IOException {
		ModelAndView mav = new ModelAndView();
		//商品信息
		TProductSkuMapper psm = this.getMybatisBaseService().getMapper(TProductSkuMapper.class);
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		if(cart!=null){
			List<TShop> shopList = psm.selectSkusGroupByShop(cart.getSkuIds());
			syncFromCart(shopList,cart);
			mav.addObject("shopList", shopList);
			mav.addObject("totalCount", cart.getTotalCount());
			mav.addObject("totalPrice", cart.getTotalCount());
		}
		mav.setViewName("user/cart");
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

	@RequestMapping(value = "/user/cart_delete")
	public String delete(HttpServletResponse rps, HttpServletRequest rqs,
			CartItem item) throws BusinessException, IOException {
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		cart.deleteItemById(item.getSku().getId());
		this.setCurrentCart(cart, rqs, rps);
		rps.sendRedirect("cart_list.do");
		return null;
	}
	
	
	@RequestMapping(value = "/user/cart_changeChecked4ajax",method = RequestMethod.POST)
	public @ResponseBody int changeChecked4ajax(HttpServletResponse rps, HttpServletRequest rqs,int skuId,boolean checked) throws BusinessException, IOException {
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		cart.setItemCheckedById(skuId, checked);
		this.setCurrentCart(cart, rqs, rps);
		return 1;
	}
	

	@RequestMapping(value = "/user/cart_update")
	public String update(HttpServletResponse rps, HttpServletRequest rqs,
			CartItem item, Product p) throws BusinessException, IOException {

		HttpSession session = rqs.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			return "";
		}

		rps.sendRedirect("cart_list.do");
		return null;
	}
		
	@RequestMapping(value = "/user/getCartCount4ajax")
	public @ResponseBody int getCartCount(HttpServletRequest rqs) throws BusinessException, IOException {
		Cart cart  = (Cart) this.getCurrentCart(rqs);
		if(cart==null){
			return 0;
		}
		return cart.getTotalCount();
	}
}
