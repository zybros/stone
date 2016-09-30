package com.stone.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.controller.BaseController;
import com.stone.base.exception.BusinessException;
import com.stone.user.mapper.TUserAddressMapper;
import com.stone.user.model.TUserAddress;
import com.stone.user.service.IUserAddressService;

@Controller
public class UserAddressController extends BaseController {

	private static final Logger log = Logger.getLogger(UserAddressController.class);

	@Resource(name = "userAddressServiceImpl")
	private IUserAddressService userAddressService;
	
	@RequestMapping(value = "/use/user_addr_add")
	public String register(HttpServletRequest rqs,HttpServletResponse rps, TUserAddress addr) throws Exception {
		addr.setUserId(this.getCurrentUserId(rqs));
		this.userAddressService.add(addr);
		rps.sendRedirect("user_addr_list.do");
		return null;
	}


	@RequestMapping(value = "/use/user_addr_del")
	public String logout(HttpServletResponse rps, TUserAddress addr) throws Exception {
		TUserAddressMapper uam = this.getMybatisBaseService().getMapper(TUserAddressMapper.class);
		uam.deleteByPrimaryKey(addr.getId());
		rps.sendRedirect("user_addr_list.do");
		return null;
	}

	@RequestMapping(value = "/use/user_addr_update")
	public String updateUser(HttpServletRequest rqs, HttpServletResponse rps, TUserAddress addr) throws Exception {
		addr.setUserId(this.getCurrentUserId(rqs));
		this.userAddressService.update(addr);
		rps.sendRedirect("user_addr_list.do");
		return null;
	}

	@RequestMapping(value = "/use/user_addr_find")
	public ModelAndView findUser(HttpServletRequest rqs, TUserAddress addr) throws Exception {
		TUserAddressMapper uam = this.getMybatisBaseService().getMapper(TUserAddressMapper.class);
		addr = uam.selectByPrimaryKey(addr.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/user_addr_edit");
		mav.addObject("addr", addr);
		return mav;
	}

	@RequestMapping(value = "/use/user_addr_list")
	public ModelAndView list(HttpServletRequest rqs,TUserAddress addr) throws BusinessException {
		TUserAddressMapper uam = this.getMybatisBaseService().getMapper(TUserAddressMapper.class);
		addr.setUserId(this.getCurrentUserId(rqs));
		List<TUserAddress> addrList = uam.selectList(addr);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/user_addr_list");
		mav.addObject("addrList", addrList);
		return mav;
	}


}
