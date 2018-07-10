package com.proj.rup.noticeboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.noticeboard.model.vo.NoticeBoard;
import com.proj.rup.noticeboard.model.vo.NoticeBoardFile;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("noticeBoard.selectNoticeBoardList", null, rowBounds);
	}

	@Override
	public int selectNoticeBoardListCount() {
		return sqlSession.selectOne("noticeBoard.selectNoticeBoardListCount");
	}

	@Override
	public NoticeBoard selectNoticeBoardOne(int no) {
		return sqlSession.selectOne("noticeBoard.selectNoticeBoardOne", no);
	}

	@Override
	public List<NoticeBoardFile> selectNoticeBoardFileList(int no) {
		return sqlSession.selectList("noticeBoard.selectNoticeBoardFileList", no);
	}


	@Override
	public int totalCommentCount(int no) {
		return sqlSession.selectOne("noticeBoard.totalCommentCount", no);
	}


	@Override
	public List<String> selectLevelKinds() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeBoard.selectLevelKinds");
	}

	@Override
	public List<Map<String, String>> selectContent() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeBoard.selectContent");
	}

	@Override
	public int insertBoard(NoticeBoard Board) {
		return sqlSession.insert("noticeBoard.insertBoard", Board);
	}

	@Override
	public int uploadPhoto(Map<String, String> map) {
		return sqlSession.insert("noticeBoard.uploadPhoto", map);
	}

	@Override
	public List<Map<String, Object>> uploadList(String memberId) {
		return sqlSession.selectList("noticeBoard.uploadList", memberId);
	}

	@Override
	public int insertFile(NoticeBoardFile fbf) {
		return sqlSession.insert("noticeBoard.insertFile", fbf);
	}

	@Override
	public int deleteuploadPhoto(String username) {
		return sqlSession.delete("noticeBoard.deleteuploadPhoto",username);
	}
	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("noticeBoard.deleteBoard",no);
	}
}
