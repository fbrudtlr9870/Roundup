package com.proj.rup.basket.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.basket.model.vo.Basket;
import com.proj.rup.basket.model.vo.BasketProduct;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BasketProduct> selectBasketList(String memberId) {
		return sqlSession.selectList("basket.selectBasketList", memberId);
	}

	@Override
	public int deleteBasket(int basketNo) {
		return sqlSession.delete("basket.deleteBasket", basketNo);
	}

	@Override
	public int updateBasket(Map<String, Integer> map) {
		return sqlSession.update("basket.updateBasket", map);
	}

	@Override
	public int insertBasket(Map<String, Object> map) {
		return sqlSession.insert("basket.insertBasket", map);
	}
}
