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
import com.proj.rup.freeboard.model.vo.FreeBoardComment;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

@Controller
public class FreeBoardController {

	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private freeBoardService freeboardService = new freeBoardServiceImpl();
	
	//자유게시판 리스트
	@RequestMapping("/freeboard/freeBoardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
	
		ModelAndView mav = new ModelAndView();
		
		//Rowbounds 처리를 위해 offset, limit 값 필요
		int numPerPage = 10; //=> limit
		
		List<FreeBoard> list = freeboardService.selectfreeBoardList(cPage,numPerPage);
		logger.debug("list@freeboardController="+list);
		
		//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
		int pcount = freeboardService.selectfreeBoardListCount();
		
		mav.addObject("count", pcount);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list", list);
		mav.setViewName("freeboard/freeBoardList");
		return mav;
	}
	
	//자유게시판 상세보기
	@RequestMapping("/freeboard/freeBoardView.do")
	public ModelAndView boardView(@RequestParam(value="no") int no){
		ModelAndView mav = new ModelAndView();
		
		//1. 자유게시판 번호에 맞는 값 가져오기
		FreeBoard fboard = freeboardService.selectfreeBoardOne(no);
		
		//2. 자유게시판 번호에 맞는 업로드된 파일조회해서 가져오기
		List<FreeBoardFile> list = freeboardService.selectfreeBoardFileList(no);
		
		//3. 자유게시판 번호에 맞는 댓글리스트 가져오기
		List<FreeBoardComment> listc = freeboardService.selectfreeBoardCommentList(no);
		
		mav.addObject("fboard", fboard);
		mav.addObject("list", list);
		mav.addObject("listc", listc);
		mav.setViewName("freeboard/freeBoardView");
		
		return mav;
	}
	
	
}
