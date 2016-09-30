package com.stone.order.mapper;

import com.stone.order.model.TOrderComment;

public interface TOrderCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TOrderComment record);

    int insertSelective(TOrderComment record);

    TOrderComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TOrderComment record);

    int updateByPrimaryKey(TOrderComment record);
}