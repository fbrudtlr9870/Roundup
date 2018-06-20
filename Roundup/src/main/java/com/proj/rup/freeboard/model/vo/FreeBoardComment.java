package com.proj.rup.freeboard.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;




public class FreeBoardComment {
	
	private int comment_no;
	private String member_id;
	private int free_board_no;
	private int parent_comment;
	private String comment_content;	
	private String comment_enrolldate;
	private String comment_update_date;
	private int comment_level;
	private String parent_id;
	
	public FreeBoardComment() {
		super();
	}

	public FreeBoardComment(int comment_no, String member_id, int free_board_no, int parent_comment,
			String comment_content, String comment_enrolldate, String comment_update_date, int comment_level, String parent_id) {
		super();
		this.comment_no = comment_no;
		this.member_id = member_id;
		this.free_board_no = free_board_no;
		this.parent_comment = parent_comment;
		this.comment_content = comment_content;
		this.comment_enrolldate = comment_enrolldate;
		this.comment_update_date = comment_update_date;
		this.comment_level = comment_level;
		this.parent_id= parent_id;
	}

	@Override
	public String toString() {
		return "FreeBoardComment [comment_no=" + comment_no + ", member_id=" + member_id + ", free_board_no="
				+ free_board_no + ", parent_comment=" + parent_comment + ", comment_content=" + comment_content
				+ ", comment_enrolldate=" + comment_enrolldate + ", comment_update_date=" + comment_update_date
				+ ", comment_level=" + comment_level + "]";
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getFree_board_no() {
		return free_board_no;
	}

	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
	}

	public int getParent_comment() {
		return parent_comment;
	}

	public void setParent_comment(int parent_comment) {
		this.parent_comment = parent_comment;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	
	public String getComment_enrolldate() {
		return comment_enrolldate;
	}

	public void setComment_enrolldate(String comment_enrolldate) {
		this.comment_enrolldate = comment_enrolldate;
	}

	public String getComment_update_date() {
		return comment_update_date;
	}

	public void setComment_update_date(String comment_update_date) {
		this.comment_update_date = comment_update_date;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	

}
