package com.stone.pay.model;
/**
 * 微信支付数据对象
 * @author stone
 * 
 * 微信开发着文档
 * http://pay.weixin.qq.com/wiki/doc/api/index.php?chapter=9_1
 */
public class WeiXinPayDO {
	/**
	 * 应用密钥
	 */
	String appSecret = "073c8093829b607e550035b270514bc1";
	/**
	 * 公众账号ID
	 */
	String appid = "wxa9ca5f64afefa0f1";
	/**
	 * 商户号
	 */
	String mch_id = "1900000109";
	/**
	 * 随机字符串
	 */
	String nonce_str = "";
	/**
	 * 签名
	 */
	String sign = "";
	/**
	 * 商品描述
	 */
	String body = "";
	/**
	 * 商户订单号
	 */
	String out_trade_no = "";
	/**
	 * 总金额 
	 */
	int total_fee  = 0;
	/**
	 * 终端IP 
	 */
	String spbill_create_ip = "";
	/**
	 * 通知地址
	 */
	String notify_url  = "www.veryfine.cn";
	/**
	 * 交易类型
	 */
	String trade_type = "NATIVE";
	
	
	public String getAppSecret() {
		return appSecret;
	}
	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public int getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	public String getNotify_url() {
		return notify_url;
	}
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	
	
	
}
