package com.stone.search.api.product;


import java.util.List;


import com.stone.search.base.model.product.ProductDoc;

public interface IProductSearch {
	
	
	public  List<ProductDoc> findByTitle(String title) throws Exception ;
}
