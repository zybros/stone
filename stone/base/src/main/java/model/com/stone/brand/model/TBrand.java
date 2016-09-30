package com.stone.brand.model;

import java.io.Serializable;

public class TBrand implements Serializable {
    /**
     * t_brand.id (品牌主键)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private Integer id;

    /**
     * t_brand.name (品牌名称：一般为该字段在前台显示的中文名称，也可含有英文或数字)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private String name;

    /**
     * t_brand.desc (品牌描述)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private String desc;

    /**
     * t_brand.img (品牌图标：存储图标地址)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private String img;

    /**
     * t_brand.website (品牌网址)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private String website;

    /**
     * t_brand.order (前台显示排序)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private Integer order;

    /**
     * t_brand.status (1：启用  2：禁用)
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}