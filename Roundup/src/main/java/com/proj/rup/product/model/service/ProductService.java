package com.proj.rup.product.model.service;

import java.util.List;

import com.proj.rup.product.model.vo.Product;

public interface ProductService {

	List<Product> productSearch(String searchKeyword);

}
