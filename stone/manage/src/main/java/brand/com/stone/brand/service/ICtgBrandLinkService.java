package com.stone.brand.service;

import com.stone.base.service.IMybatisBaseService;
import com.stone.brand.model.TCategoryBrandKey;

public interface ICtgBrandLinkService extends IMybatisBaseService {
	
	public void delete(TCategoryBrandKey cb) throws Exception;
	
	
	public void add(TCategoryBrandKey cb) throws Exception;
	

}
