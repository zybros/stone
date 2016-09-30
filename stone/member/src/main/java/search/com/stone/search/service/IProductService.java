package com.stone.search.service;


import java.util.List;



import com.stone.search.base.model.product.ProductDoc;

public interface IProductService{

	
	public List<ProductDoc> searchByTitle(String title) throws Exception ;

	

}
