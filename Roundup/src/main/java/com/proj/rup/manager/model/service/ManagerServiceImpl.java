package com.proj.rup.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.manager.model.dao.ManagerDAO;
import com.proj.rup.manager.model.dao.ManagerDAOImpl;
import com.proj.rup.member.model.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO = new ManagerDAOImpl();
	
	@Override
	public List<Map<String, String>> selectListMember(int cPage, int numPerPage) {
		return managerDAO.selectListMember(cPage,numPerPage);
	}

	@Override
	public int selectManagerTotalMember() {
		return managerDAO.selectManagerTotalMember();
	}

	@Override
	public Member selectOneMember(String member_id) {
		// TODO Auto-generated method stub
		return managerDAO.selectOneMember(member_id);
	}

	@Override
	public List<Map<String, String>> selectDeletedListMember(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return managerDAO.selectListDeletedMember(cPage,numPerPage);
	}

	@Override
	public int selectManagerTotalDeletedMember() {
		// TODO Auto-generated method stub
		return managerDAO.selectManagerTotalDeletedMember();
	}


}
