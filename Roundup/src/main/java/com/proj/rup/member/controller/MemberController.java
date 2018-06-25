package com.proj.rup.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.member.model.service.MemberService;
import com.proj.rup.member.model.vo.Member;

@SessionAttributes({"memberLoggedIn"})
@Controller
public class MemberController {
	
	private Logger logger = 
			LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberService memberService;
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String MemberEnroll() {
		if(logger.isDebugEnabled())
			logger.debug("회원등록페이지");
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model,
								  @RequestParam(value="sample4_postcode") String postCode,
								  @RequestParam(value="sample4_roadAddress") String road,
								  @RequestParam(value="sample4_jibunAddress") String jibun,
								  @RequestParam(value="sample4_detailAddress") String detail
									) {
		if(logger.isDebugEnabled())
			logger.debug("회원등록처리페이지");
		
		logger.debug(member.toString());
		String rawPassword = member.getMember_password();
		
		/***암호화시작****/
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setMember_password(encodedPassword);
		
		/***암호화끝****/
		
		System.out.println("암호화후 : "+member.getMember_password());
		
		//1.
		/* memberService.insertMember(member);*/

		int result = 0;
		
		if(memberService.insertMember(member) > 0) {
			Map<String,Object> map = new HashMap<>();
			String address = road + "#" + jibun + "#" + detail;
			
			map.put("member_id", member.getMember_id());
			map.put("address", address);
			map.put("zip_code", postCode);
			
			result = memberService.insertAddress(map);
		}
		
		//2. 
		String loc = "/";
		String msg = "";
		if(result>0) msg="회원가입성공";
		else msg="회원가입실패";
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		
		return "common/msg";
	}
	
	
	   @RequestMapping("/member/memberLogin.do")
	   public ModelAndView memberLogin(@RequestParam String member_id,
	                           @RequestParam String member_password) {
	      if(logger.isDebugEnabled())
	         logger.debug("로그인요청");
	      
	      //리턴할 ModelAndView객체생성
	      ModelAndView mav = new ModelAndView();
	      logger.debug(member_id);
	      
	      //1.업무로직
	      Member m = memberService.selectOneMember(member_id);
	      logger.debug(m.toString());
	      
	      String msg = "";
	      String loc = "/";
	      
	      if(m==null) 
	         msg = "존재하지 않는 아이디입니다.";
	      
	      else {
	      if(bcryptPasswordEncoder.matches(member_password, m.getMember_password())) {
	      //if(member_password.equals(m.getMember_password())) {
	         msg = "로그인성공!";
	         
	         /* 토탈관리 시작*/
	         int selectMember = memberService.selectMember(m.getMember_id());
	         if(selectMember ==1) {
	        	 int deleteConnect = memberService.deleteConnect(m.getMember_id());
	         }else {
	        	 int connectMember = memberService.connectMember(m);	        	 
	         }
	         /*토탈 관리 끝*/
	         mav.addObject("memberLoggedIn", m);
	         /*mav.addObject("memberLoggedIn", m);*/
	      }
	      else {
	         msg = "비밀번호가 틀렸습니다.";
	         }
	      }   
	      
	      mav.addObject("msg", msg);
	      mav.addObject("loc", loc);
	      //뷰단 지정
	      mav.setViewName("common/msg");
	      
	      return mav;
	      }
			
	 @RequestMapping("/member/memberLogout.do")
	   public String memberLogout(SessionStatus sessionStatus, HttpSession session) {
	     
		 
		 if(logger.isDebugEnabled())
	         logger.debug("로그아웃요청");
	      
		 /* 딜리트 관련*/
	      if(!sessionStatus.isComplete()) {
	    	  Member m = (Member)session.getAttribute("memberLoggedIn");    	  
	    	  int deleteConnect = memberService.deleteConnect(m.getMember_id());	    	 
	    	  sessionStatus.setComplete();
	      }
	      return "redirect:/";
	   }
	 
	@RequestMapping("member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String,Object> checkIdDuplicate(@RequestParam("member_id") String member_id){
		logger.debug("@ResponseBody-javaObj ajax : "+member_id);
		Map<String,Object> map = new HashMap<String, Object>();
		//업무로직
		int count = memberService.checkIdDuplicate(member_id);
		boolean isUsable = count==0?true:false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}			

	@RequestMapping("/member/myPage.do")
	public ModelAndView memberMypage(@RequestParam(value="member_id") String member_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("member_id@myPage.do:"+member_id);
		Member m = memberService.selectOneMember(member_id);
		System.out.println("member@myPage:"+m);
		
		//List<PurchaseComplete> pc = purchaseService.selectPCList(memberId);
		//logger.debug("purchaseComplete@memberController pc:"+pc);
		
		mav.addObject("member",m);
		//mav.addObject("purchaseComplete",pc);
		mav.setViewName("member/myPage");

		return mav;
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public ModelAndView memberUpdate(Member member){
		if(logger.isDebugEnabled())
			logger.debug("회원정보 수정처리페이지");
		
		ModelAndView mav = new ModelAndView();
		System.out.println(member);
			
		int result = memberService.updateMember(member);
		
		String loc = "/"; 
		String msg = "";
		if(result>0){ 
			msg="회원정보수정성공!";
			mav.addObject("memberLoggedIn", member);
		}
		else msg="회원정보수정실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
		
		return mav;
	}

	@RequestMapping("/member/memberDelete.do")
	public ModelAndView memberDelete(Member member, SessionStatus sessionStatus) {
		if(logger.isDebugEnabled())
			logger.debug("회원정보 삭제 페이지");
		
		ModelAndView mav = new ModelAndView();
		System.out.println(member);
			
		int result = memberService.deleteMember(member);
		
		String loc = "/"; 
		String msg = "";
		if(result>0){ 
			msg="회원정보삭제성공!";
			mav.addObject("memberLoggedIn", member);
			
			if(!sessionStatus.isComplete())
				sessionStatus.setComplete();
		}
		else msg="회원정보삭제실패ㅠ";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
		
		return mav;
	}

}
