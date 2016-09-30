package com.stone.order.model;

import java.io.Serializable;

public class TOrderComment implements Serializable {
    private Integer id;

    private Integer orderId;

    private Integer productId;

    private String product;

    private String service;

    private String imgs;

    private Integer productStar;

    private Integer serviceStar;

    private Integer expressStar;

    private Integer star;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs;
    }

    public Integer getProductStar() {
        return productStar;
    }

    public void setProductStar(Integer productStar) {
        this.productStar = productStar;
    }

    public Integer getServiceStar() {
        return serviceStar;
    }

    public void setServiceStar(Integer serviceStar) {
        this.serviceStar = serviceStar;
    }

    public Integer getExpressStar() {
        return expressStar;
    }

    public void setExpressStar(Integer expressStar) {
        this.expressStar = expressStar;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }
}