package com.proj.rup.product.model.vo;

import java.sql.Date;

// product, product_category, product_category 조인
// 상세 검색 카테고리
public class ProductCategoryLevel {
	private int product_no;
	private int category_no;
	private int category_level;
	private String product_name;
	private String category_name;
	private int parent_category;
	
	public ProductCategoryLevel() {
		super();
	}

	public ProductCategoryLevel(int product_no, int category_no, int category_level, String product_name,
			String category_name, int parent_category) {
		super();
		this.product_no = product_no;
		this.category_no = category_no;
		this.category_level = category_level;
		this.product_name = product_name;
		this.category_name = category_name;
		this.parent_category = parent_category;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getCategory_level() {
		return category_level;
	}

	public void setCategory_level(int category_level) {
		this.category_level = category_level;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getParent_category() {
		return parent_category;
	}

	public void setParent_category(int parent_category) {
		this.parent_category = parent_category;
	}

	@Override
	public String toString() {
		return "ProductCategoryLevel [product_no=" + product_no + ", category_no=" + category_no + ", category_level="
				+ category_level + ", product_name=" + product_name + ", category_name=" + category_name
				+ ", parent_category=" + parent_category + "]";
	}
}
