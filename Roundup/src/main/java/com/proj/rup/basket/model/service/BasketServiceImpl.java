package com.proj.rup.basket.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.basket.model.dao.BasketDAO;
import com.proj.rup.basket.model.dao.BasketDAOImpl;
import com.proj.rup.basket.model.vo.Basket;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO = new BasketDAOImpl();

	@Override
	public List<Basket> selectBasketList(String memberId) {
		return basketDAO.selectBasketList(memberId);
	}
	
}
