package com.stone.tuan.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class TTuan implements Serializable {
    /**
     * t_tuan.id
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer id;
    
    /**
     * 所属分类
     */
    private int categoryId;

    /**
     * t_tuan.product_id (商品id)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer productId;

    /**
     * t_tuan.title (团购标题)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String title;

    /**
     * t_tuan.price (原价格)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Float price;

    /**
     * t_tuan.discount (折扣 0-100直接的整数)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer discount;

    /**
     * t_tuan.discount_price (折后价格)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Float discountPrice;

    /**
     * t_tuan.start_time (开始时间)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String startTime;

    /**
     * t_tuan.end_time (结束时间)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String endTime;

    /**
     * t_tuan.sale_num (已售数量)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer saleNum;

    /**
     * t_tuan.shop_id (店铺id)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer shopId;

    /**
     * t_tuan.status (0：存库 1：上架  2：下架 3：删除)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer status;

    /**
     * t_tuan.limit_num (限购量)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer limitNum;

    /**
     * t_tuan.deal_num (成团量)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer dealNum;

    /**
     * t_tuan.images (商品图片 英文分号 ; 分割   )
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String images;

    /**
     * t_tuan.recommend (1：推荐)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer recommend;

    private TTuanText text;
    
    private List<String> imgList = new ArrayList<String>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(Integer saleNum) {
        this.saleNum = saleNum;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Integer limitNum) {
        this.limitNum = limitNum;
    }

    public Integer getDealNum() {
        return dealNum;
    }

    public void setDealNum(Integer dealNum) {
        this.dealNum = dealNum;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

	public TTuanText getText() {
		return text;
	}

	public void setText(TTuanText text) {
		this.text = text;
	}
	





public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


public List<String> getImgList() {
		
		String[] arr =  this.images.split(";"	);
		imgList = Arrays.asList(arr);
		
		return imgList;
	}







public static class StatusC{
    	
    	public static final int store = 0;
    	public static final int on = 1;
    	public static final int off = 2;
    	public static final int del = 3;
    }
}