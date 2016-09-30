package com.stone.category.mapper;

import java.util.List;
import java.util.Map;

import com.stone.category.model.TCategoryTemplate;

public interface TCategoryTemplateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TCategoryTemplate record);

    int insertSelective(TCategoryTemplate record);

    TCategoryTemplate selectByPrimaryKey(Integer id);

    List<TCategoryTemplate> selectByCategoryId(Integer categoryId);
    
    List<TCategoryTemplate> selectByCidAndType(TCategoryTemplate t);
    
    List<TCategoryTemplate> selectSelf4shop(Map<String,Object> m);
    
    List<TCategoryTemplate> selectByTemplate(TCategoryTemplate t);
    
    Integer selectMaxValueOderByCategoryId(Integer categoryId);
    
    int updateByPrimaryKeySelective(TCategoryTemplate record);

    int updateByPrimaryKey(TCategoryTemplate record);
    
    int updateValueOrderById(TCategoryTemplate record);
    
}