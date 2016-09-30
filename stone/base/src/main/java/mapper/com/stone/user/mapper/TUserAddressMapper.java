package com.stone.user.mapper;

import java.util.List;

import com.stone.user.model.TUserAddress;

public interface TUserAddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TUserAddress record);

    int insertSelective(TUserAddress record);

    TUserAddress selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TUserAddress record);

    int updateByPrimaryKey(TUserAddress record);
    
    List<TUserAddress> selectList(TUserAddress addr);
    
    int cancelDefaultByUserId(TUserAddress addr);
}