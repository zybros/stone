package com.stone.ad.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.ad.mapper.TAdLocationLinkMapper;
import com.stone.ad.model.TAdLocationLink;
import com.stone.ad.model.TAdLocationLinkKey;
import com.stone.base.service.MybatisBaseServiceImpl;

@Service("locaAdLinkServiceImpl")
public class LocaAdLinkServiceImpl extends MybatisBaseServiceImpl implements ILocaAdLinkService {

	// 两种例外
	// 1.unchecked 默认回滚事务(RuntimeException)
	// 2.checked 默认不回滚事务(Exception)
	// 开启事务.并设置unchecked例外不回滚
	// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
	// RuntimeException.class)
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void delete(TAdLocationLink all) throws Exception {
		TAdLocationLinkMapper lm = this.getMapper(TAdLocationLinkMapper.class);
		List<Integer> ids = all.getAdIds();
		for(int adId : ids){
			TAdLocationLinkKey key = new TAdLocationLinkKey();
			key.setAdId(adId);
			key.setLocationId(all.getLocationId());
			lm.deleteByPrimaryKey(key);
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
		public void add(TAdLocationLink all) throws Exception {
			TAdLocationLinkMapper lm = this.getMapper(TAdLocationLinkMapper.class);
			List<Integer> ids = all.getAdIds();
			for(int adId : ids){
				TAdLocationLink link = new TAdLocationLink();
				link.setAdId(adId);
				link.setLocationId(all.getLocationId());
				link.setSiteId(0);
				link.setCategoryId(0);
				lm.insert(link);
			}
			
		}


}
