package com.proj.rup.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Membership;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;

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
	public int connectMember(Member member) {
		return memberDAO.connectMember(member);
	}

	@Override
	public int selectMember(String member_id) {
		return memberDAO.selectMember(member_id);
	}
	
	
	@Override
	public int totalMember() {
		return memberDAO.totalMember();
	}

	/*ㄴㄴ */
	@Override
	public int deleteConnect(String member_id) {
		return memberDAO.deleteConnect(member_id);
	}

	@Override
	public int insertAddress(Map<String, Object> map) {
		return memberDAO.insertAddress(map);
	}
	
	@Override
	public Membership selectMembership(String memberId) {
		return memberDAO.selectMembership(memberId);
	}

	@Override
	public int updateAddress(Map<String, Object> map) {
		return memberDAO.updateAddress(map);
	}


	@Override
	public int updateMembership(Map<String, Object> map) {
		return memberDAO.updateMembership(map);
	}

	@Override
	public int deleteMember(String member_id) {
		return memberDAO.deleteMember(member_id);
	}

	@Override
	public List<Question> selectQuestionList(int cPage, int numPerPage) {
		return memberDAO.selectQuestionList(cPage,numPerPage);
	}

	@Override
	public int selectQuestionListCount(String member_id) {
		return memberDAO.selectQuestionListCount(member_id);
	}

	@Override
	public int insertBoard(Question question) {		
		return memberDAO.insertBoard(question);
	}

	@Override
	public int insertFile(QuestionFile fbf) {
		return memberDAO.insertFile(fbf);
	}

	@Override
	public Question selectQuestion(int no) {
		return memberDAO.selectQuestion(no);
	}

}
