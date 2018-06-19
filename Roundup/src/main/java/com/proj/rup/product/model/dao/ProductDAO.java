package com.proj.rup.product.model.dao;

import java.util.List;

import com.proj.rup.product.model.vo.Product;

public interface ProductDAO {

	List<Product> productSearch(String searchKeyword);

}
