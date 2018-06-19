package com.proj.rup.basket.model.service;

import java.util.List;

import com.proj.rup.basket.model.vo.Basket;

public interface BasketService {

	List<Basket> selectBasketList(String memberId);

	int deleteBasket(int basketNo);

}
