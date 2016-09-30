package com.stone.product.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.stone.shop.model.TShop;

public class Product implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	  /**
     * t_product.id
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Integer id;

    /**
     * t_product.shop_id
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Integer shopId;

    /**
     * t_product.category_id (商品类别)
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Integer cid;
    
    private int brandId;

    /**
     * t_product.title
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private String title;

    /**
     * t_product.price
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Float price;
    
    private float discountPrice;

    /**
     * t_product.imgs (商品图片 英文分号 ; 分割   )
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private String imgs;

    /**
     * t_product.time
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Date time;

    /**
     * t_product.status (1：上架 2：下架)
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Integer status;

    /**
     * t_product.type (0：普通 1：团购  2：抢购)
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private Integer type;

    /**
     * t_product.introduction (商品编号)
     * @ibatorgenerated 2015-05-29 09:07:39
     */
    private String no;
    
    
    private List<TProductSku> skuList = new ArrayList<TProductSku> ();
    
    private List<ProductExtend> extList = new ArrayList<ProductExtend> ();
    
    private List<String> imgList = new ArrayList<String>();
    
    private TShop shop;

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

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
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

	public List<ProductExtend> getExtList() {
		return extList;
	}

	public void setExtList(List<ProductExtend> extList) {
		this.extList = extList;
	}

	public List<TProductSku> getSkuList() {
		return skuList;
	}

	public void setSkuList(List<TProductSku> skuList) {
		this.skuList = skuList;
	}

	public TShop getShop() {
		return shop;
	}

	public void setShop(TShop shop) {
		this.shop = shop;
	}

	public List<String> getImgList() {
		
		String[] arr =  this.imgs.split(";"	);
		imgList = Arrays.asList(arr);
		
		return imgList;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public float getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(float discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	
	


}