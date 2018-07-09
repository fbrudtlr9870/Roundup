package com.proj.rup.freeboard.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.freeboard.model.vo.FreeBoard;
import com.proj.rup.freeboard.model.vo.FreeBoardComment;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

public interface freeBoardService {

	List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage);

	int selectfreeBoardListCount();

	FreeBoard selectfreeBoardOne(int no);

	List<FreeBoardFile> selectfreeBoardFileList(int no);

	List<FreeBoardComment> selectfreeBoardCommentList(int no);

	int totalCommentCount(int no);

	int insertComment(FreeBoardComment fbc);

	List<String> selectLevelKinds();

	List<Map<String, String>> selectContent();

	int insertBoard(FreeBoard board);

	int uploadPhoto(Map<String, String> map);

	List<Map<String, Object>> uploadList(String memberId);

	int insertFile(FreeBoardFile fbf);

	int deleteuploadPhoto(String username);

	int deleteBoard(int no);

	int deleteComment(int no);



}
