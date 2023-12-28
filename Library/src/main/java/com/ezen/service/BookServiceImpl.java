package com.ezen.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.ReservationVO;
import com.ezen.mapper.BookMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {

	private final BookMapper bookMapper;
	
	
	@Override
	public List<BookVO> getListWithPaging(Criterial cri) {
		log.info("getListWithPaging  >> " + cri );
		
		return bookMapper.getListWithPaging(cri);
	}
	
	//신규리스트 보기
	@Override
	public List<BookVO> getListWithPagingByPdate(Criterial cri) {
		log.info("getListWithPagingByPdate  >> " + cri );
		return bookMapper.getListWithPagingByPdate(cri);
	}
	
	//인기리스트 보기
	@Override
	public List<BookVO> getListWithPagingByRentalCnt(Criterial cri) {
		log.info("getListWithPagingByRentalCnt  >> " + cri );
		return bookMapper.getListWithPagingByRentalCnt(cri);
	}

	@Override
	public BookVO get(String isbn) {
		log.info("getBookVO >> " + isbn);
		return bookMapper.read(isbn);
	}

	@Override
	public void register(BookVO book) {
		log.info("register Book >> " + book);

		String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        book.setRegistereddate(currentDate);
		book.setCumrentalcnt(0);
		bookMapper.insertBook(book);
	}

	@Override
	public boolean modify(BookVO book) {
		log.info("modify Book >> " + book);
		return bookMapper.updateBook(book) == 1 ? true : false;
	}

	@Override
	public boolean remove(String isbn) {
		log.info("delete Book >> " + isbn);
		return bookMapper.delete(isbn) == 1 ? true :false;
	}

	@Override
	public int getTotalBookCount(Criterial cri) {
		log.info("Get total bookCount >> " );
		return bookMapper.getTotalBookCount(cri);
	}

	
	//책 예약버튼 누르면 해야할 업데이트.
	@Override
	public void UpdateReservation(ReservationVO vo) {
		bookMapper.insertReservation(vo);
		bookMapper.BookReservationUpdate(vo);
	}
	
	//책 예약취소 버튼 누르면 해야 할 업데이트.
	@Override
	public void UpdateCacelReservation(ReservationVO vo) {
		bookMapper.BookReservationCancelUpdate(vo);
		bookMapper.updateReservation(vo);		
	}

	//예약리스트 보기.
	@Override
	public List<BookVO> getBooksByReservations(String memberid, Criterial cri) {
		return bookMapper.getBooksByReservations(memberid, cri);
	}
	
	//지난 예약리스트 보기.
	@Override
	public List<BookVO> getPastReservations(String memberid, Criterial cri) {
		return bookMapper.getPastReservations(memberid, cri);
	}
	
	

	//예약리스트 행갯수.
	@Override
	public int getTotalReservation(String memberid) {
		return bookMapper.getTotalReservation(memberid);
	}
	
	//지난 예약리스트 행갯수.
	@Override
	public int getTotalPastReservation(String memberid) {
		return bookMapper.getTotalPastReservation(memberid);		
	}

	

	


}
