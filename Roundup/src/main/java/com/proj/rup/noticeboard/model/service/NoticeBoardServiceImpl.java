package com.proj.rup.noticeboard.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.noticeboard.model.dao.NoticeBoardDAO;
import com.proj.rup.noticeboard.model.dao.NoticeBoardDAOImpl;
import com.proj.rup.noticeboard.model.vo.NoticeBoard;
import com.proj.rup.noticeboard.model.vo.NoticeBoardFile;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardDAO NoticeBoardDAO = new NoticeBoardDAOImpl();
	
	@Override
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage) {
		return NoticeBoardDAO.selectNoticeBoardList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeBoardListCount() {
		return NoticeBoardDAO.selectNoticeBoardListCount();
	}

	@Override
	public NoticeBoard selectNoticeBoardOne(int no) {
		return NoticeBoardDAO.selectNoticeBoardOne(no);
	}

	@Override
	public List<NoticeBoardFile> selectNoticeBoardFileList(int no) {
		return NoticeBoardDAO.selectNoticeBoardFileList(no);
	}

	@Override
	public int totalCommentCount(int no) {
		return NoticeBoardDAO.totalCommentCount(no);
	}

	@Override
	public List<String> selectLevelKinds() {
		return NoticeBoardDAO.selectLevelKinds();
	}

	@Override
	public List<Map<String, String>> selectContent() {
		return NoticeBoardDAO.selectContent();
	}

	@Override
	public int insertBoard(NoticeBoard board) {
		return NoticeBoardDAO.insertBoard(board);
	}

	@Override
	public int uploadPhoto(Map<String, String> map) {
		return NoticeBoardDAO.uploadPhoto(map);
	}

	@Override
	public List<Map<String, Object>> uploadList(String memberId) {
		return NoticeBoardDAO.uploadList(memberId);
	}

	@Override
	public int insertFile(NoticeBoardFile fbf) {
		return NoticeBoardDAO.insertFile(fbf);
	}

	@Override
	public int deleteuploadPhoto(String username) {
		return NoticeBoardDAO.deleteuploadPhoto(username);
	}

}
