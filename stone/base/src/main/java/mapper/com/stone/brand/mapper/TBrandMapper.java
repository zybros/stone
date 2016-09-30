package com.stone.brand.mapper;

import java.util.List;

import com.stone.brand.model.TBrand;

public interface TBrandMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int insert(TBrand record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int insertSelective(TBrand record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    TBrand selectByPrimaryKey(Integer id);
    

    /**
     * 根据Brand查询
     * 参数:brand
     * 返回:对象
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    List<TBrand> selectList(TBrand record);
    
    List<TBrand> selectListByCtgId(int ctgId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int updateByPrimaryKeySelective(TBrand record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    int updateByPrimaryKey(TBrand record);
}