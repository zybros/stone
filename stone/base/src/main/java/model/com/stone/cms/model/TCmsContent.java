package com.stone.cms.model;

import java.io.Serializable;
import java.util.Date;

public class TCmsContent implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * t_cms_content.ID
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Integer id;

    /**
     * t_cms_content.TITLE (文章标题)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private String title;

    /**
     * t_cms_content.KEYWORDS (关键字 用英文分号隔开    )
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private String keywords;

    /**
     * t_cms_content.CATEGORY_ID (内容所属类别)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Integer categoryId;

    /**
     * t_cms_content.FROM (来源  如： 自发   或   其他***网站转载)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private String from;

    /**
     * t_cms_content.STATUS (1：显示   2：隐藏)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Integer status;

    /**
     * t_cms_content.ADMIN_ID (发布人)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Integer adminId;

    /**
     * t_cms_content.CREATE_TIME (创建时间)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Date createTime;

    /**
     * t_cms_content.UPDATE_TIME (更新时间)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private Date updateTime;

    /**
     * t_cms_content.CONTENT (文章内容)
     * @ibatorgenerated 2015-12-20 10:20:11
     */
    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}