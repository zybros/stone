package com.stone.brand.mapper;

import com.stone.brand.model.TCategoryBrandKey;

public interface TCategoryBrandMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int deleteByPrimaryKey(TCategoryBrandKey key);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int insert2(TCategoryBrandKey record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int insertSelective(TCategoryBrandKey record);
}