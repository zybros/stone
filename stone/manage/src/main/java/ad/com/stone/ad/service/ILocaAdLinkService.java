package com.stone.ad.service;

import com.stone.ad.model.TAdLocationLink;
import com.stone.base.service.IMybatisBaseService;

public interface ILocaAdLinkService extends IMybatisBaseService {
	
	public void delete(TAdLocationLink all) throws Exception;
	
	
	public void add(TAdLocationLink all) throws Exception;
	

}
