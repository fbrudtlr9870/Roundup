package com.proj.rup.manager.model.service;

import java.util.List;

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
	public List<Member> selectListMember() {
		return managerDAO.selectListMember();
	}

}
