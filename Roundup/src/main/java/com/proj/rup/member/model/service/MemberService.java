package com.proj.rup.member.model.service;

import com.proj.rup.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String member_id);

	int checkIdDuplicate(String member_id);

	int updateMember(Member member);

	int deleteMember(String memberId);

	int connectMember(Member member);

}
