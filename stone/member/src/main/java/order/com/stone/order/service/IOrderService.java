package com.stone.order.service;





import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.stone.base.service.IMybatisBaseService;
import com.stone.order.model.TOrder;
import com.stone.order.model.TOrderDetail;
import com.stone.order.model.TOrderExtra;
import com.stone.product.model.Product;

public interface IOrderService extends IMybatisBaseService {
	
	public void submit(List<TOrder> orders)throws Exception;
}
