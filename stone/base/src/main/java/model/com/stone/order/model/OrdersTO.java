package com.stone.order.model;

import java.util.List;

public class OrdersTO {
	
	List<TOrder> orders;
	
	TOrderExtra extra;

	public List<TOrder> getOrders() {
		return orders;
	}

	public void setOrders(List<TOrder> orders) {
		this.orders = orders;
	}

	public TOrderExtra getExtra() {
		return extra;
	}

	public void setExtra(TOrderExtra extra) {
		this.extra = extra;
	}
	
	
	
	

}
