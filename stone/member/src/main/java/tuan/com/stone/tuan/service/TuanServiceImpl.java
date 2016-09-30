package com.stone.tuan.service;



import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.model.Product;
import com.stone.tuan.mapper.TTuanMapper;
import com.stone.tuan.mapper.TTuanTextMapper;
import com.stone.tuan.model.TTuan;

@Service("tuanService")
public class TuanServiceImpl extends MybatisBaseServiceImpl implements ITuanService {

	protected static final Logger log = Logger.getLogger(TuanServiceImpl.class);

	// 两种例外
	// 1.unchecked 默认回滚事务(RuntimeException)
	// 2.checked 默认不回滚事务(Exception)
	// 开启事务.并设置unchecked例外不回滚
	// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
	// RuntimeException.class)
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void add(TTuan item) throws Exception {
		// TODO Auto-generated method stub
		// 插入基本信息
		TTuanMapper tm = this.getMapper(TTuanMapper.class);
		tm.insert(item);

		ProductMapper pm = this.getMapper(ProductMapper.class);
		Product p = new Product();
		p.setId(item.getProductId());
		p.setPrice(item.getPrice());
		p.setDiscountPrice(item.getDiscountPrice());
		pm.updateByPrimaryKeySelective(p);
		
		
		// 插入文本信息
		item.getText().setTuanId(item.getId());
		TTuanTextMapper m = this.getMapper(TTuanTextMapper.class);
		m.insert(item.getText());
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void update(TTuan item) throws Exception {

		// 更新团购基本信息
		TTuanMapper tm = this.getMapper(TTuanMapper.class);
		tm.updateByPrimaryKeySelective(item);
		
		ProductMapper pm = this.getMapper(ProductMapper.class);
		Product p = new Product();
		p.setId(item.getProductId());
		p.setPrice(item.getPrice());
		p.setDiscountPrice(item.getDiscountPrice());
		pm.updateByPrimaryKeySelective(p);
		

		// 更新团购文本信息
		item.getText().setTuanId(item.getId());
		TTuanTextMapper m = this.getMapper(TTuanTextMapper.class);
		m.updateByPrimaryKeySelective(item.getText());

	}
	
	

}
