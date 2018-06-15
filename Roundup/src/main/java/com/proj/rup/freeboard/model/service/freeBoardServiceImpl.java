package com.proj.rup.freeboard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.freeboard.model.dao.FreeBoardDAO;
import com.proj.rup.freeboard.model.dao.FreeBoardDAOImpl;
import com.proj.rup.freeboard.model.vo.FreeBoard;

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

}