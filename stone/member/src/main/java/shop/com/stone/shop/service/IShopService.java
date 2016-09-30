package com.stone.shop.service;

import com.stone.base.service.IMybatisBaseService;
import com.stone.shop.model.TShop;

public interface IShopService extends IMybatisBaseService {
	
	public void apply(TShop shop) throws Exception;
	

}
