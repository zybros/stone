package com.stone.site.mapper;

import java.util.List;

import com.stone.site.model.TNavigation;

public interface TNavigationMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    int insert(TNavigation record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    int insertSelective(TNavigation record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    TNavigation selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    int updateByPrimaryKeySelective(TNavigation record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    int updateByPrimaryKey(TNavigation record);
    
    
    List<TNavigation> selectSublistByPid(int parentId);
    
    
    List<TNavigation> selectListByNav(TNavigation record);
    
    List<TNavigation> selectAll();
}