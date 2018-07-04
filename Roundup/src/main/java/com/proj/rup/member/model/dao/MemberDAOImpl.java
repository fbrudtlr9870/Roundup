package com.proj.rup.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Membership;

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
	
	@Override
	public int deleteMember(Member member) {
		return sqlSession.delete("member.deleteMember",member);
	}
	
	@Override
	public int connectMember(Member member) {
		return sqlSession.insert("member.connectMember",member);
	}
	@Override
	public int selectMember(String member_id) {
		return sqlSession.selectOne("member.selectMember",member_id);
	}
	@Override
	public int totalMember() {
		return sqlSession.selectOne("member.totalMember");
	}
	
			
	
	/**/
	@Override
	public int deleteConnect(String member_id) {
		return sqlSession.delete("member.deleteConnect",member_id);
	}
	
	@Override
	public int insertAddress(Map<String, Object> map) {
		return sqlSession.insert("member.insertAddress", map);
	}
	@Override
	public Map<String, Object> selectConnectMember(String user_name) {
		Map<String,Object> map = sqlSession.selectOne("member.selectConnectMember", user_name);
		System.out.println("map@DAOImpl="+map);
		return map;
	}
	@Override
	public int updateAddress(Map<String, Object> map) {
		return sqlSession.update("member.updateAddress",map);
	}
	@Override
	public Membership selectMembership(String memberId) {
		return sqlSession.selectOne("member.selectMembership", memberId);
	}
	@Override
	public int updateMembership(Map<String, Object> map) {
		return sqlSession.update("member.updateMembership", map);
	}
}
