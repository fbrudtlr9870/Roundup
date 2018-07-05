package com.proj.rup.purchase.model.vo;

import java.sql.Date;

public class Purchase {
	private int purchase_no;
	private int product_no;
	private String member_id;
	private Date purchase_date;
	private int product_amount;
	private String address;
	private String zip_code;
	private String imp_uid;
	
	public Purchase() {
		super();
	}

	public Purchase(int purchase_no, int product_no, String member_id, Date purchase_date, int product_amount,
			String address, String zip_code, String imp_uid) {
		super();
		this.purchase_no = purchase_no;
		this.product_no = product_no;
		this.member_id = member_id;
		this.purchase_date = purchase_date;
		this.product_amount = product_amount;
		this.address = address;
		this.zip_code = zip_code;
		this.imp_uid = imp_uid;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public int getPurchase_no() {
		return purchase_no;
	}

	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
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

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	@Override
	public String toString() {
		return "Purchase [purchase_no=" + purchase_no + ", product_no=" + product_no + ", member_id=" + member_id
				+ ", purchase_date=" + purchase_date + ", product_amount=" + product_amount + ", address=" + address
				+ ", zip_code=" + zip_code + ", imp_uid=" + imp_uid + "]";
	}

}
