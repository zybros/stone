package com.stone.ad.model;

import java.io.Serializable;
import java.util.Date;

public class TAd implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -8605804131194936611L;

	/**
     * t_ad.AD_ID (主键)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer adId;

    /**
     * t_ad.AD_NAME (名称)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String adName;

    /**
     * t_ad.AD_DESCRIPTION (描述)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String adDescription;

    /**
     * t_ad.AD_TYPE (显示类型：1：图片 2：文字)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer adType;

    /**
     * t_ad.AD_WORDS (广告文字)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String adWords;

    /**
     * t_ad.AD_IMG (广告图片)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String adImg;

    /**
     * t_ad.AD_STATUS (1: 显示   2： 隐藏)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer adStatus;

    /**
     * t_ad.AD_URL (广告链接)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String adUrl;

    /**
     * t_ad.OWNER_ID (投放者)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer ownerId;

    /**
     * t_ad.CREATE_TIME (创建时间)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String createTime;

    /**
     * t_ad.UPDATE_TIME
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String updateTime;

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }

    public String getAdDescription() {
        return adDescription;
    }

    public void setAdDescription(String adDescription) {
        this.adDescription = adDescription;
    }

    public Integer getAdType() {
        return adType;
    }

    public void setAdType(Integer adType) {
        this.adType = adType;
    }

    public String getAdWords() {
        return adWords;
    }

    public void setAdWords(String adWords) {
        this.adWords = adWords;
    }

    public String getAdImg() {
        return adImg;
    }

    public void setAdImg(String adImg) {
        this.adImg = adImg;
    }

    public Integer getAdStatus() {
        return adStatus;
    }

    public void setAdStatus(Integer adStatus) {
        this.adStatus = adStatus;
    }

    public String getAdUrl() {
        return adUrl;
    }

    public void setAdUrl(String adUrl) {
        this.adUrl = adUrl;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

    
}