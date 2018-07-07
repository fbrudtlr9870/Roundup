package com.proj.rup.member.model.vo;

public class QuestionFile {

	private int question_file_no;
	private int question_no;
	private String original_filename;
	private String renamed_filename;
	
	
	public QuestionFile() {
		super();
	}

	public QuestionFile(int question_file_no, int question_no, String original_filename, String renamed_filename) {
		super();
		this.question_file_no = question_file_no;
		this.question_no = question_no;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
	}
	

	public QuestionFile(int question_no, String renamed_filename) {
		super();
		this.question_no = question_no;
		this.renamed_filename = renamed_filename;
	}

	@Override
	public String toString() {
		return "FreeBoardFile [question_file_no=" + question_file_no + ", question_no=" + question_no
				+ ", original_filename=" + original_filename + ", renamed_filename=" + renamed_filename + "]";
	}

	public int getQuestion_file_no() {
		return question_file_no;
	}

	public void setQuestion_file_no(int question_file_no) {
		this.question_file_no = question_file_no;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
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
