package com.proj.rup.freeboard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.freeboard.model.service.freeBoardService;
import com.proj.rup.freeboard.model.service.freeBoardServiceImpl;
import com.proj.rup.freeboard.model.vo.FreeBoard;

@Controller
public class FreeBoardController {

	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private freeBoardService freeboardList = new freeBoardServiceImpl();
	
	@RequestMapping("/freeboard/freeBoardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
	
		ModelAndView mav = new ModelAndView();
		
		//Rowbounds 처리를 위해 offset, limit 값 필요
		int numPerPage = 10; //=> limit
		
		List<FreeBoard> list = freeboardList.selectfreeBoardList(cPage,numPerPage);
		logger.debug("list@freeboardController="+list);
		
		//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
		int pcount = freeboardList.selectfreeBoardListCount();
		
		mav.addObject("count", pcount);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list", list);
		mav.setViewName("freeboard/freeBoardList");
		return mav;
	}
	
}
