package com.proj.rup.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Component;

import com.proj.rup.member.model.vo.MemberDetails;

@Component
public class SessionDestoryListener implements ApplicationListener<SessionDestroyedEvent> {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		
		List<SecurityContext> contexts = event.getSecurityContexts();
        if (!contexts.isEmpty()) {
            for (SecurityContext ctx : contexts) {
                // 로그아웃 된 유저정보
                MemberDetails member =  (MemberDetails) ctx.getAuthentication().getPrincipal();               
  
                // 로그아웃  DB delete처리
                int result = sqlSession.delete("member.deleteConnect",member.getUsername());
    
            }
        }
        System.out.println("삭제완료");
	}

}
