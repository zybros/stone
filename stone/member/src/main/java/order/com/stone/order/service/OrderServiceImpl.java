package com.stone.order.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.order.mapper.TOrderDetailMapper;
import com.stone.order.mapper.TOrderExtraMapper;
import com.stone.order.mapper.TOrderMapper;
import com.stone.order.model.TOrder;
import com.stone.order.model.TOrderDetail;
import com.stone.order.model.TOrderExtra;

@Service("orderServiceImpl")
public class OrderServiceImpl extends MybatisBaseServiceImpl implements IOrderService {

	protected static final Logger log = Logger.getLogger(OrderServiceImpl.class);

	// 两种例外
	// 1.unchecked 默认回滚事务(RuntimeException)
	// 2.checked 默认不回滚事务(Exception)
	// 开启事务.并设置unchecked例外不回滚
	// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
	// RuntimeException.class)
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void submit(List<TOrder> orders) throws Exception {

		for (TOrder order : orders) {
			TOrderMapper om = this.getMapper(TOrderMapper.class);
			om.insert(order);

			TOrderExtra extra = order.getExtra();
			extra.setOrderId(order.getOrderId());
			TOrderExtraMapper oem = this.getMapper(TOrderExtraMapper.class);
			oem.insert(extra);

			List<TOrderDetail> details = order.getDetails();
			for (TOrderDetail detail : details) {
				detail.setOrderId(order.getOrderId());
				TOrderDetailMapper odm = this.getMapper(TOrderDetailMapper.class);
				odm.insert(detail);
			}
		}
	}

}
