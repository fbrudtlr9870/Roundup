package com.proj.rup.manager.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;
import com.proj.rup.product.model.vo.Product;

public interface ManagerService {

	List<Map<String, String>> selectListMember(int cPage, int numPerPage);

	int selectManagerTotalMember();

	Member selectOneMember(String member_id);

	List<Map<String, String>> selectDeletedListMember(int cPage, int numPerPage);

	int selectManagerTotalDeletedMember();

	List<Product> selectProductList();

	List<Question> selectQuestionList(int cPage, int numPerPage);

	int selectQuestionListCount();

	Question selectQuestion(int no);

	int insertBoard(Question question);

	int insertFile(QuestionFile fbf);

	int deleteQuestion(String question_no);




}
