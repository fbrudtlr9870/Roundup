package com.proj.rup.freeboard.model.vo;

import java.sql.Date;

public class FreeBoard {

	private int free_board_no;
	private String member_id;
	private String free_comment;
	private Date free_reg_date;
	private String free_board_title;
	//게시물 별 댓글 개수
	private int bc_count;
	
	public FreeBoard() {
		super();
	}

	public FreeBoard(int free_board_no, String member_id, String free_comment, Date free_reg_date,
			String free_board_title) {
		super();
		this.free_board_no = free_board_no;
		this.member_id = member_id;
		this.free_comment = free_comment;
		this.free_reg_date = free_reg_date;
		this.free_board_title = free_board_title;
	}

	@Override
	public String toString() {
		return "FreeBoard [free_board_no=" + free_board_no + ", member_id=" + member_id + ", free_comment="
				+ free_comment + ", free_reg_date=" + free_reg_date + ", free_board_title=" + free_board_title + "]";
	}

	public int getFree_board_no() {
		return free_board_no;
	}

	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getFree_comment() {
		return free_comment;
	}

	public void setFree_comment(String free_comment) {
		this.free_comment = free_comment;
	}

	public Date getFree_reg_date() {
		return free_reg_date;
	}

	public void setFree_reg_date(Date free_reg_date) {
		this.free_reg_date = free_reg_date;
	}

	public String getFree_board_title() {
		return free_board_title;
	}

	public void setFree_board_title(String free_board_title) {
		this.free_board_title = free_board_title;
	}

	public int getBc_count() {
		return bc_count;
	}

	public void setBc_count(int bc_count) {
		this.bc_count = bc_count;
	}
	
	
	
}
