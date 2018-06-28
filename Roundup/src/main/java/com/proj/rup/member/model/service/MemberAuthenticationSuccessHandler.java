package com.proj.rup.member.model.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.MemberDetails;

public class MemberAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberDetails member = (MemberDetails) authentication.getPrincipal();
		
		int result = sqlSession.insert("member.connectMember",member);	
		System.out.println("auth="+authentication);	
		
		request.getRequestDispatcher("/").forward(request, response);

	}

}