package com.proj.rup.purchase.model.vo;

import java.sql.Date;

public class PurchaseComplete {
	private int productComNo;
	private int purchaseNo;
	private int productNo;
	private String memberId;
	private int addressNo;
	private Date purchaseDate;
	private int productAmount;
	
	public PurchaseComplete() {
		super();
	}

	public PurchaseComplete(int productComNo, int purchaseNo, int productNo, String memberId, int addressNo,
			Date purchaseDate, int productAmount) {
		super();
		this.productComNo = productComNo;
		this.purchaseNo = purchaseNo;
		this.productNo = productNo;
		this.memberId = memberId;
		this.addressNo = addressNo;
		this.purchaseDate = purchaseDate;
		this.productAmount = productAmount;
	}

	public int getProductComNo() {
		return productComNo;
	}

	public void setProductComNo(int productComNo) {
		this.productComNo = productComNo;
	}

	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	@Override
	public String toString() {
		return "PurchaseComplete [productComNo=" + productComNo + ", purchaseNo=" + purchaseNo + ", productNo="
				+ productNo + ", memberId=" + memberId + ", addressNo=" + addressNo + ", purchaseDate=" + purchaseDate
				+ ", productAmount=" + productAmount + "]";
	}
}
