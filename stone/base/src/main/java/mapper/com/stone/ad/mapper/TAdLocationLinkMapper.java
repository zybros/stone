package com.stone.ad.mapper;

import com.stone.ad.model.TAdLocationLink;
import com.stone.ad.model.TAdLocationLinkKey;

public interface TAdLocationLinkMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int deleteByPrimaryKey(TAdLocationLinkKey linkKey);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insert(TAdLocationLink record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insertSelective(TAdLocationLink record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    TAdLocationLink selectByPrimaryKey(int adId, int locationId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKeySelective(TAdLocationLink record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKey(TAdLocationLink record);
}