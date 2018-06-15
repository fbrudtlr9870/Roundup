package com.proj.rup.freeboard.model.vo;

public class FreeBoardFile {

	private int free_board_file_no;
	private int free_board_no;
	private String original_filename;
	private String renamed_filename;
	
	
	public FreeBoardFile() {
		super();
	}

	public FreeBoardFile(int free_board_file_no, int free_board_no, String original_filename, String renamed_filename) {
		super();
		this.free_board_file_no = free_board_file_no;
		this.free_board_no = free_board_no;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
	}

	@Override
	public String toString() {
		return "FreeBoardFile [free_board_file_no=" + free_board_file_no + ", free_board_no=" + free_board_no
				+ ", original_filename=" + original_filename + ", renamed_filename=" + renamed_filename + "]";
	}

	public int getFree_board_file_no() {
		return free_board_file_no;
	}

	public void setFree_board_file_no(int free_board_file_no) {
		this.free_board_file_no = free_board_file_no;
	}

	public int getFree_board_no() {
		return free_board_no;
	}

	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
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
