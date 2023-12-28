package com.ezen.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.domain.ReservationVO;

import lombok.extern.log4j.Log4j;



@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class BookServiceTests {

	
	@Autowired
	BookService bookService;

	
	
	
	@Test
	public void total() {
		String memberid = "last";
		log.info(bookService.getTotalReservation(memberid));
	}
	
	@Test
	public void popularList() {
		String memberid = "last";
		Criterial criterial = new Criterial();
		List<BookVO> list = new ArrayList<>();
		
		
		list = bookService.getBooksByReservations(memberid, criterial);
		
		for (BookVO bookVO : list) {
			log.info(bookVO);
		}
	}
	
	@Test
	public void pastreservation() {
		String memberid = "last";
		Criterial cri = new Criterial();
		log.info(bookService.getPastReservations(memberid, cri));
		log.info("total >>>>" +  bookService.getTotalPastReservation(memberid));
		
		// log.info(new PageDTO(cri, bookService.getTotalReservation(memberid)));
		
		
		
	}
}
