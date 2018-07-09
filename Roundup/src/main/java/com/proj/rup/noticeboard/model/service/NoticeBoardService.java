package com.proj.rup.noticeboard.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.noticeboard.model.vo.NoticeBoard;
import com.proj.rup.noticeboard.model.vo.NoticeBoardFile;

public interface NoticeBoardService {

	List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage);

	int selectNoticeBoardListCount();

	NoticeBoard selectNoticeBoardOne(int no);

	List<NoticeBoardFile> selectNoticeBoardFileList(int no);

	int totalCommentCount(int no);

	List<String> selectLevelKinds();

	List<Map<String, String>> selectContent();

	int insertBoard(NoticeBoard board);

	int uploadPhoto(Map<String, String> map);

	List<Map<String, Object>> uploadList(String memberId);

	int insertFile(NoticeBoardFile fbf);

	int deleteuploadPhoto(String username);

	int deleteBoard(int no);


}
