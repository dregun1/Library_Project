package com.ezen.mapper;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.RentalListVO;

public interface RentalListMapper {

	//전체 데이터 조회
	public List<RentalListVO> getList();
	
	//페이징 처리
	public List<RentalListVO> getListWithPaging(Criterial cri);
	
	//rentallistid로 데이터 조회
	public RentalListVO read(String rentallistid);
	
	//rentallistid로 데이터 삭제
	public int delete(String rentallistid);
	
	// 데이터 등록
    public int insert(RentalListVO rental);

    // 데이터 수정
    public int update(RentalListVO rental);
	
	//책보유수량여부 확인
	public int checkBook(String isbn);
	
	//구독권보유 여부확인
	public int checkSub(String memberid);
	
	// 전체 데이터 수 조회
    public int getTotal(Criterial cri);
	
}
