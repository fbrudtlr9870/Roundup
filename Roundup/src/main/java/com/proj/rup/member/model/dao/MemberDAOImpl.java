package com.proj.rup.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	/*@Autowired
	private SqlSessionTemplate sqlSession;*/
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
