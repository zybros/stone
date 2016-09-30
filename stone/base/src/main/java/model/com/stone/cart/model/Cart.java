
package com.stone.cart.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.stone.product.model.TProductSku;


public class Cart  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	List<CartItem> items = new ArrayList<CartItem>();

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}
	
	public void add(CartItem ci) {
		TProductSku newSku = ci.getSku();
		for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {
			CartItem item = iter.next();
			TProductSku oldSku = item.getSku();
			if( newSku.getId().intValue() == oldSku.getId().intValue()) {
				oldSku.setCount(oldSku.getCount()+newSku.getCount());
				return;
			}
		}//这可以用while遍历
		
		items.add(ci);
	}
	
	public double getTotalPrice() {
		double d = 0.0;
		for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
			CartItem current = it.next();
			d += current.getSku().getPrice() * current.getSku().getCount();
		}
		return d;
	}
	
	public int getTotalCount() {
		int count = 0;
		for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
			CartItem current = it.next();
			count += current.getSku().getCount();
		}
		return count;
	}
	
	public void deleteItemById(int id) {
		for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {
			CartItem item = iter.next();
			if(item.getSku().getId().equals(id)) {
				iter.remove();
				return;
			}
		}
	}
	
	public CartItem getItemById(int id) {
		CartItem item = null;
		for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {
			CartItem item2 = iter.next();
			if(item2.getSku().getId().equals(id)) {
				item = item2;
				break;
			}
		}
		return item;
	}
	
	
	public List<Integer> getSkuIds(){
		List<Integer> ids = new ArrayList<Integer>();
		for(CartItem item : items){
			ids.add(item.getSku().getId());
		}
		return ids;
	}
	
	
	public List<Integer> getCheckedSkuIds(){
		List<Integer> ids = new ArrayList<Integer>();
		for(CartItem item : items){
			TProductSku sku = item.getSku();
			if(sku.getChecked()){
				ids.add(item.getSku().getId());
			}
		}
		return ids;
	}
	
	
	public void setItemCheckedById(int id, boolean checked) {
		for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {
			CartItem item = iter.next();
			if(item.getSku().getId().equals(id)) {
				item.getSku().setChecked(checked);
				break;
			}
		}
	}
	
	
	public static void main(String[] s){
		
		Integer a = 99;
		Integer b = 99;
		
		System.out.println(a==b);
	}
	
}

