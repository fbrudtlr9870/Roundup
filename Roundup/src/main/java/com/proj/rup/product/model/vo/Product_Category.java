package com.proj.rup.product.model.vo;

public class Product_Category {
	private int proCategoryNo;
	private int productNo;
	private int categoryNo;
	private int categoryLevel;
	
	public Product_Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product_Category(int proCategoryNo, int productNo, int categoryNo, int categoryLevel) {
		super();
		this.proCategoryNo = proCategoryNo;
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.categoryLevel = categoryLevel;
	}

	public int getProCategoryNo() {
		return proCategoryNo;
	}

	public void setProCategoryNo(int proCategoryNo) {
		this.proCategoryNo = proCategoryNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	@Override
	public String toString() {
		return "Product_Category [proCategoryNo=" + proCategoryNo + ", productNo=" + productNo + ", categoryNo="
				+ categoryNo + ", categoryLevel=" + categoryLevel + "]";
	}
	
	
}
