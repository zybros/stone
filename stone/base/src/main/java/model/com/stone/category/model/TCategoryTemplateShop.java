package com.stone.category.model;

import java.io.Serializable;

public class TCategoryTemplateShop implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * t_category_template_shop.id
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    private Integer id;

    /**
     * t_category_template_shop.shop_id (商家id)
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    private Integer shopId;

    /**
     * t_category_template_shop.category_id (类别id)
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    private Integer categoryId;

    /**
     * t_category_template_shop.template_id (模板id)
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    private Integer templateId;

    /**
     * t_category_template_shop.options (项分隔符：英文"," 例性别： 男,女  表示两个选择项 男  女)
     * @ibatorgenerated 2015-12-30 18:56:50
     */
    private String options;
    
    
    public static final String optionSeparator = ",";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
    }
}