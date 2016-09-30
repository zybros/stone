package com.stone.html.thread;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.stone.base.controller.BaseController;
import com.stone.base.service.IMybatisBaseService;
import com.stone.base.system.FilePath;
import com.stone.base.system.SystemConstants;
import com.stone.cms.mapper.TCmsContentMapper;
import com.stone.cms.model.TCmsContent;
import com.stone.util.FreeMarker2Html;

@Scope(BeanDefinition.SCOPE_SINGLETON)
@Service("cmsContentHtmlThread" )
public class CmsContentHtmlThread implements Runnable{
	
	protected static final Logger log = Logger.getLogger(CmsContentHtmlThread.class);
	
	@Resource(name = "mybatisBaseService")
	private IMybatisBaseService mybatisBaseService;
	
	private final FreeMarker2Html html = new FreeMarker2Html();
	
	@SuppressWarnings("unchecked")
	public void run() {
		log.info("************************     contentHtmlThread    **********************************");
		try {
			TCmsContentMapper ccm = this.mybatisBaseService.getMapper(TCmsContentMapper.class);
			List<TCmsContent> list = ccm.selectList(null);
			for(TCmsContent content : list){
				Map<String,Object> m = new HashMap<String,Object>();
				m.put("content",content);
				String name = content.getId()+"_content.html";
				html.createHtmlFile("/template","content.ftl",m,FilePath.cmsHtml,name);
				log.info("***** html path: "+FilePath.cmsHtml+name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.info("************************     定时静态化cms content信息完成    **********************************");
	}
}