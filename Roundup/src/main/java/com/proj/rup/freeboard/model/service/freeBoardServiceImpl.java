package com.proj.rup.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.freeboard.model.dao.FreeBoardDAO;
import com.proj.rup.freeboard.model.dao.FreeBoardDAOImpl;
import com.proj.rup.freeboard.model.vo.FreeBoard;
import com.proj.rup.freeboard.model.vo.FreeBoardComment;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

@Service
public class freeBoardServiceImpl implements freeBoardService {
	
	@Autowired
	private FreeBoardDAO freeBoardDAO = new FreeBoardDAOImpl();
	
	@Override
	public List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage) {
		return freeBoardDAO.selectfreeBoardList(cPage, numPerPage);
	}

	@Override
	public int selectfreeBoardListCount() {
		return freeBoardDAO.selectfreeBoardListCount();
	}

	@Override
	public FreeBoard selectfreeBoardOne(int no) {
		return freeBoardDAO.selectfreeBoardOne(no);
	}

	@Override
	public List<FreeBoardFile> selectfreeBoardFileList(int no) {
		return freeBoardDAO.selectfreeBoardFileList(no);
	}

	@Override
	public List<FreeBoardComment> selectfreeBoardCommentList(int no) {
		return freeBoardDAO.selectfreeBoardCommentList(no);
	}

	@Override
	public int totalCommentCount(int no) {
		return freeBoardDAO.totalCommentCount(no);
	}

	@Override
	public int insertComment(FreeBoardComment fbc) {
		return freeBoardDAO.insertComment(fbc);
	}

	@Override
	public List<String> selectLevelKinds() {
		return freeBoardDAO.selectLevelKinds();
	}

	@Override
	public List<Map<String, String>> selectContent() {
		return freeBoardDAO.selectContent();
	}

	@Override
	public int insertBoard(FreeBoard board) {
		return freeBoardDAO.insertBoard(board);
	}

	@Override
	public int uploadPhoto(Map<String, String> map) {
		return freeBoardDAO.uploadPhoto(map);
	}

	@Override
	public List<Map<String, Object>> uploadList(String memberId) {
		return freeBoardDAO.uploadList(memberId);
	}

	@Override
	public int insertFile(FreeBoardFile fbf) {
		return freeBoardDAO.insertFile(fbf);
	}

	@Override
	public int deleteuploadPhoto(String username) {
		return freeBoardDAO.deleteuploadPhoto(username);
	}

	@Override
	public int deleteBoard(int no) {
		return freeBoardDAO.deleteBoard(no);
	}

}
