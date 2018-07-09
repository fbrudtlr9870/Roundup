package com.proj.rup.manager.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.freeboard.model.service.freeBoardService;
import com.proj.rup.freeboard.model.service.freeBoardServiceImpl;
import com.proj.rup.manager.model.service.ManagerService;
import com.proj.rup.manager.model.service.ManagerServiceImpl;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.member.model.vo.MemberDetails;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;
import com.proj.rup.product.model.service.ProductService;
import com.proj.rup.product.model.service.ProductServiceImpl;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;
import com.proj.rup.purchase.model.vo.PurchaseCancel;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private freeBoardService freeboardService= new freeBoardServiceImpl();
	@Autowired
	ProductService productService = new ProductServiceImpl();
	@Autowired
	ManagerService managerService = new ManagerServiceImpl();
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@RequestMapping("/manager/managerPage.do")
	public ModelAndView member() {
		if(logger.isDebugEnabled()) logger.debug("관리자페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("manager/managetInfo");
		return mav;
		
	}
	
	@RequestMapping("/manager/managerView.do")
	public ModelAndView managerView(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("member_id@myPage.do:"+member_id);
		Member m = managerService.selectOneMember(member_id);
		System.out.println("member@myPage:"+m);
		MemberAddress ma = purchaseService.selectMemberInfo(member_id);
		//List<PurchaseComplete> pc = purchaseService.selectPCList(memberId);
		//logger.debug("purchaseComplete@memberController pc:"+pc);
		
		mav.addObject("member",m);
		mav.addObject("memberAddress",ma);
		//mav.addObject("purchaseComplete",pc);
		mav.setViewName("manager/managerView");

		return mav;
	}
	


	
	
	@RequestMapping("/manager/memberManagement.do")
	public ModelAndView memberManagement(@RequestParam(value="cPage", 
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
		mav.setViewName("/manager/memberManagement");
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping("/manager/deletedMember.do")
	public ModelAndView deletedMember(@RequestParam(value="cPage", 
											  required=false, 
											  defaultValue="1") 
											  int cPage) {
		if(logger.isDebugEnabled()) logger.debug("회원관리페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = managerService.selectDeletedListMember(cPage, numPerPage);
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/manager/deletedMember");
		return mav;
		
	}
	
	@RequestMapping("/manager/managerPurchaseComplete.do")
	public ModelAndView managerPurchaseComplete(@RequestParam(value="cPage", 
													  required=false, 
													  defaultValue="1") 
													  int cPage) {
		if(logger.isDebugEnabled()) logger.debug("결제완료목록 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 7;
		
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = purchaseService.selectAPCList(cPage, numPerPage);
				
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = purchaseService.selectTotalPurchase();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/manager/managerPurchaseComplete");
		
		
		
		/*ModelAndView mav = new ModelAndView();
		List<PurchaseComplete> pc = purchaseService.selectAPCList();
		mav.addObject("completeList",pc);
		mav.setViewName("manager/managerPurchaseComplete");*/
 
		return mav;
	}
	
	
	@RequestMapping("/manager/managerPurchaseCancel.do")
	public ModelAndView managerPurchaseCancel(@RequestParam(value="cPage", 
			  required=false, 
			  defaultValue="1") 
		int cPage) {if(logger.isDebugEnabled()) logger.debug("결제완료목록 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 7;
		
		//1. 현재페이지 컨텐츠 구하기
		List<PurchaseCancel> list = purchaseService.selectAPCancelList(cPage, numPerPage);
		
						
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = purchaseService.selectTotalCancel();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/manager/managerPurchaseCancel");
 
		return mav;
	}
	
	
	@RequestMapping("/product/allProductList.do")
	public ModelAndView allProductList(@RequestParam(value="cPage", 
			  required=false, 
			  defaultValue="1") 
			  int cPage) {
		ModelAndView mav = new ModelAndView();
		
		int numPerPage = 7;
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = productService.selectAllProductList(cPage, numPerPage);
						
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = productService.selectTotalProduct();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/product/allProductList");

		return mav;
	}
	
	@RequestMapping("/manager/managerQuestion.do")
	public ModelAndView managerQuestion(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage){
			
			ModelAndView mav = new ModelAndView();
			
			//Rowbounds 처리를 위해 offset, limit 값 필요
			int numPerPage = 10; //=> limit
			
			List<Question> list = managerService.selectQuestionList(cPage,numPerPage);
			logger.debug("list@memberController="+list);
			
			//2. 페이지바처리를 위한 전체컨텐츠 수 구하기
			int pcount = managerService.selectQuestionListCount();
				
			mav.addObject("count", pcount);
			mav.addObject("numPerPage", numPerPage);
			mav.addObject("list", list);
			mav.setViewName("manager/managerQuestionList");
			return mav;
		}
		@RequestMapping("/manager/managerQuestionView.do")
		public ModelAndView managerQuestionView(@RequestParam(value="no") int no){
			ModelAndView mav = new ModelAndView();
			
			Question question = managerService.selectQuestion(no);
			
			mav.addObject("question",question);
			return mav;
		}
		@RequestMapping("/manager/insertQuestion.do")
		public ModelAndView insertQuestion(@RequestParam(value="member_id")String member_id,
				@RequestParam(value="question_no")String question_no){		
			
			ModelAndView mav = new ModelAndView();
			
			//유저의 인증세션 값 가져오기
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
			MemberDetails member = (MemberDetails) authentication.getPrincipal();
			int result =freeboardService.deleteuploadPhoto(member.getUsername());
			
			mav.addObject("member_id",member_id);
			mav.addObject("question_no",question_no);
			mav.setViewName("manager/insertQuestion");
			return mav;
		}
		@RequestMapping(value="/manager/insertEndQuestion.do",method=RequestMethod.POST, headers = ("content-type=multipart/*"))
		public ModelAndView insertEndQuestion(@RequestParam(value="boardTitle")String boardTitle,
				 @RequestParam(value="memberId")String memberId,
				 @RequestParam(value="adminId")String adminId,
				 @RequestParam(value="question_no")String question_no,
				 @RequestParam(value="smarteditor")String boardComment,
				 HttpServletRequest request){

				Question question = new Question();
				question.setQuestion_title(boardTitle);
				question.setMember_id(memberId);
				question.setQuestion_comment(boardComment);
				question.setAdmin_id(adminId);
				
				
				//upload테이블에서 유저가 등록하기 전까지 올린 이미지들 확인
				List<Map<String,Object>> uploadList = freeboardService.uploadList(memberId);
				
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
				
				
				int result = managerService.insertBoard(question);
				logger.debug("게시물 등록 성공");
				
				//겹친 리스트만 free_board_file테이블에 넣음(후에 게시물삭제시 삭제하기 위한 용도)
				for(int i=0; i<uploadChk.size(); i++){
				QuestionFile fbf = new QuestionFile(question.getQuestion_no(), uploadChk.get(i));
				int res = managerService.insertFile(fbf);
				}
				
				//볼일없으니 삭제
				int re = managerService.deleteQuestion(question_no);
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("msg", "등록 완료");
				mav.addObject("loc", "/manager/managerQuestion.do");
				mav.setViewName("common/msg");
				return mav;
				}
}