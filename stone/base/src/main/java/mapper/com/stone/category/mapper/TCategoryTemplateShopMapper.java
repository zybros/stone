package com.stone.category.mapper;

import com.stone.category.model.TCategoryTemplateShop;

public interface TCategoryTemplateShopMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    int insert(TCategoryTemplateShop record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    int insertSelective(TCategoryTemplateShop record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    TCategoryTemplateShop selectByPrimaryKey(Integer id);
    
    
    TCategoryTemplateShop selectByCategoryId(Integer category_id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    int updateByPrimaryKeySelective(TCategoryTemplateShop record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    int updateByPrimaryKey(TCategoryTemplateShop record);
    
    
    int updateOptionsByShopIdAndTemplateId(TCategoryTemplateShop record);
}