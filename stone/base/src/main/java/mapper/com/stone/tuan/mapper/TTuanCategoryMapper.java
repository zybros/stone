package com.stone.tuan.mapper;

import java.util.List;

import com.stone.cms.model.TCmsCategory;
import com.stone.tuan.model.TTuanCategory;

public interface TTuanCategoryMapper {
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
    int insert(TTuanCategory record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int insertSelective(TTuanCategory record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    TTuanCategory selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKeySelective(TTuanCategory record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    int updateByPrimaryKey(TTuanCategory record);
    
    
    List<TTuanCategory> selectSublist(int pid);
    
    List<TTuanCategory> selectList(TTuanCategory ctg);
    
    /**
     * 查询所有栏目
     * @return
     */
    List<TTuanCategory> selectAll();
}