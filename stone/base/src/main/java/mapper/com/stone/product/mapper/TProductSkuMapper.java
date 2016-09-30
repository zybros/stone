package com.stone.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;
import com.stone.shop.model.TShop;

public interface TProductSkuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TProductSku record);

    int insertSelective(TProductSku record);

    TProductSku selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TProductSku record);

    int updateByPrimaryKey(TProductSku record);
    
    int insertList(List<TProductSku> list);
    
    int deleteByProductId(int productId);
    
    List callTemplateAndSkus(@Param("categoryId")int categoryId,@Param("productId")int productId);
    
    List callTemplateAndSku(@Param("categoryId")int categoryId,@Param("skuId")int skuId);
    
    List<TProductSku> selectSkus4confirm(List<Integer> ids);
    
    List<TShop> selectSkusGroupByShop(List<Integer> ids);
    
    TProductSku selectSku4cart(int id);
    
    
    List<TProductSku> selectSkusByProductId(int productId);
    
    List<Map<String,String>> selectSkuValsGroupBySkuId(int productId);
}