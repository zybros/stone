package com.stone.search.base.model.product;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Version;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

@Document(indexName= "jinlh", type= "product")
    public class ProductDoc implements Serializable{
        /**
    	 */
    	private static final long serialVersionUID = 1L;

    	@Id
        private Integer id;
    	@Field(type = FieldType.Integer)
        private Integer shopId;
    	@Field(type = FieldType.String)
        private String shopName;
    	@Field(type = FieldType.Integer)
        private Integer cid;
        private int brandId;

        @Field(type = FieldType.String)
        private String title;

        @Field(type = FieldType.Double)
        private Float price;
        @Field(type = FieldType.Double)
        private float discountPrice;
        @Field(type = FieldType.String)
        private String imgs;
        @Field(type = FieldType.String)
        private String time;
        @Field(type = FieldType.Integer)
        private Integer status;

        /**
         * t_product.type (0锛氭櫘閫�1锛氬洟璐� 2锛氭姠璐�
         * @ibatorgenerated 2015-05-29 09:07:39
         */
        private Integer type;

        private String no;
        
        @Version
        private Long version;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getShopId() {
			return shopId;
		}

		public void setShopId(Integer shopId) {
			this.shopId = shopId;
		}

		public Integer getCid() {
			return cid;
		}

		public void setCid(Integer cid) {
			this.cid = cid;
		}

		public int getBrandId() {
			return brandId;
		}

		public void setBrandId(int brandId) {
			this.brandId = brandId;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public Float getPrice() {
			return price;
		}

		public void setPrice(Float price) {
			this.price = price;
		}

		public float getDiscountPrice() {
			return discountPrice;
		}

		public void setDiscountPrice(float discountPrice) {
			this.discountPrice = discountPrice;
		}

		public String getImgs() {
			return imgs;
		}

		public void setImgs(String imgs) {
			this.imgs = imgs;
		}

		public String getTime() {
			return time;
		}

		public void setTime(String time) {
			this.time = time;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public Integer getType() {
			return type;
		}

		public void setType(Integer type) {
			this.type = type;
		}

		public String getNo() {
			return no;
		}

		public void setNo(String no) {
			this.no = no;
		}

		public Long getVersion() {
			return version;
		}

		public void setVersion(Long version) {
			this.version = version;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public String getShopName() {
			return shopName;
		}

		public void setShopName(String shopName) {
			this.shopName = shopName;
		}
       


    }