package com.proj.rup.noticeboard.model.vo;

import java.sql.Date;

public class NoticeBoard {

	private int notice_board_no;
	private String member_id;
	private String notice_comment;
	private Date notice_reg_date;
	private String notice_board_title;
	//게시물 별 댓글 개수
	private int bc_count;
	
	public NoticeBoard() {
		super();
	}

	public NoticeBoard(int notice_board_no, String member_id, String notice_comment, Date notice_reg_date,
			String notice_board_title) {
		super();
		this.notice_board_no = notice_board_no;
		this.member_id = member_id;
		this.notice_comment = notice_comment;
		this.notice_reg_date = notice_reg_date;
		this.notice_board_title = notice_board_title;
	}

	@Override
	public String toString() {
		return "noticeBoard [notice_board_no=" + notice_board_no + ", member_id=" + member_id + ", notice_comment="
				+ notice_comment + ", notice_reg_date=" + notice_reg_date + ", notice_board_title=" + notice_board_title + "]";
	}

	public int getnotice_board_no() {
		return notice_board_no;
	}

	public void setnotice_board_no(int notice_board_no) {
		this.notice_board_no = notice_board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getnotice_comment() {
		return notice_comment;
	}

	public void setnotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}

	public Date getnotice_reg_date() {
		return notice_reg_date;
	}

	public void setnotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public String getnotice_board_title() {
		return notice_board_title;
	}

	public void setnotice_board_title(String notice_board_title) {
		this.notice_board_title = notice_board_title;
	}

	public int getBc_count() {
		return bc_count;
	}

	public void setBc_count(int bc_count) {
		this.bc_count = bc_count;
	}

}
