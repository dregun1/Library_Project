package com.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.MemberVO;
import com.ezen.domain.RentalListVO;
import com.ezen.domain.ReservationVO;

public interface ManagerMapper {
	
	//관리자 페이지 예약조회
	public List<ReservationVO> getManagerReservation(Criterial cri);
	
	//예약리스트 총 갯수
	public int getReservationTotal(Criterial cri);
	
	public void updateCancelReservation(int id);
	
	//대여 추가
	public void addrental(@Param("memberid") String memberid, @Param("isbn") String isbn);
	
	//reservation테이블 rental_status 1로 바꾸기
	public void updateRentalStatus(@Param("memberid") String memberid, @Param("isbn") String isbn);
	
	//book테이블 예약수량과 대여수량업데이트
	public void updateBooktable( @Param("isbn") String isbn);
	
	// 관리자 페이지 대여 중인 리스트
	public List<RentalListVO> getManagerRentallists(Criterial cri);
	
	//대여 중인 리스트 총갯수
	public int getCurRentalTotal(Criterial cri);
	
	//책 반납하고 나서 대여리스트 수정
	public void returnBook(@Param("memberid") String memberid, @Param("isbn") String isbn);
	
	//책 반납하고나서 북 테이블 수정
	public void returnAfterBook(@Param("isbn") String isbn);
	
	//반납기간 연장
	public void extensionReturnDate(@Param("memberid") String memberid, @Param("isbn") String isbn);
	
	//관리자 페이지 지난 대여 리스트
	public List<RentalListVO>getPastRentallists(Criterial cri);
		
	//지난 대여 리스트 총갯수
	public int getPastRentalTotal(Criterial cri);
	
	//연체 리스트
	public List<RentalListVO> getOverdueList(Criterial cri);
	
	//연체 총 갯수
	public int getOverdueTotal(Criterial cri);
	
	//폐기처리
	public void discardBook(@Param("isbn") String isbn);
	
	//폐기처리2
	public void deleteDiscard(@Param("rentallistid") String rentallistid);
	
	//도서 수정
	public void updateBook(BookVO book);
	
	//일반회원 리스트
	public List<MemberVO> getGeneralMember(Criterial cri);
		
	//일반회원 수 
	public int GeneralMemberTotal(Criterial cri);
	
	//관리자회원 리스트
	public List<MemberVO> getManagementMember(Criterial cri);
			
	//관리자회원 수 
	public int ManagementMemberTotal(Criterial cri);
	
	//관리자권한 부여
	public void changeMemberflag(@Param("memberid") String memberid);
	
	//관리자권한 박탈
		public void cancelMemberflag(@Param("memberid") String memberid);
	
}