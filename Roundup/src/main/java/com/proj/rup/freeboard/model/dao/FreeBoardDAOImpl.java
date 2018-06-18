package com.proj.rup.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.freeboard.model.vo.FreeBoard;
import com.proj.rup.freeboard.model.vo.FreeBoardComment;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

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

	@Override
	public FreeBoard selectfreeBoardOne(int no) {
		return sqlSession.selectOne("freeboard.selectfreeBoardOne", no);
	}

	@Override
	public List<FreeBoardFile> selectfreeBoardFileList(int no) {
		return sqlSession.selectList("freeboard.selectfreeBoardFileList", no);
	}

	@Override
	public List<FreeBoardComment> selectfreeBoardCommentList(int no) {
		return sqlSession.selectList("freeboard.selectfreeBoardCommentList", no);
	}

}
