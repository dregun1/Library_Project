package com.ezen.mapper;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.ReturnRequestVO;

public interface ReturnRequestMapper {

	//전체 데이터 조회
	public List<ReturnRequestVO> getList();
	
	//페이징 처리
	public List<ReturnRequestVO> getListWithPaging(Criterial cri);
	
	//데이터 삭제
	public int delete(String returnrequestid);
	
	//데이터 등록
	public int insert(ReturnRequestVO returnRequest);

	//데이터 조회
	public ReturnRequestVO read(String returnrequestid);

	//총 데이터
	public int getTotal(Criterial cri);
	
}
