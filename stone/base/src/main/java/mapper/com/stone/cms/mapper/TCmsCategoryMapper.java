package com.stone.cms.mapper;

import java.util.List;

import com.stone.cms.model.TCmsCategory;

public interface TCmsCategoryMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    int insert(TCmsCategory record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    int insertSelective(TCmsCategory record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    TCmsCategory selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    int updateByPrimaryKeySelective(TCmsCategory record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2015-12-20 11:03:48
     */
    int updateByPrimaryKey(TCmsCategory record);
    /**
     * 查询所有栏目
     * @return
     */
    List<TCmsCategory> selectAll();
    /**
     * 查询指定父级下的子栏目
     * @return
     */
    List<TCmsCategory> selectSublist(int parentId);
    
    List<TCmsCategory> selectList(TCmsCategory ctg);
}