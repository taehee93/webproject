package com.myportfolio.proc;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ToDate {
	
	public String todate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date = formatter.format(new Date());
		return date;
	}
}
