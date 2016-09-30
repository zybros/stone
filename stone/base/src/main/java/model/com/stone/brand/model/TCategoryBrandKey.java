package com.stone.brand.model;

import java.util.List;

public class TCategoryBrandKey {
    /**
     * t_category_brand.brand_id
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private Integer brandId;

    /**
     * t_category_brand.category_id
     * @ibatorgenerated 2016-03-08 18:08:45
     */
    private Integer categoryId;
    
    private List<Integer> brandIds;

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

	public List<Integer> getBrandIds() {
		return brandIds;
	}

	public void setBrandIds(List<Integer> brandIds) {
		this.brandIds = brandIds;
	}
    
    
}