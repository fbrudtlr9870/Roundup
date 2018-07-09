package com.proj.rup.freeboard.model.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public int totalCommentCount(int no) {
		return sqlSession.selectOne("freeboard.totalCommentCount", no);
	}

	@Override
	public int insertComment(FreeBoardComment fbc) {
		return sqlSession.insert("freeboard.insertComment",fbc);
	}

	@Override
	public List<String> selectLevelKinds() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("freeboard.selectLevelKinds");
	}

	@Override
	public List<Map<String, String>> selectContent() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("freeboard.selectContent");
	}

	@Override
	public int insertBoard(FreeBoard board) {
		return sqlSession.insert("freeboard.insertBoard", board);
	}

	@Override
	public int uploadPhoto(Map<String, String> map) {
		return sqlSession.insert("freeboard.uploadPhoto", map);
	}

	@Override
	public List<Map<String, Object>> uploadList(String memberId) {
		return sqlSession.selectList("freeboard.uploadList", memberId);
	}

	@Override
	public int insertFile(FreeBoardFile fbf) {
		return sqlSession.insert("freeboard.insertFile", fbf);
	}

	@Override
	public int deleteuploadPhoto(String username) {
		return sqlSession.delete("freeboard.deleteuploadPhoto",username);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("freeboard.deleteBoard",no);
	}

}
