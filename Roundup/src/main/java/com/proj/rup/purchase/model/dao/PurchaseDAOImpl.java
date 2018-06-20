package com.proj.rup.purchase.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.purchase.model.vo.PurchaseComplete;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PurchaseComplete> selectPCList(String memberId) {
		return sqlSession.selectList("purchaseComplete.selectPCList",memberId);
	}

}
