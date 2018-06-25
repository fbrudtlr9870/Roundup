package com.proj.rup.purchase.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PurchaseComplete> selectPCList(String memberId) {
		return sqlSession.selectList("purchase.selectPCList",memberId);
	}

	@Override
	public BasketProduct selectPurchaseOne(int basketNo) {
		return sqlSession.selectOne("purchase.selectPurchaseOne", basketNo);
	}

	@Override
	public MemberAddress selectMemberInfo(String memberId) {
		return sqlSession.selectOne("purchase.selectMemberInfo", memberId);
	}

	@Override
	public List<Address> selectAddrList(String memberId) {
		return sqlSession.selectList("purchase.selectAddrList", memberId);
	}

	@Override
	public int insertPurchase(Map<String, Object> map) {
		return sqlSession.insert("purchase.insertPurchase", map);
	}

}
