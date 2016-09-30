package com.stone.ad.mapper;

import java.util.List;

import com.stone.ad.model.TAdOwner;

public interface TAdOwnerMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insert(TAdOwner record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insertSelective(TAdOwner record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    TAdOwner selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKeySelective(TAdOwner record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKey(TAdOwner record);
    
    
    
    
    /**
     * 查询所有广告投放者
     * @return
     */
    List<TAdOwner> selectAll();
}