package com.proj.rup.purchase.model.vo;

import java.sql.Date;

public class PurchaseCancel {
	private int purchase_can_no;
	private int purchase_com_no;
	private int product_no;
	private String member_id;
	private Date purchase_date;
	private Date cancel_date;
	private int product_amount;
	private int total_price;
	private String brand_name;
	private String renamed_filename;
	private String product_name;
	private int price;
	
	public PurchaseCancel() {
		super();
	}
	
	public PurchaseCancel(int purchase_can_no, int purchase_com_no, int product_no, String member_id,
			Date purchase_date, Date cancel_date, int product_amount, int total_price, String brand_name,
			String renamed_filename, String product_name, int price) {
		super();
		this.purchase_can_no = purchase_can_no;
		this.purchase_com_no = purchase_com_no;
		this.product_no = product_no;
		this.member_id = member_id;
		this.purchase_date = purchase_date;
		this.cancel_date = cancel_date;
		this.product_amount = product_amount;
		this.total_price = total_price;
		this.brand_name = brand_name;
		this.renamed_filename = renamed_filename;
		this.product_name = product_name;
		this.price = price;
	}

	public int getPurchase_can_no() {
		return purchase_can_no;
	}

	public void setPurchase_can_no(int purchase_can_no) {
		this.purchase_can_no = purchase_can_no;
	}

	public int getPurchase_com_no() {
		return purchase_com_no;
	}

	public void setPurchase_com_no(int purchase_com_no) {
		this.purchase_com_no = purchase_com_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}

	public Date getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getRenamed_filename() {
		return renamed_filename;
	}

	public void setRenamed_filename(String renamed_filename) {
		this.renamed_filename = renamed_filename;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "PurchaseCancel [purchase_can_no=" + purchase_can_no + ", purchase_com_no=" + purchase_com_no
				+ ", product_no=" + product_no + ", member_id=" + member_id + ", purchase_date=" + purchase_date
				+ ", cancel_date=" + cancel_date + ", product_amount=" + product_amount + ", total_price=" + total_price
				+ ", brand_name=" + brand_name + ", renamed_filename=" + renamed_filename + ", product_name="
				+ product_name + ", price=" + price + "]";
	}
}
