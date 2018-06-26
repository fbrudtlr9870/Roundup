package com.proj.rup.purchase.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.purchase.model.dao.PurchaseDAO;
import com.proj.rup.purchase.model.dao.PurchaseDAOImpl;
import com.proj.rup.purchase.model.vo.PurchaseComplete;


@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO = new PurchaseDAOImpl();

	@Override
	public List<PurchaseComplete> selectPCList(String memberId) {
		return purchaseDAO.selectPCList(memberId);
	}

	@Override
	public BasketProduct selectPurchaseOne(int basketNo) {
		return purchaseDAO.selectPurchaseOne(basketNo);
	}

	@Override
	public MemberAddress selectMemberInfo(String memberId) {
		return purchaseDAO.selectMemberInfo(memberId);
	}

	@Override
	public List<Address> selectAddrList(String memberId) {
		return purchaseDAO.selectAddrList(memberId);
	}

	@Override
	public int insertPurchase(Map<String, Object> map) {
		return purchaseDAO.insertPurchase(map);
	}

}
