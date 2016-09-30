package com.stone.order.mapper;

import java.util.List;

import com.stone.order.model.TOrder;

public interface TOrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    TOrder selectByPrimaryKey(Long orderId);

    int updateByPrimaryKeySelective(TOrder record);

    int updateByPrimaryKey(TOrder record);
    
    int updateStatusById(TOrder record);
    
    List<TOrder> select4myOrderList(TOrder record);
    
    List<TOrder> selectList(TOrder record);
}