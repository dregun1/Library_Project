package com.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.ReservationVO;
import com.ezen.domain.WishListVO;

public interface BookMapper {
	
	public BookVO read(String isbn);
	public int insertBook(BookVO book);
	public int delete(String isbn);
	public int updateBook(BookVO book);
	public List<BookVO> getListWithPaging(Criterial cri);
	public List<BookVO> getListWithPagingByPdate(Criterial cri);
	public List<BookVO> getListWithPagingByRentalCnt(Criterial cri);
	public int getTotalBookCount(Criterial cri);
	//예약리스트 추가.
	public void insertReservation(ReservationVO vo);
	
	//예약했을 때 book테이블 몇개 추가 업데이트
	public void BookReservationUpdate(ReservationVO vo);
	
	//예약했을 때 book테이블 몇개 삭제 업데이트
	public void BookReservationCancelUpdate(ReservationVO vo);
	
	//이게 null이어야지 예약한 적이 없는 거야.
	public String selectReservation(ReservationVO vo);
	
	//Curbookcnt가 0이면 예약할 수 있는 수량이 없는 거야.
	public int selectCurbookcnt(ReservationVO vo);
	
	//이게 5이하여지 예약할 수 있는거야;
	public int CurReservatinCount(ReservationVO vo);
	
	//예약리스트
	public List<BookVO> getBooksByReservations(@Param("memberid") String memberid, @Param("cri") Criterial cri);
	
	//지난 예약리스트
	public List<BookVO> getPastReservations(@Param("memberid") String memberid, @Param("cri") Criterial cri);
	
	//예약리스트 총행 갯수
	public int getTotalReservation(String memberid);
		
	//지난 예약리스트 총행 갯수
	public int getTotalPastReservation(String memberid);
		
	//해당 예약테이블 삭제
	public void updateReservation(ReservationVO vo);
	
	//지난 예약목록 삭제.
	public void deleteReservation(ReservationVO vo);
	
	//관심도서 추가.
	public void insertInterested(WishListVO vo);
	
	
	//관심도서 리스트
	public List<BookVO> getInterested(@Param("memberid") String memberid, @Param("cri") Criterial cri);
	
	//관심도서 총갯수
	public int getTotalInterested(String memberid);
	
	//이게 null이어야지 예약한 적이 없는 거야.
	public String selectInterested(WishListVO vo);
	
	//관심도서 삭제.
	public void deleteInterested(WishListVO vo);
	
	
	//대여리스트
	public List<BookVO> getRentalList(@Param("memberid") String memberid, @Param("cri") Criterial cri);
		
	//대여리스트 총행 갯수
	public int getTotalRental(String memberid);
	
	//연장횟수 갯수
	public int selectExtensionCount(String rentallist);
	
	//연장하기
	public void Extension(String rentallist);
	
	//반납리스트
	public List<BookVO> getReturnList(@Param("memberid") String memberid, @Param("cri") Criterial cri);
			
	//반납리스트 총행 갯수
	public int getTotalReturn(String memberid);
	
	//반납된 행 삭제
	public void deleteReturn(String rentallistid);
}