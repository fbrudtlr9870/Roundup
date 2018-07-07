package com.proj.rup.purchase.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.purchase.model.dao.PurchaseDAO;
import com.proj.rup.purchase.model.dao.PurchaseDAOImpl;
import com.proj.rup.purchase.model.vo.Purchase;
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
	public Product buyNow(int productNo) {
		return purchaseDAO.buyNow(productNo);
	}

	@Override
	public int insertPurchase(Purchase purchase) {
		return purchaseDAO.insertPurchase(purchase);
	}

	@Override
	public int insertPurchaseComplete(PurchaseComplete purchaseComplete) {
		return purchaseDAO.insertPurchaseComplete(purchaseComplete);
	}

	@Override
	public int updateProductPurchase(Map<String, Integer> map) {
		return purchaseDAO.updateProductPurchase(map);
	}

	@Override
	public int deletePurchase(String imp_uid) {
		return purchaseDAO.deletePurchase(imp_uid);
	}

	@Override
	public int deletePurchaseComplete(String imp_uid) {
		return purchaseDAO.deletePurchaseComplete(imp_uid);
	}
	
/*	@Override
	public List<PurchaseComplete> selectAPCList() {
		return purchaseDAO.selectAPCList();
	}*/

	@Override
	public List<PurchaseComplete> selectAPCancelList() {
		// TODO Auto-generated method stub
		return purchaseDAO.selectAPCancelList();
	}

	@Override
	public List<Map<String, String>> selectAPCList(int cPage, int numPerPage) {
		return purchaseDAO.selectAPCList(cPage,numPerPage);
	}

	@Override
	public int selectTotalPurchase() {
		return purchaseDAO.selectTotalPurchase();
	}
	
	@Override
	public int selectPurchaseCompleteListCount(String member_id) {
		return purchaseDAO.selectPurchaseCompleteListCount(member_id);
	}

	@Override
	public List<PurchaseComplete> selectPurchaseCompleteList(String member_id, int cPage, int numPerPage) {
		return purchaseDAO.selectPurchaseCompleteList(member_id, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectAllProductList(int cPage, int numPerPage) {
		return purchaseDAO.selectAllProductList(cPage,numPerPage);
	}

	@Override
	public int selectTotalProduct() {
		// TODO Auto-generated method stub
		return purchaseDAO.selectTotalPurchase();
	}

	@Override
	public List<Map<String, String>> selectAPCancelList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return purchaseDAO.selectAPCancelList(cPage,numPerPage);
	}

	@Override
	public int selectTotalCancel() {
		// TODO Auto-generated method stub
		return purchaseDAO.selectTotalCancel();
	}

}
