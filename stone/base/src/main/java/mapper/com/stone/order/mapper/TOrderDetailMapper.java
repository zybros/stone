package com.stone.order.mapper;

import com.stone.order.model.TOrderDetail;

public interface TOrderDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TOrderDetail record);

    int insertSelective(TOrderDetail record);

    TOrderDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TOrderDetail record);

    int updateByPrimaryKey(TOrderDetail record);
}