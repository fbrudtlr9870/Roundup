package com.proj.rup.manager.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.member.model.vo.Member;

public interface ManagerService {

	List<Map<String, String>> selectListMember(int cPage, int numPerPage);

	int selectManagerTotalMember();

	Member selectOneMember(String member_id);

	List<Map<String, String>> selectDeletedListMember(int cPage, int numPerPage);

	int selectManagerTotalDeletedMember();




}
