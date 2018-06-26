package com.proj.rup.purchase.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

public interface PurchaseDAO {

	List<PurchaseComplete> selectPCList(String memberId);

	BasketProduct selectPurchaseOne(int basketNo);

	MemberAddress selectMemberInfo(String memberId);

	List<Address> selectAddrList(String memberId);

	int insertPurchase(Map<String, Object> map);

	Product buyNow(int productNo);

}
