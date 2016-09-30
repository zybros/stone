package com.stone.product.service;






import com.stone.base.service.IMybatisBaseService;
import com.stone.product.model.Product;

public interface IProductService extends IMybatisBaseService {
	
	public Product getById(int id)throws Exception;
}
