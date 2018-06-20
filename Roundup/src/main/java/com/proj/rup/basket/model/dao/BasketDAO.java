package com.proj.rup.basket.model.dao;

import java.util.List;

import com.proj.rup.basket.model.vo.Basket;

public interface BasketDAO {

	List<Basket> selectBasketList(String memberId);

	int deleteBasket(int basketNo);

}
