package com.stone.site.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class TNavigationRecord implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -184789819708902908L;

	/**
     * t_navigation_record.RECORD_ID
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer recordId;

    /**
     * t_navigation_record.PARENT_ID (父级导航id)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer parentId;

    /**
     * t_navigation_record.TYPE (导航类型：1 纵向  2 横向)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer type;

    /**
     * t_navigation_record.ORDER (显示顺序)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer order;

    /**
     * t_navigation_record.STATUS (状态： 1 启用 2禁用)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer status;

    private List<TNavigationField> fieldList = new ArrayList<TNavigationField>();
    
    private List<TNavigationRecord> sublist = new ArrayList<TNavigationRecord>();
    
    private String fieldNamesStr;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

	public List<TNavigationField> getFieldList() {
		return fieldList;
	}

	public void setFieldList(List<TNavigationField> fieldList) {
		this.fieldList = fieldList;
	}
	
	

	public List<TNavigationRecord> getSublist() {
		return sublist;
	}

	public void setSublist(List<TNavigationRecord> sublist) {
		this.sublist = sublist;
	}

	public void setFieldNamesStr(String fieldNamesStr) {
		this.fieldNamesStr = fieldNamesStr;
	}

	public String getFieldNamesStr() {
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<fieldList.size();i++){
			if(i!=0){
				sb.append(" | ");
			}
			sb.append(fieldList.get(i).getName());
		}
		return sb.toString();
	}


	/**
	 * 导航类型
	 * @author stone
	 *
	 */
	public static class Type{
    	/**
    	 * 纵向
    	 */
    	public static final int column = 1;
    	/**
    	 * 横向
    	 */
    	public static final int row = 2;
    }

   
}