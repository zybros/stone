package com.stone.user.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.base.exception.BusinessException;
import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.security.mapper.TUserRoleMapper;
import com.stone.security.model.TUserRoleKey;
import com.stone.user.mapper.TUserAddressMapper;
import com.stone.user.mapper.TUserMapper;
import com.stone.user.model.TUser;
import com.stone.user.model.TUserAddress;

@Service("userAddressServiceImpl")
public class UserAddressServiceImpl extends MybatisBaseServiceImpl implements IUserAddressService {

	// 两种例外
	// 1.unchecked 默认回滚事务(RuntimeException)
	// 2.checked 默认不回滚事务(Exception)
	// 开启事务.并设置unchecked例外不回滚
	// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
	// RuntimeException.class)
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void update(TUserAddress addr) throws Exception {
		TUserAddressMapper uam = this.getMapper(TUserAddressMapper.class);
		if(addr.getIsDefault()==1){
			uam.cancelDefaultByUserId(addr);
		}
		uam.updateByPrimaryKeySelective(addr);
	}
	
	
	// 两种例外
		// 1.unchecked 默认回滚事务(RuntimeException)
		// 2.checked 默认不回滚事务(Exception)
		// 开启事务.并设置unchecked例外不回滚
		// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
		// RuntimeException.class)
		@Transactional(propagation = Propagation.REQUIRED)
		@Override
		public void add(TUserAddress addr) throws Exception {
			TUserAddressMapper uam = this.getMapper(TUserAddressMapper.class);
			if(addr.getIsDefault()==1){
				uam.cancelDefaultByUserId(addr);
			}
			uam.insert(addr);
		}


}
