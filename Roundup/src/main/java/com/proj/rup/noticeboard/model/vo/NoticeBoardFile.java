package com.proj.rup.noticeboard.model.vo;

public class NoticeBoardFile {

	private int notice_board_file_no;
	private int notice_board_no;
	private String original_filename;
	private String renamed_filename;
	
	
	public NoticeBoardFile() {
		super();
	}

	public NoticeBoardFile(int notice_board_file_no, int notice_board_no, String original_filename, String renamed_filename) {
		super();
		this.notice_board_file_no = notice_board_file_no;
		this.notice_board_no = notice_board_no;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
	}
	

	public NoticeBoardFile(int notice_board_no, String renamed_filename) {
		super();
		this.notice_board_no = notice_board_no;
		this.renamed_filename = renamed_filename;
	}

	@Override
	public String toString() {
		return "noticeBoardFile [notice_board_file_no=" + notice_board_file_no + ", notice_board_no=" + notice_board_no
				+ ", original_filename=" + original_filename + ", renamed_filename=" + renamed_filename + "]";
	}

	public int getnotice_board_file_no() {
		return notice_board_file_no;
	}

	public void setnotice_board_file_no(int notice_board_file_no) {
		this.notice_board_file_no = notice_board_file_no;
	}

	public int getnotice_board_no() {
		return notice_board_no;
	}

	public void setnotice_board_no(int notice_board_no) {
		this.notice_board_no = notice_board_no;
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
	
	
}
