package com.proj.rup.basket.model.vo;

import java.sql.Date;

public class BasketProduct {
	private int basket_no;
	private String member_id;
	private int product_no;
	private int product_amount;
	private String product_name;
	private int brand_no;
	private int price;
	private Date reg_date;
	private int product_file_no;
	private String original_filename;
	private String renamed_filename;
	private Date file_reg_date;
	
	public BasketProduct() {
		super();
	}

	public BasketProduct(int basket_no, String member_id, int product_no, int product_amount, String product_name,
			int brand_no, int price, Date reg_date, int product_file_no, String original_filename,
			String renamed_filename, Date file_reg_date) {
		super();
		this.basket_no = basket_no;
		this.member_id = member_id;
		this.product_no = product_no;
		this.product_amount = product_amount;
		this.product_name = product_name;
		this.brand_no = brand_no;
		this.price = price;
		this.reg_date = reg_date;
		this.product_file_no = product_file_no;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
		this.file_reg_date = file_reg_date;
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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getProduct_file_no() {
		return product_file_no;
	}

	public void setProduct_file_no(int product_file_no) {
		this.product_file_no = product_file_no;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getRenamed_filename() {
		return renamed_filename;
	}

	public void setRenamed_filename(String renamed_filename) {
		this.renamed_filename = renamed_filename;
	}

	public Date getFile_reg_date() {
		return file_reg_date;
	}

	public void setFile_reg_date(Date file_reg_date) {
		this.file_reg_date = file_reg_date;
	}

	@Override
	public String toString() {
		return "BasketProduct [basket_no=" + basket_no + ", member_id=" + member_id + ", product_no=" + product_no
				+ ", product_amount=" + product_amount + ", product_name=" + product_name + ", brand_no=" + brand_no
				+ ", price=" + price + ", reg_date=" + reg_date + ", product_file_no=" + product_file_no
				+ ", original_filename=" + original_filename + ", renamed_filename=" + renamed_filename
				+ ", file_reg_date=" + file_reg_date + "]";
	}
}
