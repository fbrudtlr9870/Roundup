package com.proj.rup.member.model.service;

import java.util.Map;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.Membership;

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

	int insertAddress(Map<String, Object> map);

	int updateAddress(Map<String, Object> map);

	Membership selectMembership(String memberId);

	int updateMembership(Map<String, Object> map);


}
