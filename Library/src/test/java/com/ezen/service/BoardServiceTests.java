package com.ezen.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.BoardVO;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class BoardServiceTests {

	@Autowired
	BoardService service;
	
	@Test
	public void registerList() {
		BoardVO vo = new BoardVO();
		
		vo.setBcontent("설마");
		vo.setBtitle("설마");
		vo.setMemberid("ex1");
		
		service.listRegister(vo);
	}
	
	@Test
	public void getBoard() {
		BoardVO vo = new BoardVO();
		vo = service.get(2159);
		log.info(vo);
		
	}

}
