package com.proj.rup.freeboard.controller;


import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView boardView(@RequestParam(value="no") int no
							,@RequestParam(value="cPage", required=false, defaultValue="1")int cPage){
		ModelAndView mav = new ModelAndView();
		
		//1. 자유게시판 번호에 맞는 값 가져오기
		FreeBoard fboard = freeboardService.selectfreeBoardOne(no);
		
		//2. 자유게시판 번호에 맞는 업로드된 파일조회해서 가져오기
		List<FreeBoardFile> list = freeboardService.selectfreeBoardFileList(no);

		//3. 자유게시판 번호에 맞는 댓글리스트 가져오기
		List<FreeBoardComment> listc = freeboardService.selectfreeBoardCommentList(no);
		
		//4. 게시글 별 댓글 수 총합 가져오기
		int count = freeboardService.totalCommentCount(no);
		
		//5. 게시판 리스트
		
		int numPerPage = 10; //=> limit
		
		List<FreeBoard> blist = freeboardService.selectfreeBoardList(cPage,numPerPage);
		logger.debug("list@freeboardController="+blist);
		
		//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
		int pcount = freeboardService.selectfreeBoardListCount();
		
		
		mav.addObject("fboard", fboard);
		mav.addObject("list", list);
		mav.addObject("listc", listc);
		mav.addObject("count", count);
		
		mav.addObject("pcount", pcount);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("blist", blist);
		mav.addObject("no",no);
		
		mav.setViewName("freeboard/freeBoardView");
		
		return mav;
	}
	
	//자유게시판 댓글입력
	@RequestMapping(value="/freeboard/insertComment.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	@ResponseBody
	public Map<String,Object> insertComment(
											@RequestParam(value="member_id")String member_id,
											@RequestParam(value="parent_id")String parent_id,
											@RequestParam(value="free_board_no")int free_board_no,
											@RequestParam(value="parent_comment")int parent_comment,
											@RequestParam(value="comment_level")int comment_level,
											@RequestParam(value="comment_content")String comment_content){
		
		
		
		Map<String,Object> map = new HashMap<String, Object>();

		//Map<String,Object> map = new HashMap<String, Object>();
		
		
		FreeBoardComment fbc = 
				new FreeBoardComment(0,member_id,free_board_no,parent_comment,comment_content,null,null,comment_level,parent_id);
		
		logger.debug("fbc="+fbc);
		
		int result = freeboardService.insertComment(fbc);			
		logger.debug("fbc@controller="+fbc);
		
		int count = freeboardService.totalCommentCount(free_board_no);
		
		map.put("fbc", fbc);
		map.put("count", count);
		return map;
	}
	
	@RequestMapping("/freeboard/insertBoard.do")
	public String insertBoard(){		
		/*
		//레벨 종류 찾기 
		List<String> list = freeboardService.selectLevelKinds();
		System.out.println(list.toString());
		
		//레벨별 orderby한 값 찾기
		List<Map<String,String>>list2 = freeboardService.selectContent();
		System.out.println(list2.toString());
		
		//종류개수만큼의 스트링배열 만들기 
		String[] strarr = new String[list.size()];
		
		for(int i=0; i<list.size(); i++){
			for(int j=0; j<list2.size(); j++){
				if(String.valueOf(list2.get(j).get("LEVEL_")).equals(list.get(i))){
					if(strarr[i]==null){
						strarr[i]=String.valueOf(list2.get(j).get("CONTENT_"));
					}else{
						strarr[i]+=","+String.valueOf(list2.get(j).get("CONTENT_"));
					}
				}
			}
			System.out.println(strarr[i]);
		}
		*/	
		return "freeboard/insertBoard";
	}
	
	/*Ajax을 이용한 포토업로드, 폼제출 전 서버에만 올려서 사용자에게 올린 사진을 에디터에서 바로 보여줌*/
	@RequestMapping(value="/freeboard/uploadPhoto.do",method=RequestMethod.POST)
	@ResponseBody
	public String uploadPhoto(HttpServletRequest request){
		
		//파일정보
		StringBuffer sb = new StringBuffer();
		try{
			//원본파일 명
			String originalFileName= request.getHeader("file-name");
			//파일저장 경로
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/freeboard/");
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;
			
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(saveDirectory+renamedFileName);
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			int numRead;
			while((numRead = is.read(b,0,b.length))!=-1){
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			
			//정보 출력
			sb = new StringBuffer();
			sb.append("&NewLine=true")
			  .append("&sFileName=").append(originalFileName)
			  .append("&sFileURL=").append("http://localhost:9090/rup/resources/upload/freeboard/")
			  .append(renamedFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	
	//게시물 등록
	@RequestMapping("/freeboard/insertEndBoard.do")
	public ModelAndView insertEndBoard(@RequestParam(value="boardTitle")String boardTitle,
								 @RequestParam(value="memberId")String memberId,
								 @RequestParam(value="smarteditor")String boardComment){
		
		FreeBoard board = new FreeBoard();
		board.setFree_board_title(boardTitle);
		board.setMember_id(memberId);
		board.setFree_comment(boardComment);
		
		int result = freeboardService.insertBoard(board);
		logger.debug("게시물 등록 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "등록 완료");
		mav.addObject("loc", "/freeboard/freeBoardList.do");
		mav.setViewName("common/msg");
		return mav;
	}
	
}
