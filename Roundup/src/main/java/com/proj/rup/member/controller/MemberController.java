package com.proj.rup.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.service.MemberService;

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
		if(result>0) msg="회원가입성공!";
		else msg="회원가입실패";
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		
		return "common/msg";
	}

}
