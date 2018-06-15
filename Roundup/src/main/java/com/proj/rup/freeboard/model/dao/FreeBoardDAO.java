package com.proj.rup.freeboard.model.dao;

import java.util.List;

import com.proj.rup.freeboard.model.vo.FreeBoard;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

public interface FreeBoardDAO {

	List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage);

	int selectfreeBoardListCount();

	FreeBoard selectfreeBoardOne(int no);

	List<FreeBoardFile> selectfreeBoardFileList(int no);

}
