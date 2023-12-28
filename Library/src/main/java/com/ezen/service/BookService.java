package com.ezen.service;

import java.util.List;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.ReservationVO;

public interface BookService {
	
	public List<BookVO> getListWithPaging(Criterial cri);
	public List<BookVO> getListWithPagingByPdate(Criterial cri);
	public List<BookVO> getListWithPagingByRentalCnt(Criterial cri);
	public BookVO get(String isbn);
	public void register(BookVO book);
	public boolean modify(BookVO book);
	public boolean remove(String isbn);
	public int getTotalBookCount(Criterial cri);

	
	//책 예약버튼 누르면 해야 할 업데이트.
	public void UpdateReservation(ReservationVO vo);
	
	//예약리스트 보기.
	public List<BookVO> getBooksByReservations(String memberid, Criterial cri);
	
	//지난 예약리스트 보기.
	public List<BookVO> getPastReservations(String memberid, Criterial cri);
	
	//예약리스트 총갯수.
	public int getTotalReservation(String memberid);
	
	//지난 예약리스트 총갯수.
	public int getTotalPastReservation(String memberid);
	
	//책 예약취소 누르면 해야 할 업데이트.
	public void UpdateCacelReservation(ReservationVO vo);
}
