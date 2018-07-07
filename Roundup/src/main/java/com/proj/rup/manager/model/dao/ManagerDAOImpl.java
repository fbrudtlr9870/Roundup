package com.proj.rup.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;
import com.proj.rup.product.model.vo.Product;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectListMember(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("manager.selectListMember",null,rowBounds);
	}

	@Override
	public int selectManagerTotalMember() {
		
		return sqlSession.selectOne("manager.selectManagerTotalMember");
	}

	@Override
	public Member selectOneMember(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectOneMember",member_id);
	}

	@Override
	public List<Map<String, String>> selectListDeletedMember(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("manager.selectListDeletedMember",null,rowBounds);
	}

	@Override
	public int selectManagerTotalDeletedMember() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectManagerTotalDeletedMember");
	}

	@Override
	public List<Product> selectProductList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.selectProductList");
	}

	@Override
	public List<Question> selectQuestionList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("manager.selectQuestionList",null,rowBounds);
	}

	@Override
	public int selectQuestionListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectQuestionListCount");
	}

	@Override
	public Question selectQuestion(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectQuestion",no);
	}

	@Override
	public int insertBoard(Question question) {
		// TODO Auto-generated method stub
		return sqlSession.insert("manager.insertQuestion",question);
	}

	@Override
	public int insertFile(QuestionFile fbf) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertFile",fbf);
	}

	@Override
	public int deleteQuestion(String question_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteQuestion",question_no);
	}




}
