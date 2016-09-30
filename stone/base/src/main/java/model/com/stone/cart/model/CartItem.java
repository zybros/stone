package com.stone.cart.model;

import java.io.Serializable;

import com.stone.product.model.Product;
import com.stone.product.model.TProductSku;

public class CartItem implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private TProductSku sku;
	
//	private boolean checked;
	
//	private int count;

//	public int getCount() {
//		return count;
//	}
//
//	public void setCount(int count) {
//		this.count = count;
//	}
	
	

	public TProductSku getSku() {
		return sku;
	}

//	public boolean isChecked() {
//		return checked;
//	}
//
//	public void setChecked(boolean checked) {
//		this.checked = checked;
//	}

	public void setSku(TProductSku sku) {
		this.sku = sku;
	}
	
	
}
