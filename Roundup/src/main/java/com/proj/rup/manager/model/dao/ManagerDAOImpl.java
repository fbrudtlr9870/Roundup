package com.proj.rup.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.member.model.vo.Member;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectListMember() {
		
		return sqlSession.selectList("manager.selectListMember");
	}

}
