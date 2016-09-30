package com.stone.shop.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.base.exception.BusinessException;
import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.security.mapper.TUserRoleMapper;
import com.stone.security.model.TUserRoleKey;
import com.stone.shop.mapper.TShopMapper;
import com.stone.shop.model.TShop;
import com.stone.user.mapper.TUserMapper;
import com.stone.user.model.TUser;

@Service("shopServiceImpl")
public class ShopServiceImpl extends MybatisBaseServiceImpl implements IShopService {

	
		// 两种例外
		// 1.unchecked 默认回滚事务(RuntimeException)
		// 2.checked 默认不回滚事务(Exception)
		// 开启事务.并设置unchecked例外不回滚
		// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
		// RuntimeException.class)
		@Transactional(propagation = Propagation.REQUIRED)
	public void apply(TShop shop) throws Exception {
		// TODO Auto-generated method stub
			try {
				TShopMapper sm = this.getMapper(TShopMapper.class);
				sm.insert(shop);
				
				TUser user = new TUser();
				user.setUserId(shop.getUserId());
				user.setShopId(shop.getShopId());
				TUserMapper um = this.getMapper(TUserMapper.class);
				um.updateByPrimaryKeySelective(user);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new BusinessException("此异常是runtime，默认回滚事务");
			}
			
			
			
		
	}

}
