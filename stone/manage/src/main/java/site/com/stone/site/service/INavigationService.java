package com.stone.site.service;





import javax.servlet.http.HttpServletRequest;

import com.stone.base.service.IMybatisBaseService;
import com.stone.product.model.Product;
import com.stone.site.model.TNavigationRecord;

public interface INavigationService extends IMybatisBaseService {
	
	public void add(TNavigationRecord record)throws Exception;
	
	public void update(TNavigationRecord record) throws Exception ;
	
}
