package com.proj.rup.freeboard.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		//4. 게시글 별 댓글 수 총합 가져오기
		int count = freeboardService.totalCommentCount(no);
		
		mav.addObject("fboard", fboard);
		mav.addObject("list", list);
		mav.addObject("listc", listc);
		mav.addObject("count", count);
		mav.setViewName("freeboard/freeBoardView");
		
		return mav;
	}
	
	//자유게시판 댓글입력
	@RequestMapping(value="/freeboard/insertComment.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	@ResponseBody
	public Map<String,Object> insertComment(
											@RequestParam(value="member_id")String member_id,
											@RequestParam(value="free_board_no")int free_board_no,
											@RequestParam(value="parent_comment")int parent_comment,
											@RequestParam(value="comment_level")int comment_level,
											@RequestParam(value="comment_content")String comment_content){
		
		
		
		Map<String,Object> map = new HashMap<String, Object>();

		//Map<String,Object> map = new HashMap<String, Object>();
		
		
		FreeBoardComment fbc = 
				new FreeBoardComment(0,"test",free_board_no,parent_comment,comment_content,null,null,comment_level);
		
		logger.debug("fbc="+fbc);
		
		int result = freeboardService.insertComment(fbc);			
		logger.debug("fbc@controller="+fbc);
		
		int count = freeboardService.totalCommentCount(free_board_no);
		
		map.put("fbc", fbc);
		map.put("count", count);
		return map;
	}
}
