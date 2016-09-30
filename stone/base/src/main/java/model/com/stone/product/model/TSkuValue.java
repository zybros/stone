package com.stone.product.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TSkuValue implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer productId;

    private Integer skuId;

    private Integer templateId;

    private String value;
    
    private String templateName;
    
    private int  valueOrder;
    
    private String values;
    
    private List<String> valueList = new ArrayList<String>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getSkuId() {
        return skuId;
    }

    public void setSkuId(Integer skuId) {
        this.skuId = skuId;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

	public int getValueOrder() {
		return valueOrder;
	}

	public void setValueOrder(int valueOrder) {
		this.valueOrder = valueOrder;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	

	public String getValues() {
		return values;
	}

	public void setValues(String values) {
		this.values = values;
	}

	public List<String> getValueList() {
		String[] arr = values.split(",");
		return Arrays.asList(arr);
	}

     
}