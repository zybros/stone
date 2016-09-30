package com.stone.order.model;

import java.io.Serializable;

public class TOrderExtra implements Serializable {
    private Integer extraId;

    private Long orderId;

    private Integer delivery;

    private Integer isConfirm;

    private String receiver;

    private String country;

    private String province;

    private String city;

    private String district;

    private String street;

    private String zipCode;

    private String addr;
    
    private String wholeAddr;

    private String phone;

    private String fixedPhone;

    private String deliveryName;

    private String deliveryNo;

    private String selfCollectSite;

    private Integer selfCollectSiteId;

    private String notes;

    private Integer payable;

    private String company;

    private Integer contents;

    private Integer isPrint;

    public Integer getExtraId() {
        return extraId;
    }

    public void setExtraId(Integer extraId) {
        this.extraId = extraId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Integer getDelivery() {
        return delivery;
    }

    public void setDelivery(Integer delivery) {
        this.delivery = delivery;
    }

    public Integer getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(Integer isConfirm) {
        this.isConfirm = isConfirm;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
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

    public String getDeliveryName() {
        return deliveryName;
    }

    public void setDeliveryName(String deliveryName) {
        this.deliveryName = deliveryName;
    }

    public String getDeliveryNo() {
        return deliveryNo;
    }

    public void setDeliveryNo(String deliveryNo) {
        this.deliveryNo = deliveryNo;
    }

    public String getSelfCollectSite() {
        return selfCollectSite;
    }

    public void setSelfCollectSite(String selfCollectSite) {
        this.selfCollectSite = selfCollectSite;
    }

    public Integer getSelfCollectSiteId() {
        return selfCollectSiteId;
    }

    public void setSelfCollectSiteId(Integer selfCollectSiteId) {
        this.selfCollectSiteId = selfCollectSiteId;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Integer getPayable() {
        return payable;
    }

    public void setPayable(Integer payable) {
        this.payable = payable;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getContents() {
        return contents;
    }

    public void setContents(Integer contents) {
        this.contents = contents;
    }

    public Integer getIsPrint() {
        return isPrint;
    }

    public void setIsPrint(Integer isPrint) {
        this.isPrint = isPrint;
    }

	public String getWholeAddr() {
		return wholeAddr;
	}

	public void setWholeAddr(String wholeAddr) {
		this.wholeAddr = wholeAddr;
	}
    
    
}