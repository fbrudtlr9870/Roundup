package com.proj.rup.purchase.model.dao;

import java.util.List;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

public interface PurchaseDAO {

	List<PurchaseComplete> selectPCList(String memberId);

	BasketProduct selectPurchaseOne(int basketNo);

}
