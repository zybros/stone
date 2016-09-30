package com.stone.order.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TOrder implements Serializable {
    private Long orderId;

    private Long groupId;

    private Integer userId;

    private String username;

    private String orderNum;

    private Integer payment;

    private Integer payPlatform;

    private Float orderSum;

    private Float shipFee;

    private Integer isPaid;

    private Integer status;

    private Integer paymentCase;

    private Integer distriId;

    private Integer deliveryMethod;

    private String paymentNo;

    private String orderTime;

    private String payTime;

    private String depositTime;

    private String successTime;

    private String updateTime;

    private Integer srvType;

    private Integer isDeleted;

    private Integer isDisplay;

    private Integer orderType;
    
    private String notes;
    
    private Integer shopId;
    
    private String shopName;
    
    
    private TOrderExtra extra;
    
    
    private List<TOrderDetail> details;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getPayment() {
        return payment;
    }

    public void setPayment(Integer payment) {
        this.payment = payment;
    }

    public Integer getPayPlatform() {
        return payPlatform;
    }

    public void setPayPlatform(Integer payPlatform) {
        this.payPlatform = payPlatform;
    }

    public Float getOrderSum() {
        return orderSum;
    }

    public void setOrderSum(Float orderSum) {
        this.orderSum = orderSum;
    }

    public Float getShipFee() {
        return shipFee;
    }

    public void setShipFee(Float shipFee) {
        this.shipFee = shipFee;
    }

    public Integer getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Integer isPaid) {
        this.isPaid = isPaid;
    }


    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPaymentCase() {
        return paymentCase;
    }

    public void setPaymentCase(Integer paymentCase) {
        this.paymentCase = paymentCase;
    }

    public Integer getDistriId() {
        return distriId;
    }

    public void setDistriId(Integer distriId) {
        this.distriId = distriId;
    }

    public Integer getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(Integer deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public String getPaymentNo() {
        return paymentNo;
    }

    public void setPaymentNo(String paymentNo) {
        this.paymentNo = paymentNo;
    }


    public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public String getDepositTime() {
		return depositTime;
	}

	public void setDepositTime(String depositTime) {
		this.depositTime = depositTime;
	}

	public String getSuccessTime() {
		return successTime;
	}

	public void setSuccessTime(String successTime) {
		this.successTime = successTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getSrvType() {
        return srvType;
    }

    public void setSrvType(Integer srvType) {
        this.srvType = srvType;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(Integer isDisplay) {
        this.isDisplay = isDisplay;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }
    
    
    
    
    public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public TOrderExtra getExtra() {
		return extra;
	}

	public void setExtra(TOrderExtra extra) {
		this.extra = extra;
	}

	


	




	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public List<TOrderDetail> getDetails() {
		return details;
	}

	public void setDetails(List<TOrderDetail> details) {
		this.details = details;
	}




	
	/**
	 * 支付方式：1: 在线支付；2: 货到付款；3: 线下转账',
	 * @author stone
	 *
	 */
	public static class Payment{
    	
    	public static final int online = 1;
    	public static final int cashOnDelivery = 2;
    	public static final int offline = 3;
    }
	
	
	/**
	 * 支付平台：1: 支付宝 2：微信  3：快钱  4：工商银行; 5: 建设银行; 5: 农业银行
	 * @author stone
	 *
	 */
	public static class PayPlatment{
    	
    	public static final int alipay = 1;
    	public static final int weixinPay = 2;
    	public static final int kuaiQian = 3;
    	public static final int icbc = 4;
    	public static final int ccb = 5;
    	public static final int abc = 6;
    }
	
	/**
	 * 付款状态
	 * 未付款(待付款)=1;已付款(付款成功)=2;待退款=3;退款成功=4;退款失败=5;撤销成功=6;撤销失败=7;关闭=8;
	 * @author stone
	 *
	 */
	public static class Paid{
    	/**
    	 * 待付款(等待买家付款)=1
    	 */
    	public static final int wfk = 1;
    	/**
    	 * 已付款(等待卖家发货)=2
    	 */
    	public static final int yfk = 2;
    	/**
    	 * 待退款=3
    	 */
    	public static final int dtk = 3;
    	/**
    	 * 退款成功=4
    	 */
    	public static final int tkcg = 4;
    	/**
    	 * 退款失败=5
    	 */
    	public static final int tksb = 5;
    	/**
    	 * 撤销成功=6
    	 */
    	public static final int cxcg = 6;
    	/**
    	 * 撤销失败=7
    	 */
    	public static final int cxsb = 7;
    	/**
    	 * 关闭=8
    	 */
    	public static final int gb = 8;
    }

	
	/**
	 * 物流状态
	 * @author stone
	 * 待卖家发货=1,卖家已发货=2,买家已收货=3,退货-待买家发货=4,退货-买家已发货=5,退货-卖家已收货=6, 关闭=7
	 */
	public static class Status{
    	/**
    	 * 待卖家发货
    	 */
    	public static final int dfh = 1;
    	/**
    	 * 卖家已发货
    	 */
    	public static final int yfh = 2;
    	/**
    	 * 买家已收货
    	 */
    	public static final int ysh = 3;
    	/**
    	 * 退货-待买家发货
    	 */
    	public static final int dfh2 = 4;
    	/**
    	 * 退货-买家已发货
    	 */
    	public static final int yfh2 = 5;
    	/**
    	 * 退货-卖家已收货
    	 */
    	public static final int ysh2 = 6;
    	/**
    	 * 取消
    	 */
    	public static final int cancel = 7;
    	/**
    	 * 关闭
    	 */
    	public static final int close = 8;
    	
    	/**
    	 * 完成
    	 */
    	public static final int finish = 9;
    }
	
	/**
	 * 业务类型
	 * @author stone
	 *
	 */
	public static class ServiceType{
    	/**
    	 * 普通
    	 */
    	public static final int common = 1;
    	/**
    	 * 团购
    	 */
    	public static final int group = 2;
    	/**
    	 * 描述
    	 */
    	public static final int seckill = 3;
    }
	
	/**
	 * 订单类型
	 * @author stone
	 *
	 */
	public static class Type{
    	/**
    	 * 普通
    	 */
    	public static final int user = 1;
    	/**
    	 * 后台
    	 */
    	public static final int admin = 2;
    }
	
	
}