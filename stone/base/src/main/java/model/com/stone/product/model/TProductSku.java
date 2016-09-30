package com.stone.product.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TProductSku implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer categoryId;

    private Integer productId;

    private String skuNo;

    private Float price;

    private Float discount;

    private Float discountPrice;

    private Integer stock;

    private Integer upperLimit;

    private Integer imgIndex;

    private Integer skuType;
    
    private List<TSkuValue> valList = new ArrayList<TSkuValue> ();
    
    private String valsStr;
    
    private Product product;
    
    /**
     * 购物车中SKU的购买数量
     */
    private int  count;
    /**
     * 购物车中SKU的选中状态
     */
    private boolean checked;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getSkuNo() {
        return skuNo;
    }

    public void setSkuNo(String skuNo) {
        this.skuNo = skuNo;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getUpperLimit() {
        return upperLimit;
    }

    public void setUpperLimit(Integer upperLimit) {
        this.upperLimit = upperLimit;
    }

    public Integer getImgIndex() {
        return imgIndex;
    }

    public void setImgIndex(Integer imgIndex) {
        this.imgIndex = imgIndex;
    }

    public Integer getSkuType() {
        return skuType;
    }

    public void setSkuType(Integer skuType) {
        this.skuType = skuType;
    }

	public List<TSkuValue> getValList() {
		return valList;
	}

	public void setValList(List<TSkuValue> valList) {
		this.valList = valList;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getValsStr() {
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<valList.size();i++){
			if(i>0){
				sb.append(",");
			}
			sb.append(valList.get(i).getValue());
		}
		return sb.toString();
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean getChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}


    
    
}