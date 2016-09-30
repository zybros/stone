package com.stone.search.impl.product;


import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.stone.search.api.product.IProductSearch;
import com.stone.search.base.model.product.ProductDoc;
import com.stone.search.base.repository.product.ProductRepository;

public class ProductSearchImpl implements IProductSearch {

	protected static final Logger log = Logger.getLogger(ProductSearchImpl.class);
	
	@Resource
	private ProductRepository productRepository ;
	
	@Override
	public List<ProductDoc> findByTitle(String title) throws Exception {
		List<ProductDoc> list = productRepository.findByTitle(title);
		 
		return list;
	} 

	

}
