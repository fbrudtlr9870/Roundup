package com.proj.rup.product.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Product;

public interface ProductDAO {

	List<Product> productSearch(String searchKeyword);

	List<Product> reSearch(Map<String, Object> map);

}
