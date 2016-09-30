package com.stone.tuan.mapper;

import java.util.List;

import com.stone.cms.model.TCmsCategory;
import com.stone.tuan.model.TProductTuan;
import com.stone.tuan.model.TTuan;

public interface TTuanMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int insert(TTuan record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int insertSelective(TTuan record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    TTuan selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKeySelective(TTuan record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKey(TTuan record);
    
    List<TTuan> select(TTuan record);
}