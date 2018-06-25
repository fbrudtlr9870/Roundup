package com.proj.rup.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.MemberDetails;

@Service
public class MemberDetailsService implements UserDetailsService {

	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		Member member = memberDAO.selectOneMember(username);
		
		if(member ==null) throw new UsernameNotFoundException(username);
		
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(member.getAutority().toString()));
		
		return new MemberDetails(member.getMember_id(),member.getMember_password(),true,member.getMember_name());
	}

}
