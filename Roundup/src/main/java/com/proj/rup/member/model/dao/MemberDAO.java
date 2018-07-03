package com.proj.rup.member.model.dao;

import java.util.Map;

import com.proj.rup.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	Member selectOneMember(String member_id);

	int checkIdDuplicate(String member_id);

	int updateMember(Member member);

	int connectMember(Member member);

	int selectMember(String member_id);

	int deleteMember(Member member);

	int totalMember();

	
	/*ss*/
	int deleteConnect(String member_id);

	int insertAddress(Map<String, Object> map);

	Map<String, Object> selectConnectMember(String username);



}
