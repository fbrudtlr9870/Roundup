package com.proj.rup.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}
	@Override
	public Member selectOneMember(String member_id) {
		return sqlSession.selectOne("member.selectOneMember", member_id);
	}
	@Override
	public int checkIdDuplicate(String member_id) {
		return sqlSession.selectOne("member.checkIdDuplicate",member_id);
	}
	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember",member);
	}

}
