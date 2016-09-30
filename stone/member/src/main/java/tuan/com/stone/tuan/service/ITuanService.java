package com.stone.tuan.service;


import com.stone.base.service.IMybatisBaseService;
import com.stone.tuan.model.TTuan;

public interface ITuanService extends IMybatisBaseService {
	
	public void add(TTuan item)throws Exception;
	
	public void update(TTuan item) throws Exception;
	
}
