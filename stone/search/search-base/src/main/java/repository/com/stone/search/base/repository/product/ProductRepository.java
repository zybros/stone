package com.stone.search.base.repository.product;


import java.util.List;

import org.springframework.data.elasticsearch.repository.ElasticsearchCrudRepository;

import com.stone.search.base.model.product.ProductDoc;



public interface ProductRepository extends ElasticsearchCrudRepository<ProductDoc, Long> {

    List<ProductDoc> findByTitle(String title);


}
