package com.stone.site.controller;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.site.mapper.TNavigationRecordMapper;
import com.stone.site.model.TNavigationRecord;
import com.stone.site.service.INavigationService;


@Controller
public class NavigationController extends BaseController{
	
	@Resource(name = "navigationServiceImpl")
	private INavigationService navigationService;
	
	@RequestMapping(value = "adm/navi_record_add")
	public String add(HttpServletResponse rps, TNavigationRecord record) throws Exception {
		navigationService.add(record);
		return "redirect:navi_record_list.do?parentId="+record.getParentId();
	}
	
	@RequestMapping(value = "adm/navi_record_list")
	public ModelAndView list(HttpServletRequest rqs,  int parentId) throws BusinessException {
		TNavigationRecordMapper nrm = this.getMybatisBaseService().getMapper(TNavigationRecordMapper.class);
		List<TNavigationRecord> list = nrm.selectListByParentId(parentId);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/nav/navigation_list");   
	    mav.addObject("parentId",parentId);
	    mav.addObject("list", list);
	    return mav;
	}
	
	@RequestMapping(value = "adm/navi_record_find_edit")
	public ModelAndView get4Edit(HttpServletRequest rqs, int recordId) throws BusinessException {
		TNavigationRecordMapper nrm = this.getMybatisBaseService().getMapper(TNavigationRecordMapper.class);
		TNavigationRecord record = nrm.selectByPrimaryKey(recordId);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/admin/nav/navigation_edit");   
	    mav.addObject("record", record);
	    return mav;
	}
	@RequestMapping(value = "adm/navi_record_update")
	public String update(HttpServletResponse rps, TNavigationRecord record) throws Exception {
		navigationService.update(record);
		return "redirect:navi_record_list.do?parentId="+record.getParentId();
	}
	
	@RequestMapping(value = "adm/navi_record_del")
	public String delete(HttpServletResponse rps, int recordId, int parentId) throws BusinessException, IOException {
		TNavigationRecordMapper nrm = this.getMybatisBaseService().getMapper(TNavigationRecordMapper.class);
		nrm.deleteByPrimaryKey(recordId);
		return "redirect:navi_record_list.do?parentId="+parentId;
	}
	
}
