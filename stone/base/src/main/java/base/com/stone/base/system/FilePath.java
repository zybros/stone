package com.stone.base.system;

import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**子系统域名**/
public final class FilePath {
	
	protected static final Log log = LogFactory.getLog(FilePath.class);
	
	public static String itemImg = "/home/mnt/files/stone/img/item/";
	public static String itemImgServer = "http://file.jinlh.com/stone/img/item/";
	
	public static String adImg = "/home/mnt/files/stone/img/ad/";
	public static String adImgServer = "http://file.jinlh.com/stone/img/ad/";
	
	public static String baseImg = "/home/mnt/files/stone/img/base/";
	public static String baseImgServer = "http://file.jinlh.com/stone/img/base/";
	
	public static String shopImg = "/home/mnt/files/stone/img/shop/";
	public static String shopImgServer = "http://file.jinlh.com/stone/img/shop/";
	
	public static String tuanImg = "/home/mnt/files/stone/img/tuan/";
	public static String tuanImgServer = "http://file.jinlh.com/stone/img/tuan/";
	
	public static String itemHtml = "/home/mnt/files/stone/html/item/";
	public static String itemHtmlServer = "http://file.jinlh.com/stone/html/item/";
	
	public static String cmsHtml = "/home/mnt/files/stone/html/cms/";
	public static String cmsHtmlServer = "http://file.jinlh.com/stone/html/cms/";
	
	static{
        loads();
    }
    synchronized static public void loads(){
            InputStream is = SystemConstants.class.getResourceAsStream("/com/stone/base/config/system-constant.properties");
            Properties sc = new Properties();
            try {
            	sc.load(is);
            	
            	 /***************    FilePath    **************/
            	FilePath.itemImg = sc.getProperty("FilePath.itemImg").toString();
            	FilePath.itemImgServer = sc.getProperty("FilePath.itemImgServer").toString();
            	
            	FilePath.adImg = sc.getProperty("FilePath.adImg").toString();
            	FilePath.adImgServer = sc.getProperty("FilePath.adImgServer").toString();
            	
            	FilePath.baseImg = sc.getProperty("FilePath.baseImg").toString();
            	FilePath.baseImgServer = sc.getProperty("FilePath.baseImgServer").toString();
            	
            	FilePath.shopImg = sc.getProperty("FilePath.shopImg").toString();
            	FilePath.shopImgServer = sc.getProperty("FilePath.shopImgServer").toString();
            	
            	FilePath.tuanImg = sc.getProperty("FilePath.tuanImg").toString();
            	FilePath.tuanImgServer = sc.getProperty("FilePath.tuanImgServer").toString();
            	
            	FilePath.itemHtml = sc.getProperty("FilePath.itemHtml").toString();
            	FilePath.itemHtmlServer = sc.getProperty("FilePath.itemHtmlServer").toString();
            	
            	FilePath.cmsHtml = sc.getProperty("FilePath.cmsHtml").toString();
            	FilePath.cmsHtmlServer = sc.getProperty("FilePath.cmsHtmlServer").toString();
            	
                    
            }
            catch (Exception e) {
            	log.warn("不能读取属性文件. " + "请确保system-constant.properties在CLASSPATH指定的路径中");
            }
    }

}
