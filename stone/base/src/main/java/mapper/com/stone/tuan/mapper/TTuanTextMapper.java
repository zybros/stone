package com.stone.tuan.mapper;

import com.stone.tuan.model.TTuanText;

public interface TTuanTextMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int deleteByPrimaryKey(Integer tuanId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int insert(TTuanText record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int insertSelective(TTuanText record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    TTuanText selectByPrimaryKey(Integer tuanId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKeySelective(TTuanText record);

    /**
     * 根据主键修改，空值条件会修改成null,支持大字段类型
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKeyWithBLOBs(TTuanText record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKey(TTuanText record);
}