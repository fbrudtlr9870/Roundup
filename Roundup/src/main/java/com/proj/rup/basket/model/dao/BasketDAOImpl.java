package com.proj.rup.basket.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.basket.model.vo.Basket;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Basket> selectBasketList(String memberId) {
		return sqlSession.selectList("basket.selectBasketList", memberId);
	}

	@Override
	public int deleteBasket(int basketNo) {
		return sqlSession.delete("basket.deleteBasket", basketNo);
	}
}
