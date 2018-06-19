package com.proj.rup.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.member.model.vo.Member;

public interface ManagerDAO {

	List<Map<String, String>> selectListMember(int cPage, int numPerPage);

	int selectManagerTotalMember();

}
