package com.stone.site.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.site.mapper.TNavigationRecordMapper;
import com.stone.site.model.TNavigationRecord;


@Controller
public class NavigationController extends BaseController{
	
	
	
	@RequestMapping(value = "navi_index")
	public ModelAndView navi_index(TNavigationRecord record) throws BusinessException {
		TNavigationRecordMapper nrm = this.getMybatisBaseService().getMapper(TNavigationRecordMapper.class);
		record.setType(TNavigationRecord.Type.row);
		List<TNavigationRecord> rowList = nrm.selectAsTree(record);
		record.setType(TNavigationRecord.Type.column);
		List<TNavigationRecord> columnList = nrm.selectAsTree(record);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/navigation_index");   
	    mav.addObject("rowList", rowList);
	    mav.addObject("columnList", columnList);
	    mav.addObject("nav", 0);
	    return mav;
	}
	@RequestMapping(value = "navi_list")
	public ModelAndView navi_list(TNavigationRecord record,int nav) throws BusinessException {
		TNavigationRecordMapper nrm = this.getMybatisBaseService().getMapper(TNavigationRecordMapper.class);
		record.setType(TNavigationRecord.Type.row);
		List<TNavigationRecord> rowList = nrm.selectAsTree(record);
		record.setType(TNavigationRecord.Type.column);
		List<TNavigationRecord> columnList = nrm.selectAsTree(record);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/navigation_list");   
	    mav.addObject("rowList", rowList);
	    mav.addObject("columnList", columnList);
	    mav.addObject("nav", nav);
	    return mav;
	}
	
	
}
