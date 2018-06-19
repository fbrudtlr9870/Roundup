package com.proj.rup.manager.model.dao;

import java.util.List;

import com.proj.rup.member.model.vo.Member;

public interface ManagerDAO {

	List<Member> selectListMember();

}
