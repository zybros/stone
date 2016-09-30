package com.stone.site.mapper;

import java.util.List;

import com.stone.product.model.TProductSku;
import com.stone.site.model.TNavigationField;

public interface TNavigationFieldMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int deleteByPrimaryKey(Integer fieldId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int insert(TNavigationField record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int insertSelective(TNavigationField record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    TNavigationField selectByPrimaryKey(Integer fieldId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int updateByPrimaryKeySelective(TNavigationField record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int updateByPrimaryKey(TNavigationField record);
    
    
    int insertList(List<TNavigationField> list);
    
    int deleteByRecordId(int recordId);
}