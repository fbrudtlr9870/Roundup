package com.proj.rup.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.freeboard.model.vo.FreeBoard;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("freeboard.selectfreeBoardList", null, rowBounds);
	}

	@Override
	public int selectfreeBoardListCount() {
		return sqlSession.selectOne("freeboard.selectfreeBoardListCount");
	}

}
