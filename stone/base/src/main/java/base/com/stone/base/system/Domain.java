package com.stone.base.system;

import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**子系统域名**/
public final class Domain {
	
	protected static final Log log = LogFactory.getLog(Domain.class);
	
	public static String portal = "http://localhost/portal";
	
	public static String member = "http://localhost/member";
	
	public static String manage = "http://localhost/manage";
	
	public static String user = "http://localhost/user";
	
	public static String item = "http://localhost/item";
	
	public static String order = "http://localhost/item";
	
	
	static{
        loads();
    }
    synchronized static public void loads(){
            InputStream is = SystemConstants.class.getResourceAsStream("/com/stone/base/config/system-constant.properties");
            Properties sc = new Properties();
            try {
            	sc.load(is);
            	
            	/***************    Domain    **************/
            	Domain.portal = sc.getProperty("Domain.portal").toString();
            	Domain.member = sc.getProperty("Domain.member").toString();
            	Domain.manage = sc.getProperty("Domain.manage").toString();
            	Domain.item = sc.getProperty("Domain.item").toString();
            	
                    
            }
            catch (Exception e) {
                log.warn("不能读取属性文件. " + "请确保system-constant.properties在CLASSPATH指定的路径中");
            }
    }

}
