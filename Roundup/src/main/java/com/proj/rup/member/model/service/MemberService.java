package com.proj.rup.member.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Membership;
import com.proj.rup.member.model.vo.Question;
import com.proj.rup.member.model.vo.QuestionFile;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String member_id);

	int checkIdDuplicate(String member_id);

	int updateMember(Member member);


	int connectMember(Member member);

	int selectMember(String member_id);

	

	int totalMember();

	/*지우지마*/
	int deleteConnect(String member_id);

	int insertAddress(Map<String, Object> map);

	int updateAddress(Map<String, Object> map);

	Membership selectMembership(String memberId);

	int updateMembership(Map<String, Object> map);

	int deleteMember(String member_id);

	List<Question> selectQuestionList(int cPage, int numPerPage);

	int selectQuestionListCount(String member_id);

	int insertBoard(Question question);

	int insertFile(QuestionFile fbf);

	Question selectQuestion(int no);

}
