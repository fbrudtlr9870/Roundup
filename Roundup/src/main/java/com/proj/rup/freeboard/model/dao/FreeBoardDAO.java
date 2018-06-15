package com.proj.rup.freeboard.model.dao;

import java.util.List;

import com.proj.rup.freeboard.model.vo.FreeBoard;

public interface FreeBoardDAO {

	List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage);

	int selectfreeBoardListCount();

}
