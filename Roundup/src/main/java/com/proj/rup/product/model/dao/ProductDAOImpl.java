package com.proj.rup.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.rup.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Product> productSearch(String searchKeyword) {
		return session.selectList("product.productSearch", searchKeyword);
	}

	@Override
	public List<Product> reSearch(Map<String, Object> map) {
		return session.selectList("product.reSearch", map);
	}
	
}
