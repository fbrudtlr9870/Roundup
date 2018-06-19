package com.proj.rup.basket.model.vo;

public class Basket {
	private int basketNo;
	private String memberId;
	private int productNo;
	private int productAmount;
	
	public Basket() {
		super();
	}

	public Basket(int basketNo, String memberId, int productNo, int productAmount) {
		super();
		this.basketNo = basketNo;
		this.memberId = memberId;
		this.productNo = productNo;
		this.productAmount = productAmount;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", memberId=" + memberId + ", productNo=" + productNo
				+ ", productAmount=" + productAmount + "]";
	}
}
