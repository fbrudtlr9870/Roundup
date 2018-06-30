package com.proj.rup.product.model.vo;

public class Category {
	private int category_no;
	private String category_name;
	private int parent_category;
	private int category_level;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int category_no, String category_name, int parent_category, int category_level) {
		super();
		this.category_no = category_no;
		this.category_name = category_name;
		this.parent_category = parent_category;
		this.category_level = category_level;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
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

	public int getCategory_level() {
		return category_level;
	}

	public void setCategory_level(int category_level) {
		this.category_level = category_level;
	}

	@Override
	public String toString() {
		return "Category [category_no=" + category_no + ", category_name=" + category_name + ", parent_category="
				+ parent_category + ", category_level=" + category_level + "]";
	}
	
	
}
