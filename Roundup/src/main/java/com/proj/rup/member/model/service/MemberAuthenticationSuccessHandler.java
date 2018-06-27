package com.proj.rup.member.model.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.Member;

public class MemberAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("성공");
		System.out.println("auth="+authentication);
		
		request.getRequestDispatcher("/").forward(request, response);

	}

}
