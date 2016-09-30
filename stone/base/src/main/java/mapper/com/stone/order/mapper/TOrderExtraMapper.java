package com.stone.order.mapper;

import com.stone.order.model.TOrderExtra;

public interface TOrderExtraMapper {
    int deleteByPrimaryKey(Integer extraId);

    int insert(TOrderExtra record);

    int insertSelective(TOrderExtra record);

    TOrderExtra selectByPrimaryKey(Integer extraId);

    int updateByPrimaryKeySelective(TOrderExtra record);

    int updateByPrimaryKey(TOrderExtra record);
}