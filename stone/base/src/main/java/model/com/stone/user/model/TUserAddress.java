package com.stone.user.model;

import java.io.Serializable;

public class TUserAddress implements Serializable {
    /**
     * t_user_address.id
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Integer id;

    /**
     * t_user_address.user_id
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Integer userId;

    /**
     * t_user_address.country (国家)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Long country;

    /**
     * t_user_address.province (省)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Long province;

    /**
     * t_user_address.city (地级市)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Long city;

    /**
     * t_user_address.district (区、县)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Long district;

    /**
     * t_user_address.street (街道  乡镇)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Long street;

    /**
     * t_user_address.post_code (邮编)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private String postCode;

    /**
     * t_user_address.address (小区 单元  门牌号)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private String address;

    /**
     * t_user_address.receiver (收件人姓名)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private String receiver;

    /**
     * t_user_address.phone (电话   收件)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private String phone;

    /**
     * t_user_address.fixed_phone (固定电话   收件)
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private String fixedPhone;

    /**
     * t_user_address.is_default (是否默认收货地址： 1：是 )
     * @ibatorgenerated 2015-12-04 19:15:46
     */
    private Integer isDefault;
    
    private String wholeAddr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Long getCountry() {
        return country;
    }

    public void setCountry(Long country) {
        this.country = country;
    }

    public Long getProvince() {
        return province;
    }

    public void setProvince(Long province) {
        this.province = province;
    }

    public Long getCity() {
        return city;
    }

    public void setCity(Long city) {
        this.city = city;
    }

    public Long getDistrict() {
        return district;
    }

    public void setDistrict(Long district) {
        this.district = district;
    }

    public Long getStreet() {
        return street;
    }

    public void setStreet(Long street) {
        this.street = street;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFixedPhone() {
        return fixedPhone;
    }

    public void setFixedPhone(String fixedPhone) {
        this.fixedPhone = fixedPhone;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

	public String getWholeAddr() {
		return wholeAddr;
	}

	public void setWholeAddr(String wholeAddr) {
		this.wholeAddr = wholeAddr;
	}
    
    
}