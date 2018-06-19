package com.proj.rup.manager.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.manager.model.service.ManagerService;
import com.proj.rup.manager.model.service.ManagerServiceImpl;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ManagerService managerService = new ManagerServiceImpl();
	
	@RequestMapping("/manager/managerPage.do")
	public ModelAndView member(@RequestParam(value="cPage", 
											  required=false, 
											  defaultValue="1") 
											  int cPage) {
		if(logger.isDebugEnabled()) logger.debug("회원관리페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = managerService.selectListMember(cPage, numPerPage);
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		
		return mav;
		
	}
}
