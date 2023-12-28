package com.ezen.mapper;

import java.util.List;


import com.ezen.domain.Criterial;
import com.ezen.domain.BookReportVO;



public interface BookReportMapper{

	//페이징
	public List<BookReportVO> getListWithPaging(Criterial cri);
	
	//독후감 등록
	public boolean listRegister(BookReportVO vo);
	
	//총 독후감 수
	public int getTotalCount();
	
	//독후감 조회
	public BookReportVO get(String reportid);
	
	//독후감 삭제
	public void listDelete(BookReportVO vo);
	
	//독후감 업데이트
	public void listUpdate(BookReportVO vo);
	
	//조회수 +1
	public void readCntUpdate(String boardid);
}
