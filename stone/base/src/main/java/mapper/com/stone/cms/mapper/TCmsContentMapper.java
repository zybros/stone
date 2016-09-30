package com.stone.cms.mapper;

import java.util.List;

import com.stone.cms.model.TCmsCategory;
import com.stone.cms.model.TCmsContent;

public interface TCmsContentMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int insert(TCmsContent record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int insertSelective(TCmsContent record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    TCmsContent selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int updateByPrimaryKeySelective(TCmsContent record);

    /**
     * 根据主键修改，空值条件会修改成null,支持大字段类型
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int updateByPrimaryKeyWithBLOBs(TCmsContent record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    int updateByPrimaryKey(TCmsContent record);
    
    
    List<TCmsContent> selectList(TCmsContent content);
}