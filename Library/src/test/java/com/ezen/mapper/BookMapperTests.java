package com.ezen.mapper;



import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.ReservationVO;


import lombok.extern.log4j.Log4j;



@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class BookMapperTests {

	@Autowired
	BookMapper bookmapper;
	
	@Test
	public void totalres() {
		
		String memberid = "last";
		
		log.info(bookmapper.getTotalReservation(memberid));
	}

	
	@Test
	public void popularList() {
		String memberid = "last";
		Criterial criterial = new Criterial();
		List<BookVO> list = new ArrayList<>();
		list = bookmapper.getBooksByReservations(memberid, criterial);
		
		for (BookVO bookVO : list) {
			log.info(bookVO);
		}
	}
	

	@Test
	public void faileTest() {
		ReservationVO vo = new ReservationVO();
		vo.setMemberid("last");
		vo.setIsbn("9791127872786");
		
		log.info("1 >>> " + bookmapper.selectReservation(vo));
		log.info("2 >>> " + bookmapper.selectCurbookcnt(vo));
		log.info("3 >>> " + bookmapper.CurReservatinCount(vo));
	}
	
	@Test
	public void getTotalwishlist() {
		String memberid = "last";
		
		log.info(bookmapper.getTotalInterested(memberid));
	}
	
	
	
	
	
	

	
}
