package com.stone.ad.model;

import java.io.Serializable;

public class TAdOwner implements Serializable {
    /**
     * t_ad_owner.ID (主键)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer id;

    /**
     * t_ad_owner.LINK_MAN (联系人)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String linkMan;

    /**
     * t_ad_owner.PHONE (联系人电话)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String phone;

    /**
     * t_ad_owner.EMAIL (联系邮箱)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String email;

    /**
     * t_ad_owner.TYPE (1：公司  2：个人)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer type;

    /**
     * t_ad_owner.ADDRESS (地址)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String address;

    /**
     * t_ad_owner.COMPANY_NAME (公司名称)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String companyName;

    /**
     * t_ad_owner.COMPANY_SITE (公司站点)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String companySite;

    /**
     * t_ad_owner.OFFICE_PHONE (公司电话)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private String officePhone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

   

    public String getCompanySite() {
		return companySite;
	}

	public void setCompanySite(String companySite) {
		this.companySite = companySite;
	}

	public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }
}