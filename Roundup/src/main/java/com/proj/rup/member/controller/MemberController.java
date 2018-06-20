package com.proj.rup.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import java.util.List;

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
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

@SessionAttributes({"memberLoggedIn"})
@Controller
public class MemberController {
	
	private Logger logger = 
			LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String MemberEnroll() {
		if(logger.isDebugEnabled())
			logger.debug("회원등록페이지");
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
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
		int result = memberService.insertMember(member);
		
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
	public String memberLogout(SessionStatus sessionStatus) {
		if(logger.isDebugEnabled())
			logger.debug("로그아웃요청");
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
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
	@RequestMapping("/member/memberView.do")
	public ModelAndView memberView(@RequestParam String member_id) {
		if(logger.isDebugEnabled())
			logger.debug("member_id=");
		
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("member",memberService.selectOneMember(member_id));	
		mav.setViewName("member/memberView");

	@RequestMapping("/member/myPage.do")
	public ModelAndView memberMypage(@RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView();
		System.out.println("memberId@myPage.do:"+memberId);
		Member m = memberService.selectOneMember(memberId);
		System.out.println("member@myPage:"+m);
		
		//List<PurchaseComplete> pc = purchaseService.selectPCList(memberId);
		//logger.debug("purchaseComplete@memberController pc:"+pc);
		
		mav.addObject("member",m);
		//mav.addObject("purchaseComplete",pc);
		mav.setViewName("member/myPage");

		return mav;
	}
}
