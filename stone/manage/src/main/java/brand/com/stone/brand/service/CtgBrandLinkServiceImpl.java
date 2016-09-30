package com.stone.brand.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.ad.mapper.TAdLocationLinkMapper;
import com.stone.ad.model.TAdLocationLink;
import com.stone.ad.model.TAdLocationLinkKey;
import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.brand.mapper.TCategoryBrandMapper;
import com.stone.brand.model.TCategoryBrandKey;

@Service("ctgBrandLinkServiceImpl")
public class CtgBrandLinkServiceImpl extends MybatisBaseServiceImpl implements ICtgBrandLinkService {

	// 两种例外
	// 1.unchecked 默认回滚事务(RuntimeException)
	// 2.checked 默认不回滚事务(Exception)
	// 开启事务.并设置unchecked例外不回滚
	// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
	// RuntimeException.class)
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void delete(TCategoryBrandKey cb) throws Exception {
		TCategoryBrandMapper m = this.getMapper(TCategoryBrandMapper.class);
		List<Integer> ids = cb.getBrandIds();
		for(int id : ids){
			cb.setBrandId(id);
			m.deleteByPrimaryKey(cb);
		}
		
	}
	
	
	// 两种例外
		// 1.unchecked 默认回滚事务(RuntimeException)
		// 2.checked 默认不回滚事务(Exception)
		// 开启事务.并设置unchecked例外不回滚
		// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
		// RuntimeException.class)
		@Transactional(propagation = Propagation.REQUIRED)
		@Override
		public void add(TCategoryBrandKey cb) throws Exception {
			TCategoryBrandMapper m = this.getMapper(TCategoryBrandMapper.class);
			List<Integer> ids = cb.getBrandIds();
			for(int id : ids){
				cb.setBrandId(id);
				m.insert2(cb);
			}
			
		}


}
