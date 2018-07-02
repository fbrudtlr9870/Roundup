package com.proj.rup.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo; //상품번호
	private String productName; //상품 이름
	private int brandNo; //브랜드 넘버
	private String brandName; //브랜드 넘버에 따른 브랜드 네임
	private int price; //가격
	private Date regDate; //등록일
	private String memberId; //멤버아이디
	private int productFileNo; //상품 이미지 등록된 번호
	private String originalFileName;//상품이미지의 원래이름
	private String renamedFileName;//상품이미지의 새로운 이름
	private Date fileRegDate; //상품이미지 등록일인데 위의 상품 등록일과 같은 예정이고 딱히 쓸일 없어보인다.
	private int proCategoryNo; //상품이 카테고리에 배정될 때의 넘버?
	private int categoryNo; //해당되는 카테고리의 넘버
	private String categoryName; //카테고리 네임
	private int parentCategory; //부모 카테고리에 해당되는 번호
	private int categoryLevel; //카테고리 레벨
	private int purchaseAmount;//판매량
	public Product() {}
	
	
	
	public Product(int productNo, String productName, int brandNo, String brandName, int price, Date regDate,
			String memberId, int productFileNo, String originalFileName, String renamedFileName, Date fileRegDate,
			int proCategoryNo, int categoryNo, String categoryName, int parentCategory, int categoryLevel,int purchaseAmount) {
		this.productNo = productNo;
		this.productName = productName;
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.price = price;
		this.regDate = regDate;
		this.memberId = memberId;
		this.productFileNo = productFileNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.fileRegDate = fileRegDate;
		this.proCategoryNo = proCategoryNo;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.parentCategory = parentCategory;
		this.categoryLevel = categoryLevel;
		this.purchaseAmount=purchaseAmount;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", brandNo=" + brandNo
				+ ", brandName=" + brandName + ", price=" + price + ", regDate=" + regDate + ", memberId=" + memberId
				+ ", productFileNo=" + productFileNo + ", originalFileName=" + originalFileName + ", renamedFileName="
				+ renamedFileName + ", fileRegDate=" + fileRegDate + ", proCategoryNo=" + proCategoryNo
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", parentCategory=" + parentCategory
				+ ", categoryLevel=" + categoryLevel +", purchaseAmount="+purchaseAmount+ "]";
	}
	public int getPurchaseAmount() {
		return purchaseAmount;
	}



	public void setPurchaseAmount(int purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}



	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getBrandNo() {
		return brandNo;
	}
	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProductFileNo() {
		return productFileNo;
	}
	public void setProductFileNo(int productFileNo) {
		this.productFileNo = productFileNo;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	public Date getFileRegDate() {
		return fileRegDate;
	}
	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}
	public int getProCategoryNo() {
		return proCategoryNo;
	}
	public void setProCategoryNo(int proCategoryNo) {
		this.proCategoryNo = proCategoryNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(int parentCategory) {
		this.parentCategory = parentCategory;
	}
	public int getCategoryLevel() {
		return categoryLevel;
	}
	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}
}
