package com.stone.order.model;

import java.io.Serializable;

public class TOrderDetail implements Serializable {
    private Integer id;

    private Long orderId;

    private Integer productId;

    private String productNo;

    private String productTitle;

    private Integer skuId;

    private String skuName;

    private String skuNo;

    private String skuImg;

    private Float skuPrice;

    private Float skuDiscount;

    private Float discountPrice;

    private Integer offerId;

    private Float price;
    
    private int count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductNo() {
        return productNo;
    }

    public void setProductNo(String productNo) {
        this.productNo = productNo;
    }


    public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public Integer getSkuId() {
        return skuId;
    }

    public void setSkuId(Integer skuId) {
        this.skuId = skuId;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    public String getSkuNo() {
        return skuNo;
    }

    public void setSkuNo(String skuNo) {
        this.skuNo = skuNo;
    }

    public String getSkuImg() {
        return skuImg;
    }

    public void setSkuImg(String skuImg) {
        this.skuImg = skuImg;
    }

    public Float getSkuPrice() {
        return skuPrice;
    }

    public void setSkuPrice(Float skuPrice) {
        this.skuPrice = skuPrice;
    }

    public Float getSkuDiscount() {
        return skuDiscount;
    }

    public void setSkuDiscount(Float skuDiscount) {
        this.skuDiscount = skuDiscount;
    }

    public Float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Integer getOfferId() {
        return offerId;
    }

    public void setOfferId(Integer offerId) {
        this.offerId = offerId;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
    
    
    
}