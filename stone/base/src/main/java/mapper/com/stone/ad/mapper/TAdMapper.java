package com.stone.ad.mapper;

import java.util.List;

import com.stone.ad.model.TAd;

public interface TAdMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int deleteByPrimaryKey(Integer adId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insert(TAd record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insertSelective(TAd record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    TAd selectByPrimaryKey(Integer adId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKeySelective(TAd record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKey(TAd record);
    
    /**
     * 查询所有广告
     * @return
     */
    List<TAd> selectAll();
    
    /**
     * 查询投放者名下的广告
     * @param ownerId
     * @return
     */
    List<TAd> selectListByOwnerId(int ownerId);
    
    
    /**
     * 查询指定广告位下的广告
     * @param locationId
     * @return
     */
    List<TAd> selectListByLocationId(int locationId);
    
}