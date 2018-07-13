package com.myportfolio.proc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Process {
	DataSource dataSource;
	 
	 public Process() {
		 try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysqlkss");
		 }catch(Exception e) {
			 System.out.println("============DB 연결 실패 =====================");
		 }
	 }
	// 등록, 저장	 
	 public int executeInsert(String sQuery) 
	   {
	      Connection          con      = null;
	      ResultSet	    	  rs	   = null;
	      PreparedStatement   ps       = null;
			int result = 0;
	      try
			{
				con = dataSource.getConnection();
				ps  = con.prepareStatement(sQuery);		
				result = ps.executeUpdate();
					
			}catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("============DB 연결 실패(등록) =====================");
			 }finally {
				 try {
					 if(rs != null) rs.close();
					 if(ps != null) ps.close();
					 if(con != null) con.close();
				 }catch(Exception e){
					 e.printStackTrace();
					 System.out.println("============DB 연결 실패(등록2) =====================");
				 }
			 }
			return result;
		}
	 
	// 조회(String)
	   public String executeQuerySearch(String sQuery) {
			Connection          con      = null;
			ResultSet	    	rs	     = null;
			PreparedStatement   ps       = null;
			String result = null;
			try{
				con = dataSource.getConnection();
				ps  = con.prepareStatement(sQuery);		
				rs = ps.executeQuery();
				while (rs.next()) {
					result = rs.getString(1);
				}	
			}catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("============DB 연결 실패(조회) =====================");
			 }finally {
				 try {
					 if(rs != null) rs.close();
					 if(ps != null) ps.close();
					 if(con != null) con.close();
				 }catch(Exception e){
					 e.printStackTrace();
					 System.out.println("============DB 연결 실패(조회2) =====================");
				 }
			 }
			return result;
		}
	// 조회( return String[])	
	   public String[] executeQuerySearch1(String sQuery) 
	   {
			Connection          con      = null;
			ResultSet	    	rs	     = null;
			PreparedStatement   ps       = null;
			String[] result = null ;
			int rc2 =0;
			try{
				con = dataSource.getConnection();
				ps  = con.prepareStatement(sQuery);		
				rs = ps.executeQuery();
				
				ResultSetMetaData rsmd = rs.getMetaData(); 
	 			int cols = rsmd.getColumnCount(); //컬럼의 총개수
	 			//int rc2 =0;

				result = new String[cols];
		
				while (rs.next()) {
					 for (int i = 1; i <= cols; i++) {
						 result[i-1] = rs.getString(i);	
					 }
					 rc2++;
				}
				
			}catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("============DB 연결 실패(1차배열 조회) =====================");
			 }finally {
				 try {
					 if(rs != null) rs.close();
					 if(ps != null) ps.close();
					 if(con != null) con.close();
				 }catch(Exception e){
					 e.printStackTrace();
					 System.out.println("============DB 연결 실패(1차배열 조회2) =====================");
				 }
			 }
			if(rc2 == 0) return null;
			return result;
		}
	// 조회( return String[][])
	   public String[][] executeQuerySearch2(String sQuery) 
	   {
			Connection          con      = null;
			ResultSet	    	  rs	     = null;
			PreparedStatement   ps       = null;
			String[][] result = null;
			int rc2 =0;
			try{
				con = dataSource.getConnection();
				ps  = con.prepareStatement(sQuery, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

				rs = ps.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int cols = rsmd.getColumnCount(); //컬럼의 총개수
				rs.last(); // 끝으로 와서
				int rowCount = rs.getRow(); // 카운트세고
				rs.beforeFirst(); // 다시 맨앞으로
				result = new String[rowCount][cols];
				while (rs.next()) {
					 for (int i = 1; i <= cols; i++) {
						 result[rc2][i-1] = rs.getString(i);	
					 }
					 rc2++;
				}
			}catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("============DB 연결 실패(2차배열 조회) =====================");
			 }finally {
				 try {
					 if(rs != null) rs.close();
					 if(ps != null) ps.close();
					 if(con != null) con.close();
				 }catch(Exception e){
					 e.printStackTrace();
					 System.out.println("============DB 연결 실패(2차배열 조회2) =====================");
				 }
			 }
			if(rc2 == 0) return null;
			return result;
			
		}
	 
}
