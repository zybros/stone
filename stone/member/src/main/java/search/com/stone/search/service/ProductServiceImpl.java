package com.stone.search.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.stone.search.api.product.IProductSearch;
import com.stone.search.base.model.product.ProductDoc;

@Service("productService")
public class ProductServiceImpl implements IProductService{

	protected static final Logger log = Logger.getLogger(ProductServiceImpl.class);
	
	@Resource
	private IProductSearch productSearch ;

	@Override
	public List<ProductDoc> searchByTitle(String title) throws Exception {
		List<ProductDoc> list = productSearch.findByTitle(title);
		 
		return list;
	} 

	

}
