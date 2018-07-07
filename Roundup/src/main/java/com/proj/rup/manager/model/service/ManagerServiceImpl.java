package com.proj.rup.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.manager.model.dao.ManagerDAO;
import com.proj.rup.manager.model.dao.ManagerDAOImpl;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;
import com.proj.rup.product.model.vo.Product;

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
		return managerDAO.selectManagerTotalMember();
	}


	@Override
	public List<Product> selectProductList() {
		// TODO Auto-generated method stub
		return managerDAO.selectProductList();
	}

	@Override
	public List<Question> selectQuestionList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return managerDAO.selectQuestionList(cPage,numPerPage);
	}

	@Override
	public int selectQuestionListCount() {
		// TODO Auto-generated method stub
		return managerDAO.selectQuestionListCount();
	}

	@Override
	public Question selectQuestion(int no) {
		// TODO Auto-generated method stub
		return managerDAO.selectQuestion(no);
	}

	@Override
	public int insertBoard(Question question) {
		// TODO Auto-generated method stub
		return managerDAO.insertBoard(question);
	}

	@Override
	public int insertFile(QuestionFile fbf) {
		// TODO Auto-generated method stub
		return managerDAO.insertFile(fbf);
	}

	@Override
	public int deleteQuestion(String question_no) {
		// TODO Auto-generated method stub
		return managerDAO.deleteQuestion(question_no);
	}


}
