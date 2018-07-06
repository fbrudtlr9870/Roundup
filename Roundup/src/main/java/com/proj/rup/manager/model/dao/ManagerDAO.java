package com.proj.rup.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.member.model.vo.Member;
import com.proj.rup.product.model.vo.Product;

public interface ManagerDAO {

	List<Map<String, String>> selectListMember(int cPage, int numPerPage);

	int selectManagerTotalMember();

	Member selectOneMember(String member_id);

	List<Map<String, String>> selectListDeletedMember(int cPage, int numPerPage);

	int selectManagerTotalDeletedMember();


	List<Product> selectProductList();

}
