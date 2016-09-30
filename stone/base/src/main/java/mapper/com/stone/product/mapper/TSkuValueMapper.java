package com.stone.product.mapper;

import java.util.List;

import com.stone.product.model.TSkuValue;

public interface TSkuValueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TSkuValue record);

    int insertSelective(TSkuValue record);

    TSkuValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TSkuValue record);

    int updateByPrimaryKey(TSkuValue record);
    
    int insertList(List<TSkuValue> list);
    
    int deleteByProductId(int productId);
    
    int deleteBySkuId(int skuId);
    
    List<TSkuValue> selectSkuValsByProductId(int productId);
    
    List<TSkuValue> selectSkuValsGroupByTemplateId(int productId);
    
}