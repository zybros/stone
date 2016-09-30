package com.stone.search.api.product;


import com.stone.search.base.model.product.ProductDoc;

public interface IProductIndex{
	
	
	public  void createIndex(ProductDoc pd) throws Exception ;
}
