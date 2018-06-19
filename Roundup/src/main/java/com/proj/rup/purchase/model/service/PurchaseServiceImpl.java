package com.proj.rup.purchase.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.purchase.model.dao.PurchaseDAO;
import com.proj.rup.purchase.model.dao.PurchaseDAOImpl;


@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO = new PurchaseDAOImpl();
}
