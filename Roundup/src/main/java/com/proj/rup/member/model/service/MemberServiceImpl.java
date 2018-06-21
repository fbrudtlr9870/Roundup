package com.proj.rup.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectOneMember(String member_id) {
		return memberDAO.selectOneMember(member_id);
	}

	@Override
	public int checkIdDuplicate(String member_id) {
		return memberDAO.checkIdDuplicate(member_id);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(String memberId) {
		return memberDAO.deleteMember(memberId);
	}

	@Override
	public int connectMember(Member member) {
		return memberDAO.connectMember(member);
	}

	@Override
	public int selectMember(String member_id) {
		return memberDAO.selectMember(member_id);
	}

}
