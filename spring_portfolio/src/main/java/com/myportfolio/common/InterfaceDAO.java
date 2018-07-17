package com.myportfolio.common;

import java.util.ArrayList;

import com.myportfolio.proc.eateryVO;
import com.myportfolio.proc.searchVO;

public interface InterfaceDAO {
	
	// 검색 페이지의 식당 검색 결과
	public ArrayList<searchVO> search_eatery(String search);
	// 검색 페이지의 리뷰 검색 결과
	public ArrayList<searchVO> search_review(String search);
	
	//식당 페이지 식당 리스트
	public ArrayList<eateryVO> select_eatery();
	
	//식당 상세보기 
	public eateryVO select_eatery_view(int num);
	
	//식당 추가
	public int insert_eatery(String eatery_kind,String eatery,String t_contents,String phon,String business_hours,String daumaddress,String reg_date,String file_name);
}
