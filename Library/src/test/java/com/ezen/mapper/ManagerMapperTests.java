package com.ezen.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class ManagerMapperTests {

	@Autowired
	ManagerMapper managermapper;
	
	@Test
	public void test() {
		
		String memberid = "last";
		String isbn = "9791169307567";
		
		managermapper.addrental(memberid, isbn);
		managermapper.updateRentalStatus(memberid, isbn);
		managermapper.updateBooktable(isbn);
	}

}
