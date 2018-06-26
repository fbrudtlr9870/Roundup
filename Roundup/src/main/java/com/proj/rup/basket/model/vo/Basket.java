package com.proj.rup.basket.model.vo;

public class Basket {
	private int basket_no;
	private String member_id;
	private int product_no;
	private int product_amount;
	
	public Basket() {
		super();
	}

	public Basket(int basket_no, String member_id, int product_no, int product_amount) {
		super();
		this.basket_no = basket_no;
		this.member_id = member_id;
		this.product_no = product_no;
		this.product_amount = product_amount;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	@Override
	public String toString() {
		return "Basket [basket_no=" + basket_no + ", member_id=" + member_id + ", product_no=" + product_no
				+ ", product_amount=" + product_amount + "]";
	}
}
