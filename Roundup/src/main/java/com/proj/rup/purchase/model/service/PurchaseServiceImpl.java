package com.proj.rup.purchase.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.basket.model.vo.BasketProduct;
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


}
