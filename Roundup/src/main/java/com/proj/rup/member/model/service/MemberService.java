package com.proj.rup.member.model.service;

import com.proj.rup.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String member_id);

	int checkIdDuplicate(String member_id);

	int updateMember(Member member);


	int connectMember(Member member);

	int selectMember(String member_id);

	int deleteMember(Member member);

	int totalMember();

	/*지우지마*/
	int deleteConnect(String member_id);


}
