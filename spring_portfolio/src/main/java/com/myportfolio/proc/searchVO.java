package com.myportfolio.proc;

public class searchVO {
	String title;
	String cont;
	String reg_date;
	int no;
	
	public searchVO(){
		
	}
	
	public searchVO(String title,String cont,String reg_date,int no) {
		this.title=title;
		this.cont=cont;
		this.reg_date=reg_date;
		this.no=no;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
}
