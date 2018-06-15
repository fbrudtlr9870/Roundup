package com.proj.rup.freeboard.model.service;

import java.util.List;

import com.proj.rup.freeboard.model.vo.FreeBoard;

public interface freeBoardService {

	List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage);

	int selectfreeBoardListCount();

}
