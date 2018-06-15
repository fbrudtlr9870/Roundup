package com.proj.rup.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.service.MemberService;

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

}
