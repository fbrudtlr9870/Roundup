package com.proj.rup.purchase.model.service;

import java.util.List;

import com.proj.rup.purchase.model.vo.PurchaseComplete;

public interface PurchaseService {

	List<PurchaseComplete> selectPCList(String memberId);


}
