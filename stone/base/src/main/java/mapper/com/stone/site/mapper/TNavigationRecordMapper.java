package com.stone.site.mapper;

import java.util.List;

import com.stone.site.model.TNavigation;
import com.stone.site.model.TNavigationRecord;

public interface TNavigationRecordMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int deleteByPrimaryKey(Integer recordId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int insert(TNavigationRecord record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int insertSelective(TNavigationRecord record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    TNavigationRecord selectByPrimaryKey(Integer recordId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int updateByPrimaryKeySelective(TNavigationRecord record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    int updateByPrimaryKey(TNavigationRecord record);
    
    List<TNavigationRecord> selectList(TNavigationRecord record);
    
    List<TNavigationRecord> selectListByParentId(int parentId);
    
    List<TNavigationRecord> selectListByType(int type);
    
    List<TNavigationRecord> selectAsTree(TNavigationRecord record);
    
}