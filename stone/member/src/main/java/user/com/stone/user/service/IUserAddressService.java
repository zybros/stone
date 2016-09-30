package com.stone.user.service;

import com.stone.base.service.IMybatisBaseService;
import com.stone.user.model.TUserAddress;

public interface IUserAddressService extends IMybatisBaseService {
	
	public void update(TUserAddress addr) throws Exception;
	
	
	public void add(TUserAddress addr) throws Exception;
	

}
