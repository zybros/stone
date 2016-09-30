package com.stone.ad.model;

public class TAdLocationLinkKey {
    /**
     * t_ad_location_link.AD_ID (广告id)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer adId;

    /**
     * t_ad_location_link.LOCATION_ID (广告位id)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer locationId;

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(Integer locationId) {
        this.locationId = locationId;
    }
}