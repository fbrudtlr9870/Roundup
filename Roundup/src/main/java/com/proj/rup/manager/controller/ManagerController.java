package com.proj.rup.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.manager.model.service.ManagerService;
import com.proj.rup.manager.model.service.ManagerServiceImpl;
import com.proj.rup.member.model.vo.Member;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ManagerService managerService = new ManagerServiceImpl();
	
	@RequestMapping("/manager/managerPage.do")
	public ModelAndView member() {
		if(logger.isDebugEnabled()) logger.debug("회원관리페이지 요청");
		ModelAndView mav = new ModelAndView();
		
		List<Member> list = managerService.selectListMember();
		
		mav.addObject("list", list);
		return mav;
		
	}
}
