package com.proj.rup.product.model.vo;

import java.sql.Date;

public class Product_File {
	private int productFileNo;
	private int productNo;
	private String originalFileName;
	private String renamedFileName;
	private Date fileRegDate;
	
	public Product_File() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_File(int productFileNo, int productNo, String originalFilename, String renamedFilename,
			Date fileRegDate) {
		super();
		this.productFileNo = productFileNo;
		this.productNo = productNo;
		this.originalFileName = originalFilename;
		this.renamedFileName = renamedFilename;
		this.fileRegDate = fileRegDate;
	}
	public int getProductFileNo() {
		return productFileNo;
	}
	public void setProductFileNo(int productFileNo) {
		this.productFileNo = productFileNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getOriginalFilename() {
		return originalFileName;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFileName = originalFilename;
	}
	public String getRenamedFilename() {
		return renamedFileName;
	}
	public void setRenamedFilename(String renamedFilename) {
		this.renamedFileName = renamedFilename;
	}
	public Date getFileRegDate() {
		return fileRegDate;
	}
	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}
	@Override
	public String toString() {
		return "Product_File [productFileNo=" + productFileNo + ", productNo=" + productNo + ", originalFilename="
				+ originalFileName + ", renamedFilename=" + renamedFileName + ", fileRegDate=" + fileRegDate + "]";
	}
	
	
}
