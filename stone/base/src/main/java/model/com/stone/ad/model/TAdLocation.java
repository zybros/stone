package com.stone.ad.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class TAdLocation implements Serializable {
    /**
     * t_ad_location.LOCATION_ID (主键)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private Integer locationId;
    
    /**
     * 父级
     */
    private int parentId;

    /**
     * t_ad_location.LOCATION_NAME (位置名称)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private String locationName;

    /**
     * t_ad_location.LOCATION_DESCRIPTIONS (位置描述)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private String locationDescriptions;

    /**
     * t_ad_location.LOCATION_WIDTH (宽度)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private Integer locationWidth;

    /**
     * t_ad_location.LOCATION_HIGH (高度)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private Integer locationHigh;

    /**
     * t_ad_location.CREATE_TIME (创建时间)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private Date createTime;

    /**
     * t_ad_location.UPDATE_TIME (更新时间)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private Date updateTime;

    /**
     * t_ad_location.LOCATION_CODE (广告代码)
     * @ibatorgenerated 2015-12-17 12:16:24
     */
    private String locationCode;
    
    private List<TAdLocation> sublist = new ArrayList<TAdLocation>();

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(Integer locationId) {
        this.locationId = locationId;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getLocationDescriptions() {
        return locationDescriptions;
    }

    public void setLocationDescriptions(String locationDescriptions) {
        this.locationDescriptions = locationDescriptions;
    }

    public Integer getLocationWidth() {
        return locationWidth;
    }

    public void setLocationWidth(Integer locationWidth) {
        this.locationWidth = locationWidth;
    }

    public Integer getLocationHigh() {
        return locationHigh;
    }

    public void setLocationHigh(Integer locationHigh) {
        this.locationHigh = locationHigh;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getLocationCode() {
        return locationCode;
    }

    public void setLocationCode(String locationCode) {
        this.locationCode = locationCode;
    }

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public List<TAdLocation> getSublist() {
		return sublist;
	}

	public void setSublist(List<TAdLocation> sublist) {
		this.sublist = sublist;
	}
    
    
}