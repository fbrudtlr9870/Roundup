package com.proj.rup.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.MemberDetails;

@Service
public class MemberDetailsService implements UserDetailsService {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDAO memberDAO;
		
	
	@Override
	public MemberDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		
		logger.info("username="+username);

		Map<String,Object> member = memberDAO.selectConnectMember(username);
		logger.info(member.toString());
		
		if(member ==null)throw new UsernameNotFoundException(username);
		
		
		
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(member.get("AUTHORITY").toString()));
		
		return  new MemberDetails(member.get("USERNAME").toString(), member.get("PASSWORD").toString(), true, true, true, true, auth,member.get("MEMBER_NAME").toString());
	}


}
