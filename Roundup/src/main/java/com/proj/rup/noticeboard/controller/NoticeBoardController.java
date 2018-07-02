package com.proj.rup.noticeboard.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.noticeboard.model.service.NoticeBoardService;
import com.proj.rup.noticeboard.model.service.NoticeBoardServiceImpl;
import com.proj.rup.noticeboard.model.vo.NoticeBoard;
import com.proj.rup.noticeboard.model.vo.NoticeBoardFile;
import com.proj.rup.member.model.vo.MemberDetails;

@Controller
public class NoticeBoardController {

	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private NoticeBoardService noticeboardService = new NoticeBoardServiceImpl();
	
	//자유게시판 리스트
	@RequestMapping("/noticeboard/noticeBoardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
	
		ModelAndView mav = new ModelAndView();
		
		//Rowbounds 처리를 위해 offset, limit 값 필요
		int numPerPage = 10; //=> limit
		
		List<NoticeBoard> list = noticeboardService.selectNoticeBoardList(cPage,numPerPage);
		logger.debug("list@noticeboardController="+list);
		
		//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
		int pcount = noticeboardService.selectNoticeBoardListCount();
			
		mav.addObject("count", pcount);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list", list);
		mav.setViewName("noticeboard/noticeBoardList");
		return mav;
	}
	
	//자유게시판 상세보기
	@RequestMapping("/noticeboard/noticeBoardView.do")
	public ModelAndView boardView(@RequestParam(value="no") int no
							,@RequestParam(value="cPage", required=false, defaultValue="1")int cPage){
		ModelAndView mav = new ModelAndView();
		
		//1. 자유게시판 번호에 맞는 값 가져오기
		NoticeBoard fboard = noticeboardService.selectNoticeBoardOne(no);
		
		//2. 자유게시판 번호에 맞는 업로드된 파일조회해서 가져오기
		List<NoticeBoardFile> list = noticeboardService.selectNoticeBoardFileList(no);
		
		//5. 게시판 리스트
		
		int numPerPage = 10; //=> limit
		
		List<NoticeBoard> blist = noticeboardService.selectNoticeBoardList(cPage,numPerPage);
		logger.debug("list@noticeboardController="+blist);
		
		//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
		int pcount = noticeboardService.selectNoticeBoardListCount();
		
		
		mav.addObject("fboard", fboard);
		mav.addObject("list", list);
		
		mav.addObject("pcount", pcount);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("blist", blist);
		mav.addObject("no",no);
		
		mav.setViewName("noticeboard/noticeBoardView");
		
		return mav;
	}
	
	@RequestMapping("/noticeboard/insertBoard.do")
	public String insertBoard(){		
		/*
		//레벨 종류 찾기 
		List<String> list = noticeboardService.selectLevelKinds();
		System.out.println(list.toString());
		
		//레벨별 orderby한 값 찾기
		List<Map<String,String>>list2 = noticeboardService.selectContent();
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
		
		
		//uploadPhto테이블에 있는 값 다 삭제(초기화) -- db부하 줄이기 위해 들어갈때 지우고 들어가게 처리
		
		//유저의 인증세션 값 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		MemberDetails member = (MemberDetails) authentication.getPrincipal();
		int result =noticeboardService.deleteuploadPhoto(member.getUsername());
		
		return "noticeboard/insertBoard";
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
			
			//유저의 인증세션 값 가져오기
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
			MemberDetails member = (MemberDetails) authentication.getPrincipal();
			
			//실시간 업로드되는 이미지 관리 위해 디비에 넣기
			Map<String,String> map = new HashMap<>();
			map.put("member_id", member.getUsername());
			map.put("renamedFilename", renamedFileName);
			
			int result = noticeboardService.uploadPhoto(map);
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	
	//게시물 등록
	@RequestMapping("/noticeboard/insertEndBoard.do")
	public ModelAndView insertEndBoard(@RequestParam(value="boardTitle")String boardTitle,
								 @RequestParam(value="memberId")String memberId,
								 @RequestParam(value="smarteditor")String boardComment,
								 HttpServletRequest request){
		
		NoticeBoard board = new NoticeBoard();
		board.setnotice_board_title(boardTitle);
		board.setMember_id(memberId);
		board.setnotice_comment(boardComment);
		
		
		//upload테이블에서 유저가 등록하기 전까지 올린 이미지들 확인
		List<Map<String,Object>> uploadList = noticeboardService.uploadList(memberId);
		
		//체크해서 겹치는거만 넣을 리스트
		List<String> uploadChk = new ArrayList<>();
		
		
		String directory = request.getSession().getServletContext().getRealPath("/resources/upload/freeboard/");
		
		//업로드할 comment와 테이블에서 조회한 이미지들 간 겹치는거만 골라내기
		for(int i=0; i<uploadList.size(); i++){
			if(boardComment.contains((String)uploadList.get(i).get("RENAMED_FILENAME"))){
				uploadChk.add((String)uploadList.get(i).get("RENAMED_FILENAME"));
			}else{
				//겹치지 않는 파일 삭제 처리 (겹친거만 살려둬야 게시글 올라갔을 때 이미지를 볼 수 있음)
				File file = new File(directory+uploadList.get(i).get("RENAMED_FILENAME"));
				System.out.println(directory+uploadList.get(i).get("RENAMED_FILENAME"));
				file.delete();
			}
		}
		
		
		int result = noticeboardService.insertBoard(board);
		logger.debug("게시물 등록 성공");
		
		//겹친 리스트만 notice_board_file테이블에 넣음(후에 게시물삭제시 삭제하기 위한 용도)
		for(int i=0; i<uploadChk.size(); i++){
			NoticeBoardFile fbf = new NoticeBoardFile(board.getnotice_board_no(), uploadChk.get(i));
			int res = noticeboardService.insertFile(fbf);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "등록 완료");
		mav.addObject("loc", "/noticeboard/noticeBoardList.do");
		mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("/noticeboard/cancelBoard.do")
	public ModelAndView cancelBoard(){
		
		//유저의 인증세션 값 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		MemberDetails member = (MemberDetails) authentication.getPrincipal();
		
		//uploadPhoto db 내용 비우기
		int result =noticeboardService.deleteuploadPhoto(member.getUsername());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "취소 완료");
		mav.addObject("loc", "/noticeboard/noticeBoardList.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
}
