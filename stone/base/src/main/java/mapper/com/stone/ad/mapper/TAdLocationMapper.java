package com.stone.ad.mapper;

import java.util.List;

import com.stone.ad.model.TAdLocation;
import com.stone.cms.model.TCmsCategory;

public interface TAdLocationMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int deleteByPrimaryKey(Integer locationId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insert(TAdLocation record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int insertSelective(TAdLocation record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    TAdLocation selectByPrimaryKey(Integer locationId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKeySelective(TAdLocation record);

    /**
     * 根据主键修改，空值条件会修改成null,支持大字段类型
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKeyWithBLOBs(TAdLocation record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    int updateByPrimaryKey(TAdLocation record);
    
    /**
     * 查询所有广告位
     * @return
     */
    List<TAdLocation> selectAll();
    
    /**
     * 查询指定父级下的子栏目
     * @return
     */
    List<TAdLocation> selectSublist(int parentId);
    
}